(** MPP operations. *)
open Core.Std
open Async.Std


(** [main_template ()] runs {i mpp} on the main.html template. Output
    is written to [out_file]. After running {i mpp}, it also fixes
    links. The mpp variables are: [production], [body_class], and
    [content]. See main.html to understand how they are used. Note the
    [content] argument to this function takes the actual string to
    include, which is written to a file and referred to as
    [content_file] within main.html. *)
val main_template :
  repo_root:string ->
  depth:int ->
  ?production:bool ->
  ?body_class:string ->
  content:string ->
  out_file:string ->
  unit ->
  unit Deferred.t


(** [mpp x] runs mpp on [x], which can be either the name of a file or
    the actual string to process. Returned string is the output of {i
    mpp}. If [out_file] is given, the string is also written to
    [out_file]. *)
val mpp :
  ?temp_dir:string ->
  ?its:bool ->
  ?set:(string * String_as.t option) list ->
  ?out_file:string ->
  app_dir:string ->
  String_as.t ->
  string Deferred.t


(** [mpp_sys file] runs the {i mpp} system command on [file]. Optional
    arguments correspond to the {i mpp} command. Probably always, one
    of the higher level functions above will be more suitable. *)
val mpp_sys :
  ?its:bool ->
  ?set:(string * string option) list ->
  ?o:string ->
  app_dir:string ->
  string ->
  unit Deferred.t
