open Core.Std
open Async.Std
module Blog = Cufp_blog
module Session = Cufp_session
module Util = Cufp_util
let (/) = Filename.concat

type t = {
  repo_root : string; (* absolute path *)
  path : string list; (* site root-relative path *)
} with sexp

(******************************************************************************)
(* Non-content Paths                                                          *)
(******************************************************************************)
let in_site_root repo_root = repo_root/"src"/"site"
let out_site_root repo_root = repo_root/"_build"/"site"
let temp_dir repo_root = repo_root/"_build"/"tmp"
let main_template repo_root = repo_root/"src"/"template"/"main.html"
let blog_dir repo_root = repo_root/"src"/"site"/"blog"
let app_dir repo_root = repo_root/"_build"/"src"/"app"


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

let is_session_file {path; _} = match path with
  | x::y::[] ->
    Util.is_YYYY x && Session.is_valid_filename y
  | _ -> false

let is_blog_post {path; _} = match path with
  | "blog"::y::[] -> Blog.Post.is_valid_filename y
  | _ -> false

let all_blog_post_files repo_root =
  let blog_dir = in_site_root repo_root / "blog" in
  Sys.readdir blog_dir >>= fun files ->
  return (Array.to_list files) >>=
  Deferred.List.filter_map ~f:(fun file ->
    if Blog.Post.is_valid_filename file then
      make ~repo_root ("blog"/file) >>| Option.some
    else
      return None
  )
