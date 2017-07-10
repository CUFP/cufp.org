open Core
open Async

type t =
| Local of string

let to_string = function
  | Local path -> path

let of_string s =
  let err = sprintf "unable to parse %s as slides" s in
  match String.chop_prefix s ~prefix:"/" with
  | None -> failwith err
  | Some _ -> Local s

let to_uri = function
  | Local path -> path

let icon_class = function
  | Local _ -> "fi-page"
