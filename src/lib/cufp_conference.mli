(** Conferences. *)
open Core.Std
open Async.Std

(** url_title of every session guaranteed to be distinct. *)
type t = private {
  year : int;
  sessions : Cufp_session.t list;
}

val of_dir : string -> t Deferred.t

(** Year of first conference. *)
val first_year : int

(** List of conference years based on directories found under
    site/. *)
val years : repo_root:string -> unit -> int list Deferred.t


(** {6 HTML} *)

(** If [date] is given, only sessions on that [date] are included. *)
val sessions_table : ?date:Date.t -> t -> Cufp_html.item

(** Generate the videos page. *)
val videos_page : t list -> Cufp_html.item
