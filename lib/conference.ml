open Core.Std
open Async.Std
module Event = Cufp_event
let (/) = Filename.concat

type session = Cufp_event.t list

type t = {
  year : int;
  sessions : session list;
}

let session_name session =
  List.map session ~f:(fun x -> x.Event.session)
  |> List.dedup
  |> function
    | x::[] -> x
    | [] -> failwith "session contained no events"
    | _ -> failwith "session's events have differing session names"

let session_date (x:session) = (List.hd_exn x).Event.date
let session_start (x:session) = (List.hd_exn x).Event.start
let session_finish (x:session) = (List.last_exn x).Event.finish

let first_year = 2004

let years ~repo_root () =
  let dir = repo_root/"site" in
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

let session_rows session =
  let open Html in

  let event_time ({Event.start; finish; _} : Event.t) =
    data (Util.time_ofday_range_to_string start finish)
  in

  let event_title (s:Event.t) =
    let open Event in
    match s.typ with
    | Break | Discussion ->
      let short_description = match short_description s with
        | "" -> ""
        | x -> " – " ^ x
      in
      div [data (sprintf "%s%s" s.title short_description)]

    | Talk
    | Keynote
    | Tutorial
    | Reception
    | BoF ->
      let icon = match icon s.typ with
        | Ok x -> x
        | Error _ -> data ""
      in
      let title = a ~a:["href", s.url_title ^ ".html"] [data s.title] in
      let video = match s.video with
        | None -> []
        | Some x -> [
          data " ";
          a ~a:Video.(["href", to_uri x; "class", icon_class x]) [];
        ]
      in
      let slides = match s.slides with
        | None -> []
        | Some x -> [
          data " ";
          a ~a:Slides.(["href", to_uri x; "class", icon_class x]) [];
        ]
      in
      div (icon::[data " "; title]@video@slides)
  in

  let event_speakers {Event.speakers; _} =
    div [Person.to_html_ul speakers]
  in

  let event_row ({Event.typ; _} as x) =
    tr ~a:["class", Event.typ_to_string typ] [
      td [event_time x];
      td [event_title x; event_speakers x];
    ]
  in

  let session_row =
    match session_name session with
    | None -> None
    | Some name ->
      let start = session_start session in
      let finish = session_finish session in
      Some (tr ~a:["class", "session"] [
        td ~a:["colspan","2"] [
          data (Util.time_ofday_range_to_string start finish);
          span [data name];
        ] ] )
  in

  let rows =
    let event_rows = List.map session ~f:event_row in
    match session_row with
    | None -> event_rows
    | Some session_row -> session_row::event_rows
  in

  rows

let sessions_table ?date {sessions; _} =
  let sessions = match date with
    | None -> sessions
    | Some date ->
      List.filter sessions ~f:(fun s -> Date.equal date (session_date s))
  in
  List.map sessions ~f:session_rows
  |> List.concat
  |> Html.table ~a:["class", "event"]


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
  let conference_html {sessions; year} : Html.item option =
    List.concat sessions
    |> List.filter_map ~f:(video_html year)
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

let schedule t date =
  let events =
    List.concat t.sessions |>
    List.filter ~f:(fun (x:Event.t) -> Date.equal date x.Event.date) |>
    List.sort ~cmp:(fun (x:Event.t) y ->
      Time.Ofday.compare x.Event.start y.Event.start
    )
  in
  let open Tyxml.Html in
  div ~a:[a_class ["day-calendar"]] [
    div ~a:[a_class ["calendar"]; a_id "calendar1"] (
      List.map events ~f:(fun x ->
        let time =
          Util.time_ofday_range_to_string x.Event.start x.Event.finish
        in
        let description = match x.Event.typ with
          | Event.Break | Event.Discussion ->
            sprintf "%s%s"
              x.Event.title
              (match Event.short_description x with "" -> "" | x -> " - " ^ x)
          | Event.Talk
          | Event.Keynote
          | Event.Tutorial
          | Event.Reception
          | Event.BoF ->
            x.Event.title
        in
        let speakers = List.map x.Event.speakers ~f:(fun x ->
          [
            Some (pcdata x.Person.name);
            (match x.Person.affiliation with
             | None -> None
             | Some _ -> Some (pcdata " ")
            );
            Option.map x.Person.affiliation ~f:(fun x -> em [pcdata x]);
          ] |>
          List.filter_map ~f:Fn.id |>
          h6
        )
        in
        a ~a:[a_class ["event"]; a_href (x.Event.url_title ^ ".html")] [
          div ~a:[a_class ["time"]] [pcdata time];
          div ~a:[a_class ["description"]] [h2 [pcdata description]];
          div ~a:[a_class ["authors"]] speakers;
        ]
      )
    )
  ]


(******************************************************************************)
(* Parsers                                                                    *)
(******************************************************************************)

(** Group events into sessions. *)
let events_to_sessions (events : Event.t list) : session list =
  let rec loop (name,date,session,completed_sessions) = function
    | [] -> (name,date,session,completed_sessions)
    | x::events ->
      let accum =
        if (name <> x.Event.session) || (date <> x.Event.date) then
          (* event starts a new session, complete previous session *)
          x.Event.session, x.Event.date, [x], session::completed_sessions
        else
          (* add event to current session *)
          name, date, x::session, completed_sessions
      in
      loop accum events
  in
  match events with
  | [] -> []
  | x::events -> (
    let _,_,final_session,sessions =
      loop Event.(x.session,x.date,[x],[]) events
    in
    (match final_session with
    | [] -> assert false
    | _ -> final_session::sessions
    )
    |> List.map ~f:List.rev
    |> List.rev
  )

let of_dir dir =
  let year = Int.of_string (Filename.basename dir) in
  Sys.readdir dir >>=
  Util.lift Array.to_list >>= fun files ->
  return (List.filter files ~f:Event.is_valid_filename) >>=
  Deferred.List.map ~f:(fun file -> Event.of_file (dir/file))
  >>= fun events ->
  let event_urls = (* events for which a URL will be assigned *)
    List.filter events ~f:(fun x ->
      let open Event in
      match x.typ with
      | Break | Discussion -> false
      | Talk | Keynote | Tutorial | BoF | Reception -> true
    )
    |> List.map ~f:(fun (x:Event.t) -> x.Event.url_title)
  in
  let other_urls =
    List.filter_map files ~f:(fun file ->
      if Event.is_valid_filename file || file.[0] = '_' then
        None
      else
        match Filename.split_extension file with
        | x, None -> None (* ignore sub-directories *)
        | x, Some _ -> Some x (* consider files with any extension *)
    )
  in
  let urls = event_urls@other_urls in
  (if List.(length urls <> length (dedup urls)) then
      failwithf "%s: urls are not unique" dir ()
  );
  return {year; sessions = events_to_sessions events}
