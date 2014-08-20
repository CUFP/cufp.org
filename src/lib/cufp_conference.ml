open Core.Std
open Async.Std
module Event = Cufp_event
module Html = Cufp_html
module Person = Cufp_person
module Slides = Cufp_slides
module Util = Cufp_util
module Video = Cufp_video
let (/) = Filename.concat

type t = {
  year : int;
  events : Event.t list;
}

let first_year = 2004

let years ~repo_root () =
  let dir = repo_root/"src"/"site" in
  Sys.ls_dir dir >>=
  Deferred.List.filter ~f:(fun file ->
    (Sys.is_directory (dir/file) >>| function
    | `No | `Unknown -> false
    | `Yes -> true
    ) >>| fun is_directory ->
    is_directory && (Util.is_YYYY file)
  ) >>|
  List.map ~f:Int.of_string


(******************************************************************************)
(* Printers                                                                   *)
(******************************************************************************)

let events_table ?date {events; _} =
  let open Html in

  let events : Event.t list = match date with
    | None ->
      events
    | Some date ->
      List.filter events ~f:(fun x ->
        Date.equal x.Event.date date
      )
  in

  let time ({Event.start; finish; _} : Event.t) =
    td [data (Util.time_ofday_range_to_string start finish)]
  in

  let title (s:Event.t) =
    let open Event in
    match s.typ with
    | Break | Discussion ->
      td [
        span [
          data (sprintf "%s%s"
                  s.title
                  (match short_description s with
                  | "" -> ""
                  | x -> " – " ^ x
                  )
          )
        ];
      ]
    | Talk
    | Keynote
    | Tutorial
    | BoF ->
      td (
        (icon s.typ)
        ::(data " ")
        ::(a ~a:["href", s.url_title ^ ".html"] [data s.title])
        ::(match s.video with
        | None -> []
        | Some x -> [
          data " ";
          a ~a:Video.(["href", to_uri x; "class", icon_class x]) [];
        ])
        @(match s.slides with
        | None -> []
        | Some x -> [
          data " ";
          a ~a:Slides.(["href", to_uri x; "class", icon_class x]) [];
        ])
      )
  in

  let speakers {Event.speakers; _} =
    td [Person.to_html_ul speakers];
  in

  let tr_of_event ({Event.typ; _} as x) =
    tr ~a:["class", Event.typ_to_string typ] [
      time x;
      title x;
      speakers x;
    ]
  in

  let speaker_hdr =
    List.map events ~f:(fun x -> List.length x.Event.speakers)
    |> fun l ->
      if List.(exists l ~f:((=) 1) && exists l ~f:(fun x -> x > 1)) then
        "Speaker(s)"
      else if List.for_all l ~f:(fun x -> x > 1) then
        "Speakers"
      else
        "Speaker"
  in

  table ~a:["class", "event"] [
    thead [
      tr [
        th [data "Time"];
        th [data "Title"];
        th [data speaker_hdr];
      ]
    ]
    ;
    tbody (List.map events ~f:tr_of_event)
  ]

let videos_page tl =
  let open Html in

  let video_html year (s:Event.t) : Html.item option =
    let open Event in
    let url = sprintf "/%d/%s.html" year s.url_title in
    Option.map s.video ~f:(fun video ->
      div ~a:["class","row"] [
        div ~a:["class", "medium-6 columns"] [
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
          ]
        ];
        div ~a:["class", "medium-6 columns"] [
          h2 [
            a ~a:["href", url] [data s.title]
          ];
          div [Person.to_html_ul s.speakers];
          div ~a:["class","date"] [data (Date.format s.date "%B %d, %Y")];
        ];
      ]
    )
  in

  (* Return None if given conference has no videos. *)
  let conference_html {events; year} : Html.item option =
    List.filter_map events ~f:(video_html year)
    |> function
      | [] -> None
      | event_videos -> (
        let id = sprintf "cufp%d" year in
        dd [
          a ~a:["href", sprintf "#%s" id] [data (sprintf "CUFP %d" year)];
          div ~a:["id",id; "class","content"] event_videos;
        ]
        |> Option.some
      )
  in

  List.sort tl ~cmp:(fun a b -> Int.compare b.year a.year)
  |> List.filter_map ~f:conference_html
  |> dl ~a:["class","accordion"; "data-accordion", ""]



(******************************************************************************)
(* Parsers                                                                    *)
(******************************************************************************)
let of_dir dir =
  let year = Int.of_string (Filename.basename dir) in
  Sys.readdir dir >>=
  Util.lift Array.to_list >>= fun l ->
  return (List.filter l ~f:Event.is_valid_filename) >>=
  Deferred.List.map ~f:(fun file -> Event.of_file (dir/file))
  >>= fun events ->
  let events_with_url = (* events for which a URL will be assigned *)
    List.filter events ~f:(fun x ->
      let open Event in
      match x.typ with
      | Break | Discussion -> false
      | Talk | Keynote | Tutorial | BoF -> true
    )
  in
  let urls =
    List.map events_with_url ~f:(fun x -> x.Event.url_title)
    |> List.dedup
  in
  if List.length urls <> List.length events_with_url then
    failwithf "%s: event url titles are not unique" dir ()
  else
    return {year; events}
