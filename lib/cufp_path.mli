(** Path to content files. This module is not about arbitrary
    filepaths. Type [t] represents the path to a content file or
    directory within the site. Here is some relevant terminology:

    - repo root - Path to root of repository.

    - site root - Path to the root of the content. There are source
    files for content, and these get converted into output
    files. Thus, there is the input and output site root.

    - site file - Path to a file (or directory) within the site root.

    - content depth - Depth of a content file relative to site root.
*)
open Core
open Async

(** Absolute path to a content file (or directory).

    - repo_root: absolute path of repository root

    - path: site root-relative path broken down into its individual
    parts
*)
type t = private {
  repo_root : string;
  path : string list;
} [@@deriving sexp]

(** [root repo_root] returns the content root directory given
    [repo_root]. If [repo_root] is relative, it is converted to an
    absolute path under the assumption that it is relative to the
    current working directory. *)
val root : string -> t Deferred.t

(** [concat t file] creates the path [t/file]. The [file] must not
    contain "/", i.e. it must a single component of a path. *)
val concat : t -> string -> t

(** [make ~repo_root file] splits the string [file] on slashes and
    constructs a path from it by repeatedly calling {!concat}. The
    [file] can start with a slash or not; either way it is treated as
    relative to the site root. *)
val make : repo_root:string -> string -> t Deferred.t

val repo_root : t -> string

(** Depth of content file relative to site root. *)
val depth : t -> int

(** Absolute input path. *)
val input : t -> string

(** Absolute output path. *)
val output : t -> string

(** Site root-relative path. *)
val relative : t -> string

val parent : t -> t


(** {6 File Types} *)

val check_suffix : t -> string -> bool
val is_event_file : t -> bool


(** {6 Non-content paths}
    Paths that don't relate to a content file. All take repository
    root as input.
*)

val in_site_root : string -> string
val out_site_root : string -> string
val temp_dir : string -> string
val main_template : string -> string
val app_dir : string -> string
