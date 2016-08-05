(** JSON pages. *)
open Core.Std
open Async.Std

type json = Yojson.Basic.json
type t

val of_file : string -> t Deferred.t
val to_html : ?production:bool -> depth:int -> t -> Html.t

(** [get_string al field] gets the string value of [field] from given
    association list. Raise [Failure] if value is not a string. *)
val get_string : (string * json) list -> string -> string
