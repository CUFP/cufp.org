open Core.Std
open Async.Std
module Blog = Cufp_blog
module Html = Cufp_html
module Markdown = Cufp_markdown
module Person = Cufp_person
module Session = Cufp_session
module Slides = Cufp_slides
module Util = Cufp_util
let (/) = Filename.concat

type news
type user
type session
type node

type 'a item = Yojson.Basic.json String.Map.t
type 'a t = 'a item list

let of_file file =
  Reader.file_contents file >>|
  String.split ~on:'}' >>|
  (fun l ->
    let n = List.length l in
    match List.nth l (n-1) with
    | None -> l
    | Some ("" | "\n") -> List.take l (n-1)
    | Some _ -> failwith "unexpected last element"
  ) >>|
  List.map ~f:(fun s ->
    s ^ "}"
    |> Yojson.Basic.from_string
    |> function
      | `Assoc al -> String.Map.of_alist_exn al
      | _ -> failwith "expected JSON object"
  )

let get_types il =
  List.fold il ~init:String.Set.empty ~f:(fun s m ->
    Set.add s
      (Map.find_exn m "type"
       |> function
         | `String x -> x
         | _ -> assert false
      )
  )
  |> Set.to_list

let get_fields il =
  List.fold il ~init:String.Set.empty ~f:(fun s m ->
    Map.fold m ~init:s ~f:(fun ~key ~data:_ s -> Set.add s key)
  )
  |> Set.to_list

