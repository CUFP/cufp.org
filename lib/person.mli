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
