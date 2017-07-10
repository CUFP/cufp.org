(** Conferences. *)
open Core
open Async

(** A session is a sequence of events, all of which have the same
    session name and occur on the same date. If the events' session
    name is None, it is not really a session, but just a sequence of
    events. The list cannot be empty and events are ordered by
    time. *)
type session = private Cufp_event.t list

(** url_title of every event guaranteed to be distinct. *)
type t = private {
  year : int;
  sessions : session list;
}

val of_dir : string -> t Deferred.t

val session_name : session -> string option
val session_date : session -> Date.t
val session_start : session -> Time.Ofday.t
val session_finish : session -> Time.Ofday.t

(** Year of first conference. *)
val first_year : int

(** List of conference years based on directories found under
    site/. *)
val years : repo_root:string -> unit -> int list Deferred.t


(** {6 HTML} *)
val schedule : t -> Date.t -> Html_types.div Tyxml.Html.elt
