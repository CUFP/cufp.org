open Core
open Async

type t =
| Youtube of string
| Vimeo of string

let to_string = function
  | Youtube id -> sprintf "https://www.youtube.com/v/%s" id
  | Vimeo id -> sprintf "http://vimeo.com/%s" id

let of_string s =
  let err = sprintf "unable to parse %s as video" s in
  let uri = Uri.of_string s in
  match Uri.host uri with
  | Some "www.youtube.com"
  | Some "youtube.com" -> (
    match Uri.path uri |> Filename.parts with
    | "/"::"v"::id::[] -> Youtube id
    | _ -> (
      match Uri.get_query_param' uri "v" with
      | Some (id::[]) -> Youtube id
      | _ -> failwith err
    )
  )
  | Some "vimeo.com" -> (
    match Uri.path uri |> Filename.parts with
    | "/"::id::[] -> Vimeo id
    | _ -> failwith err
  )
  | _ -> failwith err

let to_uri = function
  | Youtube id -> sprintf "http://www.youtube.com/watch?v=%s" id
  | Vimeo id -> sprintf "http://vimeo.com/%s" id

let to_embed_uri = function
  | Youtube id ->
    sprintf
      "http://www.youtube.com/embed/%s?controls=2&showinfo=0&theme=light&autohide=1"
      id
  | Vimeo id ->
    sprintf
      "http://player.vimeo.com/video/%s?title=0&byline=0&portrait=0"
      id

let icon_class = function
  | Youtube _ -> "fi-social-youtube"
  | Vimeo _ -> "fi-social-vimeo"
