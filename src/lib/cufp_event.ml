open Core.Std
open Async.Std
module Disqus = Cufp_disqus
module Html = Cufp_html
module Markdown = Cufp_markdown
module Person = Cufp_person
module Util = Cufp_util
module Slides = Cufp_slides
module Video = Cufp_video
let (/) = Filename.concat

type typ = Talk | Keynote | Tutorial | BoF | Break
with sexp

type t = {
  typ : typ;
  title : string;
  url_title : string;
  date : Date.t;
  start : Time.Ofday.t;
  finish : Time.Ofday.t;
  speakers : Cufp_person.t list;
  video : Cufp_video.t option;
  slides: Cufp_slides.t option;
  description : Omd.t;
}

type file_name_info = {
  url_title : string;
  date : Date.t;
  start : Time.Ofday.t;
  finish : Time.Ofday.t;
}


(******************************************************************************)
(* Printers                                                                   *)
(******************************************************************************)
let typ_to_string typ =
  sexp_of_typ typ |> Sexp.to_string |> String.map ~f:Char.lowercase

let to_file (t:t) dir =
  let start = Time.Ofday.to_parts t.start in
  let finish = Time.Ofday.to_parts t.finish in
  let filename = sprintf "%04d-%02d-%02d_%02d%02d_%02d%02d_%s.md"
    (Date.year t.date)
    (Date.month t.date |> Month.to_int)
    (Date.day t.date)
    start.Time.Span.Parts.hr
    start.Time.Span.Parts.min
    finish.Time.Span.Parts.hr
    finish.Time.Span.Parts.min
    t.url_title
  in
  let out_file = dir/filename in
  let md =
    let open Omd in
    Ul (
      [Text (sprintf "type: %s" (typ_to_string t.typ))]::
      [Text (sprintf "title: %s" t.title)]::
      [Text (
        List.map t.speakers ~f:(fun x -> x.Person.name)
        |> String.concat ~sep:","
        |> sprintf "speakers: %s"
       )
      ]::
      [Text (
        List.map t.speakers ~f:(fun x -> x.Person.affiliation)
        |> List.map ~f:(function None -> "" | Some x -> x)
        |> String.concat ~sep:","
        |> sprintf "affiliations: %s"
       )
      ]::
      [Text (
        List.map t.speakers ~f:(fun x -> x.Person.link)
        |> List.map ~f:(function None -> "" | Some x -> x)
        |> String.concat ~sep:","
        |> sprintf "links: %s"
       )
      ]::
      [Text (sprintf "video: %s" (
        Option.value_map t.video ~default:"" ~f:Video.to_string))
      ]::
      [Text (sprintf "slides: %s" (
        Option.value_map t.slides ~default:"" ~f:Slides.to_string))
      ]::
      []
    )
    ::t.description
  in
  Unix.mkdir ~p:() dir >>= fun () ->
  Writer.save out_file ~contents:(Omd.to_markdown md)


let icon typ =
  (match typ with
  | Talk | Keynote -> "fi-microphone"
  | Tutorial -> "fi-laptop"
  | BoF -> "flaticon-pen43"
  | Break ->
    failwithf "icon undefined for event typ: %s"
      (typ_to_string typ) ()
  ) |> fun x ->
  Html.i ~a:["class", x] []


let to_html t =
  let open Html in
  [div ~a:["class","row"] [
    div ~a:["class","small-12 columns"] (
      [
        h1 [icon t.typ; data " "; data t.title];
        div ~a:["class","speakers"] [Person.to_html_ul t.speakers];
        div ~a:["class","time"] [
          data (Date.format t.date "%B %d, %Y");
          data " ";
          data (Util.time_ofday_range_to_string t.start t.finish);
        ];
      ]
      @(match t.slides with
      | None -> []
      | Some x -> [
        div ~a:["class","slides"] [
          i ~a:["class", Slides.icon_class x] [];
          data " ";
          a ~a:["href", Slides.to_uri x] [data "Slides"];
        ]]
      )
      @(Omd.to_html t.description |> Html.parse)
      @(match t.video with
      | None -> []
      | Some video -> [
        div ~a:["class","flex-video"] [
          iframe ~a:[
            "src", Video.to_embed_uri video;
            "width", "420";
            "height", "315";
            "frameborder", "0";
            "webkitallowfullscreen", "";
            "mozallowfullscreen", "";
            "allowfullscreen", "";
          ] [];
        ]]
      )
      @(Disqus.html)
    ) ] ]

