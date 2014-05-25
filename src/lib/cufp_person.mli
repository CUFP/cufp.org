(** Person information. *)

type t = private {
  name : string;
  email : string option;
  affiliation : string option;
  link : string option;
}

val make :
  ?email:string ->
  ?affiliation : string ->
  ?link : string ->
  name:string ->
  unit ->
  t

(** Empty string means None. Default separator is semicolon. If [names
    = None], then all other fields must be None too, and empty list is
    returned. *)
val of_strings :
  ?on:char ->
  ?emails:string ->
  ?affiliations:string ->
  ?links:string ->
  ?names:string ->
  unit ->
  t list

(** Print person information in html. *)
val to_html : t -> Cufp_html.t

(** Print html ul list. *)
val to_html_ul : t list -> Cufp_html.item


(** Print email address in format required by RSS 2.0. Return None if
    [t.email = None]. *)
val to_string_rss : t -> string option
