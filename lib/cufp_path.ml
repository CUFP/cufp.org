open Core
open Async
module Event = Cufp_event
let (/) = Filename.concat

type t = {
  repo_root : string; (* absolute path *)
  path : string list; (* site root-relative path *)
} [@@deriving sexp]

(******************************************************************************)
(* Non-content Paths                                                          *)
(******************************************************************************)
let in_site_root repo_root = repo_root/"site"
let out_site_root repo_root = repo_root/"_build"/"site"
let temp_dir repo_root = repo_root/"_build"/"tmp"
let main_template repo_root = repo_root/"template"/"main.html"
let app_dir repo_root = repo_root/"_build"/"app"


(******************************************************************************)
(* Content Paths                                                              *)
(******************************************************************************)
let root repo_root =
  (if Filename.is_absolute repo_root then
      return repo_root
   else
      Sys.getcwd() >>| fun cwd -> cwd/repo_root
  ) >>| fun repo_root ->
  {repo_root; path=[]}

let concat t file =
  {t with path = match file with
  | "." -> t.path
  | ".." -> (match t.path with
    | [] -> []
    | _ -> List.take t.path (List.length t.path - 1)
  )
  | _ ->
    if String.exists file ~f:(function '/' -> true | _ -> false) then
      failwithf "file component %s contains '/'" file ()
    else
      t.path@[file]
  }

let make ~repo_root file =
  let parts = match Filename.parts file with
    | "/"::parts -> parts
    | parts -> parts
  in
  root repo_root >>| fun init ->
  List.fold parts ~init ~f:concat

let input {repo_root; path} =
  List.fold path ~init:(in_site_root repo_root) ~f:Filename.concat

let output {repo_root; path} =
  List.fold path ~init:(out_site_root repo_root) ~f:Filename.concat

let relative {path; _} =
  List.fold path ~init:"/" ~f:Filename.concat

let parent {repo_root; path} =
  {repo_root; path = List.take path (List.length path - 1)}

let depth t = List.length t.path - 1
let repo_root t = t.repo_root


(******************************************************************************)
(* File Types                                                                 *)
(******************************************************************************)
let check_suffix {repo_root; path} suffix =
  List.fold ~init:repo_root ~f:Filename.concat path
  |> fun file -> Filename.check_suffix file suffix

let is_event_file {path; _} = match path with
  | x::y::[] ->
    Util.is_YYYY x && Event.is_valid_filename y
  | _ -> false
