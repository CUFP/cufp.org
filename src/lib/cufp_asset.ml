open Core.Std
open Async.Std
module Blog = Cufp_blog
module Html = Cufp_html
module Json = Cufp_json
module Markdown = Cufp_markdown
module Mpp = Cufp_mpp
module Path = Cufp_path
module Session = Cufp_session
module Util = Cufp_util
let lift = Cufp_util.lift

type typ =
| Front_page
| Conference
| Session
| Blog_post
| Blog_html
| Blog_rss
| Videos
| Json
| Markdown
| Html
| Text
| Dir
| File
with sexp

type t = {
  typ:typ;
  path:Cufp_path.t;
} with sexp

(** Return typ based only on basename of file, not which directory it
    is contained within. *)
let typ_of_basename path =
  let open Filename in
  let path = Path.input path in
  basename path |> fun x ->
    if String.length x > 0 && x.[0] = '_' then return File
    else if check_suffix x ".md" then return Markdown
    else if check_suffix x ".html" then return Html
    else if check_suffix x ".txt" then return Text
    else if check_suffix x ".json" then return Json
    else
      Util.file_or_dir path >>| function
      | `Dir -> Dir
      | `File -> File

let typ_of_path path =
  match path.Path.path with
  | "blog"::"index.html"::[] -> return Blog_html
  | "blog"::"all.rss.xml"::[] -> return Blog_rss
  | "blog"::x::[] ->
    if Blog.Post.is_valid_filename x
    then return Blog_post
    else typ_of_basename path
  | "videos"::"index.html"::[] -> return Videos
  | x::y::[] ->
    if Util.is_YYYY x then (
      if y = "index.md" then
        return Conference
      else if Session.is_valid_filename y then
        return Session
      else
        typ_of_basename path
    )
    else
      typ_of_basename path
  | [] -> return Dir
  | "index.md"::[] -> return Front_page
  | _ -> typ_of_basename path


let of_path path =
  typ_of_path path >>| fun typ ->
  {typ; path}


(******************************************************************************)
(* HTML                                                                       *)
(******************************************************************************)
let body_class {typ; path} =
  (match typ with
  | Front_page -> Some "front-page"
  | Conference -> (match path.Path.path with
    | year::"index.md"::[] -> Some (sprintf "conference cufp%s" year)
    | _ -> assert false
  )
  | Session -> Some "session"
  | Blog_post -> Some "blog-post"
  | Blog_html -> Some "blog"
  | Videos -> Some "videos"
  | Blog_rss
  | Json
  | Markdown
  | Html
  | Text
  | Dir
  | File -> None
  )


(******************************************************************************)
(* Build                                                                      *)
(******************************************************************************)
let source ?(style = `Abs) t =
  let f = match style with `Abs -> Path.input | `Rel -> Path.relative in
  f t.path

let target ?(style = `Abs) t =
  let f = match style with `Abs -> Path.output | `Rel -> Path.relative in
  match t.typ with
  | Session -> (
    let {Session.url_title;_} = Session.parse_filename (Path.relative t.path) in
    let basename = url_title ^ ".html" in
    let parent_dir = Path.parent t.path in
    f (Path.concat parent_dir basename)
  )
  | Json -> (
    f t.path
    |> Fn.flip Filename.chop_suffix ".json"
    |> fun x -> x ^ ".html"
  )
  | Blog_post
  | Front_page
  | Conference
  | Markdown -> (
    f t.path
    |> Fn.flip Filename.chop_suffix ".md"
    |> fun x -> x ^ ".html"
  )
  | Blog_html
  | Blog_rss
  | Videos
  | Html
  | Text
  | Dir
  | File -> f t.path

let dependencies t =
  return [source t] >>= fun common ->
  match t.typ with
  | Front_page
  | Conference
  | Session
  | Blog_post
  | Videos
  | Json
  | Markdown
  | Html -> return common
  | Blog_html -> (
    let repo_root = Path.repo_root t.path in
    Path.all_blog_post_files repo_root >>=
    lift (List.map ~f:Path.input) >>= fun l ->
    return ((source t)::(l@common))
  )
  | Blog_rss -> (
    let repo_root = Path.repo_root t.path in
    Path.all_blog_post_files repo_root >>=
    lift (List.map ~f:Path.input) >>= fun l ->
    return ((source t)::l)
  )
  | Text
  | Dir
  | File -> return common

let out_of_date t =
  dependencies t >>= fun dependencies ->
  Util.newerl dependencies [target t]

