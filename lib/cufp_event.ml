open Core.Std
open Async.Std
let (/) = Filename.concat

type typ = Talk | Keynote | Tutorial | BoF | Break | Discussion | Reception
[@@deriving sexp_of]

type t = {
  typ : typ;
  title : string;
  url_title : string;
  date : Date.t;
  start : Time.Ofday.t;
  finish : Time.Ofday.t;
  speakers : Person.t list;
  session : string option;
  video : Video.t option;
  slides: Slides.t option;
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

let filename_base (t:t) =
  let start = Time.Ofday.to_parts t.start in
  let finish = Time.Ofday.to_parts t.finish in
  sprintf "%04d-%02d-%02d_%02d%02d_%02d%02d_%s"
    (Date.year t.date)
    (Date.month t.date |> Month.to_int)
    (Date.day t.date)
    start.Time.Span.Parts.hr
    start.Time.Span.Parts.min
    finish.Time.Span.Parts.hr
    finish.Time.Span.Parts.min
    t.url_title

let to_file (t:t) dir =
  let filename = filename_base t ^ "md" in
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
      [Text (sprintf "session: %s" (
        Option.value_map t.session ~default:"" ~f:Fn.id))
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
  let open Result.Monad_infix in
  (match typ with
  | Talk | Keynote -> Ok "fi-microphone"
  | Tutorial -> Ok "fi-laptop"
  | BoF -> Ok "flaticon-pen43"
  | Break | Discussion | Reception ->
    error "icon undefined for event typ" typ sexp_of_typ
  ) >>| fun x ->
  Html.i ~a:["class", x] []

let to_html ~years ~background_image (t:t) =
  let open Tyxml.Html in

  let date_time =
    sprintf "%s: %s"
      (Date.format t.date "%b %d, %Y")
      (Util.time_ofday_range_to_string t.start t.finish)
  in

  let speakers =
    List.map t.speakers ~f:(fun x ->
      [
        Some (pcdata x.Person.name);
        (match x.Person.affiliation with
         | None -> None
         | Some _ -> Some (pcdata " ")
        );
        Option.map x.Person.affiliation ~f:(fun x -> small [pcdata x]);
      ]
      |> List.filter_map ~f:Fn.id
      |> h4
    )
  in

  let icon = match t.typ with
    | Talk | Keynote -> "fi-projection-screen"
    | Tutorial -> "fi-laptop"
    | BoF -> "fi-lightbulb"
    | Reception -> "fi-burst"
    | Break -> failwith "attempting to create event page for Break"
    | Discussion -> failwith "attempting to create event page for Discussion"
  in

  let video =
    Option.map t.video (fun x ->
      div ~a:[a_class ["talk-video embed-container"]] [
        iframe
          ~a:[
            a_width 560;
            a_height 315;
            a_src (Video.to_embed_uri x);
            Unsafe.string_attrib "frameborder" "0";
            Unsafe.string_attrib "allowfullscreen" "";
          ]
          [];
      ]
    )
  in

  [
    header
      ~a:[
        a_class ["title-parallax"];
        a_style @@ sprintf "background-image:url('%s')" background_image;
      ]
      [Pages.menu ~years]
    ;

    div ~a:[a_class ["main-wrap"]] [
      div ~a:[a_class ["row"]] [
        div ~a:[a_class ["inner-intro"]] (
          List.concat [
            [h3 [pcdata date_time]];
            [h1 [pcdata t.title]];
            speakers;
            [div ~a:[a_class ["diamond one"]] [div [i ~a:[a_class [icon]] []]]];
          ]
        )
      ];

      div ~a:[a_class ["white-bg padded"]] [
        div ~a:[a_class ["row"]] [
          div ~a:[a_class ["main-column intro-paragraph"]] (
            List.filter_map ~f:Fn.id [
              video;
              Some (Unsafe.data (Omd.to_html t.description));
            ]
          );

          div ~a:[a_class ["sidebar"]] [
            div ~a:[a_id "disqus_thread"] [];
            script ~a:[Unsafe.string_attrib "type" "text/javascript"] (
              pcdata Disqus.script_text
            )
          ]
        ]
      ]
    ];

  ]

let short_description {typ; description; _ } =
  match typ with
  | Break | Discussion -> (
    let description = List.filter description ~f:(fun x -> x <> Omd.NL) in
    match description with
    | [Omd.Paragraph [Omd.Text description]] ->
      String.strip description
    | [] -> ""
    | _ ->
      failwith "event content expected to be short text only"
  )
  | Talk | Keynote | Tutorial | BoF | Reception ->
    failwith
      "short_description can be called only on Break or Discussion event typ"



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
  | "discussion" -> Discussion
  | "reception" -> Reception
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
    ~date ~start ~finish ~speakers ~session ~video ~slides
    ~description ()
    =
  let session = match session with
    | None -> None
    | Some "" -> None
    | Some _ -> session
  in
  if not (Util.is_url_string url_title) then
    failwithf "invalid url_title %s" url_title ()
  else
    {
      typ; title; url_title;
      date; start; finish; speakers; session; video; slides;
      description;
    }

let of_markdown ~filename omd =
  let expected_fields = String.Set.of_list
    ["type"; "title"; "speakers"; "session"; "affiliations";
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
          ~session:(
            List.Assoc.find ul "session"
            |> Option.map ~f:String.strip
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
