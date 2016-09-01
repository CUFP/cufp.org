(** HTML operations. *)
open Core.Std
open Async.Std

(** {HTML fragments} *)

(** Main menu that we insert in header of most pages. [years] should
    be the list of all years to include in menu. Optional [main_year]
    should be the year to display as the top item, which is visible
    without hovering over the menu. It should correspond to the year of
    the event which the page is about. Otherwise, omit it and the latest
    year will be used. *)
val menu : ?main_year:int -> years:int list -> Html_types.div Tyxml.Html.elt


(** {Links} *)

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

(** Like [map_links] but works on an HTML string. Also, the
    implementation uses the [Markup] library instead of [Nethtml]. *)
val map_links_str :
  ?attributes_to_map:(string * string) list ->
  f:(string -> string) ->
  string ->
  string
