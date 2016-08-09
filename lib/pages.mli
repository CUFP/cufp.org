(** HTML page constructors. *)
open Core.Std
open Async.Std
open Html_types
open Tyxml.Html

val menu : years:int list -> div elt
