(** Videos. *)

(** Video identifiers.

    - Youtube id - YouTube video with ID [id].

    - Vimeo id - Vimeo video with ID [id].
*)
type t =
| Youtube of string
| Vimeo of string

(** Use heuristics to parse given string into a video type. Raise
    [Failure] if unable to parse correctly. Examples of allowed
    formats are:

    - https://www.youtube.com/v/Z8Xamkb-J2k
    - http://www.youtube.com/watch?v=gKWNjFagR9k
    - http://vimeo.com/6704601
*)
val of_string : string -> t

(** Print video as a string. Only guarantee about format of the string
    is that it can be parsed back with [of_string]. *)
val to_string : t -> string

(** Return URI that points to the video's page. *)
val to_uri : t -> string

(** Return a URI that will embed video. *)
val to_embed_uri : t -> string

val icon_class : t -> string
