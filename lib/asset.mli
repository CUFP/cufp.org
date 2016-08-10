(** Assets comprising the site. Functions are provided to determine
    how to generate files associated with an asset, whether the files
    are out-of-date, what files an asset depends on, etc. An asset is
    basically a file, but sometimes we know more specifically that it
    is, for example, a file defining a conference event. Also, we
    know that a markdown file gets converted to an html file, so an
    asset isn't simply a filename. Most importantly, {!make} allows
    generating the asset.

    Types of assets:

    - Front_page: the frontpage

    - Conference: a conference's main page

    - Event: a single event within a conference

    - Blog_post: a single blog post

    - Blog_html: a blog feed in html format

    - Blog_rss: a blog feed in rss format

    - Videos: page of all videos

    - Markdown: a general markdown file

    - Html: a general html file

    - Text: a general text file

    - File: a general file

    - Dir: a general directory
*)
open Core.Std
open Async.Std

type typ =
| Front_page
| Conference
| Event
| Blog_post
| Blog_html
| Blog_rss
| Videos
| Markdown
| Html
| Text
| Dir
| File
[@@deriving sexp]

type t = private {
  typ : typ;
  path : Cufp_path.t;
} [@@deriving sexp]


(** [of_file path] returns the asset corresponding to the given
    [path], which should have been constructed by providing the source
    of the asset. *)
val of_path : Cufp_path.t -> t Deferred.t

(** Path to source file that this asset is generated from. Default
    style is `Abs. *)
val source : ?style:[`Abs | `Rel] -> t -> string

(** Path to target file that this asset is written to. Default style
    is `Abs. *)
val target : ?style:[`Abs | `Rel] -> t -> string

(** Absolute path of all files that [t] depends on, including [source
    t]. *)
val dependencies : t -> string list Deferred.t

(** Return true if [target t] is out-of-date with respect to
    [dependencies t]. *)
val out_of_date : t -> bool Deferred.t

(** [make t] will generate [target t] if it doesn't exist or is older
    than any of [dependencies t]. *)
val make : ?production:bool -> t -> unit Deferred.t


(** {6 HTML} *)

(** Return the css class attribute. *)
val body_class : t -> string option
