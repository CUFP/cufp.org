(** Markdown files. *)
open Core.Std
open Async.Std

(** Convert given Markdown string to html. *)
val to_html : string -> Cufp_html.t

(** Like [to_html] but input is a file name. *)
val file_to_html : string -> Cufp_html.t Deferred.t

(** Conversion not very comprehensive. Use with caution. *)
val of_html : Cufp_html.t -> Omd.t

(** Parse markdown that is assumed to be an unordered list, with each
    item being a tag-value pair separated by a colon. *)
val parse_assoc_list : Omd.element -> (string * string) list
