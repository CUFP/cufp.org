(** Slides. *)

(** Slide identifiers.

    - Local path - Local file located at [path].
*)
type t =
| Local of string

(** Use heuristics to parse given string into slides type. Raise
    [Failure] if unable to parse correctly. Examples of allowed
    formats are:

    - /2013/foo.pdf
*)
val of_string : string -> t

(** Print slides as a string. Only guarantee about format of the string
    is that it can be parsed back with [of_string]. *)
val to_string : t -> string

val to_uri : t -> string

val icon_class : t -> string
