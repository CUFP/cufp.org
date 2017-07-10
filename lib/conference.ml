open Core
open Async
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
        let childs =
          [
            div ~a:[a_class ["time"]] [pcdata time];
            div ~a:[a_class ["description"]] [h2 [pcdata description]];
            div ~a:[a_class ["authors"]] speakers;
          ]
        in
        match x.Event.typ with
        | Event.Talk
        | Event.Keynote
        | Event.Tutorial
        | Event.Reception
        | Event.BoF ->
          a ~a:[a_class ["event"]; a_href (x.Event.url_title ^ ".html")] childs
        | Event.Break | Event.Discussion ->
          div ~a:[a_class ["event"]] childs
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
        | _, None -> None (* ignore sub-directories *)
        | x, Some _ -> Some x (* consider files with any extension *)
    )
  in
  let urls = event_urls@other_urls in
  (if List.(length urls <> length (dedup urls)) then
      failwithf "%s: urls are not unique" dir ()
  );
  return {year; sessions = events_to_sessions events}
