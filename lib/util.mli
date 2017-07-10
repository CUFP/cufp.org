(** Miscellaneous utility functions and values. *)
open Core
open Async

val is_YYYY : string -> bool

(** Run the given system command. Any errors are printed to
    stderr. Set [echo = true] to echo the command to stdout before
    executing it. Set [dry_run = true] to only echo the command but
    not actually run it (in which case [echo] is ignored). *)
val command : ?echo:bool -> ?dry_run:bool -> string -> unit Deferred.t

(** [find dir] returns a stream of all regular files within [dir]. *)
val find :
  string ->
  (
    string,
    [> `Neither_file_nor_dir of string | `Unknown_file_type of string
    ]
  ) Result.t Pipe.Reader.t

(** [depth_from_root filepath] computes how many levels away
    [filepath] is from the root directory, which is assumed to be at
    the parent of the beginning of [filepath], i.e. that [filepath]
    is given relative to the root.

    Example: [depth_from_root "a/b.html"] assumes the root directory
    is the parent of [a/], and thus returns 2 since [b.html] is 2
    levels below that.

    If [filepath] is not relative to the root directory, you can
    provide [offset], which is simply subtracted from the answer
    computed as above. A negative [offset] is valid.

    Example: [depth_from_root ~offset:2 "_build/site/a/b.html"] also
    returns 2.

    [filepath] must must not contain any occurrences of "./" or
    "../", except "./" is allowed at the beginning. *)
val depth_from_root : ?offset:int -> string -> int

(** [to_temp_file contents] writes contents to a temporary file, whose
    path is constructed from [temp_dir], [prefix], and [suffix], and
    returns the filename. *)
val to_temp_file :
  ?temp_dir:string ->
  prefix:string ->
  suffix:string ->
  string ->
  string Deferred.t

(** Return true if given string is okay for use in URLs, which we
    conservatively require to be simple characters. *)
val is_url_string : string -> bool

val lift : ('a -> 'b) -> ('a -> 'b Deferred.t)

(** Return last modification time of given file if it exists. *)
val mod_time : string -> Time.t option Deferred.t

(** [newer source target] returns true if [source] file is newer,
    i.e. has been updated more recently, than [target] file. Raise
    Failure if [source] doesn't exist. Return [true] if [output
    target] doesn't exist.

    Return value of [true] indicates [target] needs to be
    re-generated, and return value of [false] indicates it does not
    need to be re-generated. In other words, this function helps
    implement make style rules. *)
val newer : string -> string -> bool Deferred.t

(** Like {!newer} but returns true if any of [sources] are newer than
    any of [targets]. *)
val newerl : string list -> string list -> bool Deferred.t

val file_or_dir : string -> [ `Dir | `File ] Deferred.t

val ampm : Time.Ofday.t -> [`AM | `PM]
val time_ofday_to_string : ?print_ampm:bool -> Time.Ofday.t -> string
val time_ofday_range_to_string : Time.Ofday.t -> Time.Ofday.t -> string

(** Concatenate given strings interleaved with [sep]. If there are 2
    or more items in the list and [use_and = true], then prefix last
    item with "and ". Defaults: [sep = ", "], [use_and = false]. *)
val string_list_to_string :
  ?use_and:bool ->
  ?sep:string ->
  string list ->
  string

val zip3 : 'a list -> 'b list -> 'c list -> ('a * 'b * 'c) list option

(** [get_list al x] searches the association list [al] for the value
    of [x], splits the value on [on], and strips off any
    whitespace. Default: [on = ',']. *)
val get_list : ?on:char -> (string * string) list -> string -> string list

(** Put double quotes around given string. *)
val quote : string -> string