let break_description {typ; description; _ } =
  match typ with
  | Break -> (match description with
    | [Omd.NL; Omd.Paragraph [Omd.Text description]] ->
      String.strip description
    | [] -> ""
    | _ ->
      failwith "break event content expected to be short text only"
  )
  | _ -> failwith "break_description called on non-Break event typ"



(******************************************************************************)
(* Parsers/Constructors                                                       *)
(******************************************************************************)
let typ_of_string s =
  match String.lowercase s with
  | "talk" -> Talk
  | "keynote" -> Keynote
  | "tutorial" -> Tutorial
  | "bof" -> BoF
  | "break" -> Break
  | _ -> failwithf "%s is not valid a event type" s ()

let parse_filename s =
  if not (Filename.check_suffix s ".md") then
    failwithf "event file %s doesn't have a .md extension" s ()
  else
    let s' = Filename.chop_suffix s ".md" |> Filename.basename in
    match String.split ~on:'_' s' with
    | date::start::finish::(_::_ as rest) ->
      {
        url_title = String.concat ~sep:"_" rest;
        date = Date.of_string date;
        start = Time.Ofday.of_string start;
        finish = Time.Ofday.of_string finish;
      }
    | _ ->
      failwithf "event file %s not in expected format" s ()

let is_valid_filename s =
  try ignore (parse_filename s); true
  with Failure _ | Invalid_argument _ -> false

let make
    ~typ ~title ~url_title
    ~date ~start ~finish ~speakers ~video ~slides
    ~description ()
    =
  if not (Util.is_url_string url_title) then
    failwithf "invalid url_title %s" url_title ()
  else
    {
      typ; title; url_title;
      date; start; finish; speakers; video; slides;
      description;
    }

let of_markdown ~filename omd =
  let expected_fields = String.Set.of_list
    ["type"; "title"; "speakers"; "affiliations";
     "links"; "video"; "slides";]
  in

  let {url_title; date; start; finish} = parse_filename filename in

  match omd with
  | ul::description -> (
    Markdown.parse_assoc_list ul
    |> fun ul ->
      let got_fields = List.map ul ~f:fst |> String.Set.of_list in
      if not (Set.subset got_fields expected_fields) then
        failwithf "%s: unexpected fields: %s"
          filename
          (
            Set.diff got_fields expected_fields
            |> Set.to_list
            |> String.concat ~sep:", "
          )
          ()
      else
        make
          ~typ:(
            List.Assoc.find_exn ul "type"
            |> typ_of_string
          )
          ~title:(List.Assoc.find_exn ul "title")
          ~url_title
          ~date
          ~start
          ~finish
          ~speakers:(
            Person.of_strings
              ?names:(List.Assoc.find ul "speakers")
              ?affiliations:(List.Assoc.find ul "affiliations")
              ?links:(List.Assoc.find ul "links")
              ()
          )
          ~video:(
            List.Assoc.find ul "video"
            |> Option.map ~f:(fun x -> x |> String.strip |> Video.of_string)
          )
          ~slides:(
            List.Assoc.find ul "slides"
            |> Option.map ~f:(fun x -> x |> String.strip |> Slides.of_string)
          )
          ~description
          ()
  )
  | _ -> failwithf "%s: invalid markdown schema" filename ()

let of_string ~filename s =
  of_markdown ~filename (Omd.of_string s)

let of_file filename =
  Reader.file_contents filename >>|
  of_string ~filename
