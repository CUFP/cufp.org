(** HTML operations. *)
open Core.Std
open Async.Std

(** Html element. *)
type item = Nethtml.document

(** Html document. Note: nethtml terminology is incorrect. An html
    document is really a list of what it calls a document. *)
type t = item list

type attributes = (string * string) list

(** Parse given HTML string. *)
val parse : string -> t

(** Parse given HTML file. *)
val parse_file : string -> t Deferred.t

val to_string : t -> string


(** {6 Constructors} *)

val item : string -> ?a:attributes -> t -> item
val data : string -> item

val div : ?a:attributes -> t -> item
val span : ?a:attributes -> t -> item
val iframe : ?a:attributes -> t -> item

val a : ?a:attributes -> t -> item
val i : ?a:attributes -> t -> item
val br : item

val ul : ?a:attributes -> t -> item
val li : ?a:attributes -> t -> item

val h1 : ?a:attributes -> t -> item
val h2 : ?a:attributes -> t -> item
val h3 : ?a:attributes -> t -> item
val h4 : ?a:attributes -> t -> item
val h5 : ?a:attributes -> t -> item
val h6 : ?a:attributes -> t -> item

val table : ?a:attributes -> t -> item
val thead : ?a:attributes -> t -> item
val th : ?a:attributes -> t -> item
val tbody : ?a:attributes -> t -> item
val tr : ?a:attributes -> t -> item
val td : ?a:attributes -> t -> item

val dl : ?a:attributes -> t -> item
val dd : ?a:attributes -> t -> item

val script : ?a:attributes -> t -> item


(** {6 Links} *)

(** List of element/attribute pairs, whose values are links. For
    example, ("a", "href") is in the list because the html <a> element
    can have an "href" attribute whose value is expected to be a
    link. The list may not be comprehensive. *)
val attributes_with_link_values : (string * string) list

(** [relativize_link ~depth link] converts a site root-relative
    [link], i.e. a link starting with "/", to a link relative to a
    document lying [depth] levels below the root.

    Example: [relativize_link ~depth:2 "/css/foo.css"] returns
    "../../css/foo.css". The returned link is now appropriate for use
    in any document lying 2 levels below the site root.

    Links that are not site root-relative are returned unaltered.

    This function is useful for viewing a website under the file://
    protocol, which assumes your site root is at the unlikely location
    "/". It is unnecessary for pages that will be served by
    http://. *)
val relativize_link : depth:int -> string -> string

(** Example: [append_index_html "a/" = "a/index.html"].

    Example: [append_index_html "a" = "a"]. *)
val append_index_html : string -> string

(** [map_links t ~f] traverses [t] and replaces each link [x] by [f
    x]. The values considered as links are dictated by
    [attributes_to_map], which by default is
    {!attributes_with_link_values}. *)
val map_links :
  ?attributes_to_map:(string * string) list ->
  f:(string -> string) ->
  t -> t

(** Like [map_links] but works on an HTML string. Also, the
    implementation uses the [Markup] library instead of [Nethtml]. *)
val map_links_str :
  ?attributes_to_map:(string * string) list ->
  f:(string -> string) ->
  string ->
  string