let filter_by_type il typ =
  List.filter il ~f:(fun i ->
    match Map.find i "type" with
    | Some (`String x) -> x = typ
    | Some _ -> failwith "expected \"type\" field to have a string value"
    | None -> failwith "expected \"type\" field in all JSON objects"
  )

let get_news il = filter_by_type il "news"
let get_nodes il = filter_by_type il "node"
let get_sessions il = filter_by_type il "session"
let get_users il = filter_by_type il "user"

let get_field_string i field = match Map.find i field with
  | Some (`String x) -> x
  | Some _ -> failwithf "expected %s to have string value" field ()
  | None -> failwithf "field %s not found" field ()

let get_field_string_opt i field = match Map.find i field with
  | Some (`String x) -> Some x
  | Some _ -> failwithf "expected %s to have string value" field ()
  | None -> None

let get_field_string_list i field = match Map.find i field with
  | Some (`List l) -> List.map l ~f:(function
    | `String x -> x
    | _ -> failwithf "expected %s to have string list value" field ()
  )
  | Some _ -> failwithf "expected %s to have list value" field ()
  | None -> failwithf "field %s not found" field ()

let get_field_string_list_opt i field = match Map.find i field with
  | Some (`List l) -> List.map l ~f:(function
    | `String x -> x
    | _ -> failwithf "expected %s to have string list value" field ()
  ) |> Option.some
  | Some _ -> failwithf "expected %s to have list value" field ()
  | None -> None

let at_most_fields typ = match typ with
  | "user" ->
    ["body"; "companies"; "conference-years"; "languages"; "layout";
     "regions"; "title"; "type"; "url"]
  | "session" ->
    ["body"; "companies"; "conference-years"; "file"; "layout"; "speaker";
     "time"; "title"; "type"; "url"]
  | "node" ->
    ["body"; "companies"; "conference-years"; "keywords";
     "layout"; "title"; "type"; "url"]
  | "news" ->
    ["body"; "companies"; "date"; "keywords"; "layout"; "title"; "type"; "url"]
  | x -> failwithf "unknown type %s" x ()

let convert i =
  let typ = match Map.find_exn i "type" with
    | `String x -> x
    | _ -> failwithf "type field not found" ()
  in
  let fields = String.Set.of_list (Map.keys i) in
  let check_fields typ =
    if String.Set.subset fields (String.Set.of_list (at_most_fields typ)) then
      ()
    else
      failwithf "unexpected fields in record of type %s" typ ()
  in
  match typ with
  | "session" ->
    check_fields typ;
    (* ignore fields: "companies", "conference-years" *)
    assert (get_field_string i "layout" = "session");
    assert (get_field_string i "type" = "session");
    `Session (
      let title = get_field_string i "title" in
      let date,start,finish =
        let time = get_field_string i "time" in
        match String.split ~on:' ' time |> List.map ~f:String.strip with
        | [_; month; day_comma; year; _; start; _; finish] -> (
          let year = Int.of_string year in
          let month =
            let open Month in
            match month with
            | "January" -> Jan
            | "February" -> Feb
            | "March" -> Mar
            | "April" -> Apr
            | "May" -> May
            | "June" -> Jun
            | "July" -> Jul
            | "August" -> Aug
            | "September" -> Sep
            | "October" -> Oct
            | "November" -> Nov
            | "December" -> Dec
            | _ -> failwithf "invalid month %s" month ()
          in
          let day =
            let n = String.length day_comma in
            if n < 1 || n > 3 || day_comma.[n-1] <> ',' then
              failwithf "invalid time %s" time ()
            else
              String.sub ~pos:0 ~len:(n-1) day_comma |> Int.of_string
          in
          let date = Date.of_string (
            sprintf "%04d-%02d-%02d" year (Month.to_int month) day )
          in
          let start = Time.Ofday.of_string start in
          let finish = Time.Ofday.of_string finish in
          date, start, finish
        )
        | _ -> failwithf "invalid time %s" time ()
      in
      let year = Date.year date in
      let url_title =
        let url = get_field_string i "url" in
        match String.split ~on:'/' url with
        | ["conference"; "sessions"; year'; url_title] ->
          let year' = Int.of_string year' in
          assert (year' = year);
          url_title
        | ["hidden"; "profile"; _] -> (
          String.map title ~f:(fun c -> match c with
          | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' -> c
          | _ -> '_'
          )
        )
        | _ -> failwithf "invalid url %s" url ()
      in
      let () =
        get_field_string_list_opt i "conference-year"
        |> function
          | Some [x] -> assert(Int.of_string x = year)
          | Some _ -> failwith "conference-year list length not equal to 1"
          | None -> ()
      in
      let slides =
        get_field_string_opt i "file"
        |> function
          | Some x -> Some (Slides.of_string (Filename.basename x))
          | None -> None
      in
      let description =
        get_field_string i "body"
        |> fun x ->
          if Core_extended.Std.String.is_substring ~substring:"<a" x then
              (* assume body is html *)
            Html.parse x |> Markdown.of_html
          else
              (* assume body is markdown *)
            Omd.of_string x
      in
      let speakers =
        get_field_string_opt i "speaker"
        |> function
          | None -> []
          | Some name -> [Person.make ~name ()]
      in
      let typ =
        let title_lo = String.map title ~f:Char.lowercase in
        if Core_extended.Std.String.is_substring "keynote" title_lo then
          Session.Keynote
        else if title.[0] = 'T' then
          Session.Tutorial
        else if Core_extended.Std.String.is_substring "break" url_title then
          Session.Break
        else if Core_extended.Std.String.is_substring "bofs" url_title then
          Session.BoF
        else
          Session.Talk
      in
      {
        Session.typ;
        title; url_title;
        date; start; finish;
        video = None;
        speakers; slides; description;
      }
    )
  | "news" ->
    check_fields typ;
    (* ignore fields: "companies" *)
    assert (get_field_string i "layout" = "news");
    `News (
      Blog.Post.make
        ~title:(get_field_string i "title")
        ~url_title:(
          let url = get_field_string i "url" in
          match String.split ~on:'/' url with
          | ["_posts"; x] -> (match String.split ~on:'-' x with
            | _::_::_::rest -> String.concat ~sep:"-" rest
            | _ -> failwithf "unexpected url %s" url ()
          )
          | _ -> failwithf "unexpected url %s" url ()
        )
        ?author:None
        ~pubdate:(get_field_string i "date" |> Date.of_string)
        ~description:(
          get_field_string i "body"
          |> fun x ->
            if Core_extended.Std.String.is_substring ~substring:"<a" x then
              (* assume body is html *)
              Html.parse x |> Markdown.of_html
            else
              (* assume body is markdown *)
              Omd.of_string x
        )
        ~categories:(
          get_field_string_list_opt i "keywords"
          |> Option.value_map ~default:[] ~f:Fn.id
        )
        ()
    )
  | "node" ->
    check_fields typ;
    (* ignore fields: "companies" *)
    assert (get_field_string i "layout" = "node");
    `Node (
      get_field_string i "url",
      (Omd.Ul [
        [Omd.Text (
          sprintf "year: %s"
            (get_field_string_list_opt i "conference-years"
             |> Option.value_map ~default:[] ~f:Fn.id
             |> String.concat ~sep:"," ))
        ];
        [Omd.Text (
          sprintf "keywords: %s"
            (get_field_string_list_opt i "keywords"
             |> Option.value_map ~default:[] ~f:Fn.id
             |> String.concat ~sep:"," ))
        ];
        [Omd.Text (sprintf "title: %s" (get_field_string i "title"))];
       ]
      )
      ::(Omd.of_string (get_field_string i "body"))
    )
  | "user" ->
    check_fields typ;
    `User
  | x -> failwithf "unknown type %s" x ()

let port ~root file =
  of_file file >>=
  Deferred.List.iter ~f:(fun x ->
    match convert x with
    | `Session x ->
      let year = Date.year x.Session.date |> Int.to_string in
      let out_dir = root/"src"/"site"/year in
      Session.to_file x out_dir
    | `News x ->
      let out_dir = root/"src"/"site"/"blog" in
      Blog.Post.to_file x out_dir
    | `Node (url,omd) -> (
      let out_dir = root/"src"/"site"/"node" in
      let out_file = out_dir/(url ^ ".md") in
      Omd.to_markdown omd |> fun contents ->
      Unix.mkdir ~p:() out_dir >>= fun () ->
      Writer.save out_file ~contents
    )
    | `User -> Deferred.unit (* not yet implemented *)
  )
