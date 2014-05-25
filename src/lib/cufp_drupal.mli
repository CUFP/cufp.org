(** Import old Drupal based site. Input is a database dump in JSON
    format as output by Michael Sperber's
    {{:https://github.com/mikesperber/cufp-web}cufp-web} repo. *)
open Core.Std
open Async.Std

(** Phantom types used as parameter of [item] type. *)
type news
type user
type session
type node

type _ item = Yojson.Basic.json String.Map.t
type 'a t = 'a item list

val of_file : string -> _ t Deferred.t

val get_types : _ t -> string list
val get_fields : _ t -> string list

val get_news : _ t -> news t
val get_nodes : _ t -> node t
val get_sessions : _ t -> session t
val get_users : _ t -> user t

val convert :
  _ item ->
  [`User | `Session of Cufp_session.t | `Node of string * Omd.t | `News of Cufp_blog.Post.t]

(** [port ~root file] ports all data in given [file], writing all
    necessary files in the correct place under [root]. *)
val port : root:string -> string -> unit Deferred.t