let log_convert ?(style = `Rel) t =
  printf "converting %s %s → %s\n"
    (sexp_of_typ t.typ |> Sexp.to_string_hum)
    (source ~style t)
    (target ~style t)

let log_skip ?(style = `Rel) t =
  printf "skipping %s %s\n"
    (sexp_of_typ t.typ |> Sexp.to_string_hum)
    (source ~style t)

let log_recurse ?(style = `Rel) t =
  printf "recursing into %s %s\n"
    (sexp_of_typ t.typ |> Sexp.to_string_hum)
    (source ~style t)

let log_copy ?(style = `Rel) t =
  printf "copying %s %s\n"
    (sexp_of_typ t.typ |> Sexp.to_string_hum)
    (source ~style t)

let copy t =
  Util.file_or_dir (source t) >>= function
  | `Dir -> (
    sprintf "rsync -a %s %s/" (source t) (Filename.dirname (target t))
    |> Util.command
  )
  | `File -> (
    sprintf "cp -p %s %s" (source t) (target t)
    |> Util.command
  )

let rec make ?(production=false) t =
  let repo_root = Path.repo_root t.path in
  let depth = Path.depth t.path in
  let temp_dir = Path.temp_dir repo_root in
  let app_dir = Path.app_dir repo_root in
  let its = true in

  let mpp filename =
    Mpp.mpp ~temp_dir ~its ~app_dir
      ~set:(if production then ["production",None] else [])
      (`As_string filename)
  in

  let main_template ~out_file content =
    Mpp.main_template
      ~repo_root ~depth ~production
      ?body_class:(body_class t) ~content
      ~out_file ()
  in

  match t.typ with

  | Session -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      Session.of_file (source t) >>= fun s ->
      if s.Session.typ = Session.Break then
        (log_skip t; Deferred.unit)
      else (
        log_convert t;
        return (Session.to_html s) >>=
        lift Html.to_string >>=
        main_template ~out_file:(target t)
      )
  )

  | Blog_post -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      log_convert t;
      Blog.Post.of_file (source t) >>=
      lift Blog.Post.to_html >>=
      lift Html.to_string >>=
      main_template ~out_file:(target t)
  )

  | Json -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      log_convert t;
      Json.of_file (source t) >>=
      lift (Json.to_html ~production ~depth) >>=
      lift Html.to_string >>= fun contents ->
      Writer.save (target t) ~contents
  )

  | Front_page
  | Conference
  | Markdown -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      log_convert t;
      Reader.file_contents (source t) >>=
      lift Omd.of_string >>=
      lift Omd.to_html >>=
      main_template ~out_file:(target t)
  )

  | Blog_html
  | Videos
  | Html -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      log_convert t;
      Reader.file_contents (source t) >>=
      main_template ~out_file:(target t)
  )

  | Blog_rss
  | Text -> (
    out_of_date t >>= function
    | false -> Deferred.unit
    | true ->
      log_convert t;
      mpp (source t) >>= fun contents ->
      Writer.save (target t) ~contents
  )

  | Dir -> (match t.path.Path.path with
    | []
    | "css"::[]
    | "videos"::[]
    | "conferences"::[]
    | "blog"::[] -> (log_recurse t; recurse ~production t)
    | "archive"::[]
    | "img"::[] -> (log_copy t; copy t)
    | "css"::".sass-cache"::[] -> (log_skip t; Deferred.unit)
    | x::[] -> (
      if Util.is_YYYY x then
        (log_recurse t; recurse ~production t)
      else
        (log_copy t; copy t)
    )
    | _ -> (log_copy t; copy t)
  )

  | File -> (
    let base = Filename.basename (source t) in
    if (base = ".DS_Store")
      || (Filename.check_suffix base ".scss")
      || (String.length base > 0 && base.[0] = '_')
    then
      (log_skip t; Deferred.unit)
    else
      out_of_date t >>= function
      | false -> Deferred.unit
      | true -> (log_copy t; copy t)
  )

(** Assuming [t.path] is a directory, create corresponding output
    directory and recursively call [convert] on all child files. *)
and recurse ?(production=false) t : unit Deferred.t =
  Util.file_or_dir (source t) >>= function
  | `Dir ->
    Unix.mkdir ~p:() (target t) >>= fun () ->
    Sys.readdir (source t) >>=
    Deferred.Array.iter ~f:(fun file ->
      of_path (Path.concat t.path file) >>=
      make ~production
    )
  | `File ->
    failwithf "BUG: recurse called on non-dir %s" (source t) ()
