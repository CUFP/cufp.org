(** Blog feed. *)
open Core.Std
open Async.Std

module Post : sig

  (** Single blog post.
      - url_title - Short title safe for use in URL.
  *)
  type t = private {
    title : string;
    url_title : string;
    author : Person.t option;
    pubdate : Date.t;
    description : Omd.t;
    categories : string list;
  }

  (** Information encoded in filename. *)
  type file_name_info = {
    url_title : string;
    pubdate : Date.t;
  }


  (** {6 Parsers/Constructors} *)

  (** Raise exception in case of any errors. *)
  val make :
    title:string ->
    url_title:string ->
    ?author:Person.t ->
    pubdate:Date.t ->
    description:Omd.t ->
    categories:(string list) ->
    unit ->
    t

  (** First item in markdown must be a list specifying: title, author,
      and categories. Remaining markdown is taken as the
      description. The url_title and pubdate are taken from the
      filename. *)
  val of_markdown : filename:string -> Omd.t -> t
  val of_string : filename:string -> string -> t
  val of_file : string -> t Deferred.t

  val parse_filename : string -> file_name_info
  val is_valid_filename : string -> bool


  (** {6 Printers} *)

  (** [to_file t dir] prints post [t] to a file within [dir]. The
      filename is determined automatically from [t]. *)
  val to_file : t -> string -> unit Deferred.t

  val to_html_item : t -> Html.item
  val to_html : t -> Html.t


  (** {6 Miscellaneous} *)

  val uri : ?style:[`Absolute | `Site_root_relative] -> t -> Uri.t

end

(** Collection of posts, i.e. a feed. It is guaranteed that
    {!Post.uri} will return a unique URI for every item in this
    feed, and that list will be in reverse chronological order. *)
type t = private Post.t list


(** {6 Feed Operations} *)

(** Raises exception if given items do not all result in a unique
    URI. *)
val make : Post.t list -> t

(** Generate feed from all blog post files within given dir. *)
val of_dir : string -> t Deferred.t

(** Print feed as an XML string in RSS 2.0 format. *)
val to_string_rss : t -> string

val to_html : t -> Html.t

(** {6 List Operations}

    Operations equivalent to their list counterpart, but known to be
    safe fro the private [t] list type.
*)

val take : t -> int -> t
val filter : t -> f:(Post.t -> bool) -> t
