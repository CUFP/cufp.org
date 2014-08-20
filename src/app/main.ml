open Core.Std
open Async.Std
open Sexplib
open Cufp
open Cufp.Util
let (/) = Filename.concat

module Param = struct
  open Command.Spec

  let repo_root =
    let default = "./" in
    let doc = sprintf "dir Root of repository. Default: \"%s\"." default in
    flag "-repo-root" (optional_with_default default file) ~doc

  let production =
    let default = false in
    let doc = sprintf
      " Set to true to generate file for publication. Default \
        is %b, which generates dev version of file."
      default
    in
    flag "-production" (optional_with_default default bool) ~doc

  let sort_rev =
    let default = true in
    let doc = sprintf
      " Sort results in reverse order. Default = %b."
      default
    in
    flag "-sort-rev" (optional_with_default default bool) ~doc

end

(******************************************************************************)
(* `make` sub-command                                                         *)
(******************************************************************************)
let make : (string * Command.t) =
  ("make",
   Command.async_basic
     ~summary:"make a site asset"
     ~readme:(fun () ->
       "FILE should be the input source from which the asset is generated, \
        and be in site root-relative form starting with a slash."
     )
     Command.Spec.(
       empty
       +> Param.repo_root
       +> Param.production
       +> anon ("file" %: file)
     )
     (fun repo_root production file () ->
       Path.make ~repo_root file >>=
       Asset.of_path >>=
       Asset.make ~production
     )
  )


(******************************************************************************)
(* `print` sub-command                                                        *)
(******************************************************************************)
let print_conference_list : (string * Command.t) =
  ("conference-list",
   Command.async_basic
     ~summary:"print list of all conferences"
     Command.Spec.(
       empty
       +> Param.repo_root
       +> Param.sort_rev
       +> flag "-first" (optional int) ~doc:"N If given, years earlier \
          than this are excluded."
       +> flag "-last" (optional int) ~doc:"N If given, years later \
          than this are excluded."
     )
     (fun repo_root sort_rev first last () ->
       Conference.years ~repo_root () >>=
       lift (if sort_rev then List.rev else Fn.id) >>= fun l ->
       return (match first with
       | None -> l
       | Some first -> List.filter l ~f:(fun x -> x >= first)
       ) >>= fun l ->
       return (match last with
       | None -> l
       | Some last -> List.filter l ~f:(fun x -> x <= last)
       ) >>=
       lift (List.map ~f:(fun x ->
         sprintf "<li><a href=\"/%d/\">%d</a></li>" x x)
       ) >>=
       lift (String.concat ~sep:"\n") >>=
       lift (printf "%s\n") >>= fun () ->
       Deferred.unit
     )
  )

let print_event_list : (string * Command.t) =
  ("event-list",
   Command.async_basic
     ~summary:"print conference calendar"
     Command.Spec.(
       empty
       +> Param.repo_root
       +> flag "-date" (optional string) ~doc:"YYYY-MM-DD Date to \
          print events for. Default is to print all."
       +> anon ("year" %: int)
     )
     (fun repo_root date year () ->
       let date = Option.map date ~f:Date.of_string in
       Path.make ~repo_root (sprintf "%d" year) >>= fun dir ->
       Conference.of_dir (Path.input dir) >>=
       Util.lift (Conference.sessions_table ?date) >>= fun x ->
       return (printf "%s\n" (Html.to_string [x])) >>= fun () ->
       Deferred.unit
     )
  )

let print_blog : (string * Command.t) =
  ("blog",
   Command.async_basic
     ~summary:"print blog in either html or rss format"
     Command.Spec.(
       empty
       +> Param.repo_root
       +> flag "-n" (optional int) ~doc:"N Print at most the last N posts."
       +> flag "-earliest" (optional string)
         ~doc:"YYYY-MM-DD Do not print posts earlier than this date."
       +> anon ("format" %: string)
     )
     (fun repo_root n earliest format () ->
       Blog.of_dir (repo_root/"src"/"site"/"blog") >>= fun blog ->
       return (match n with None -> blog | Some n -> Blog.take blog n)
       >>= fun blog ->
       return (match Option.map earliest ~f:Date.of_string with
       | None -> blog
       | Some earliest ->
         Blog.filter blog ~f:(fun p -> Date.(p.Blog.Post.pubdate >= earliest))
       ) >>= fun blog ->
       return (match format with
       | "html" -> (Blog.to_html blog |> Html.to_string)
       | "rss" -> (Blog.to_string_rss blog)
       | s -> failwithf "invalid blog format %s" s ()
       ) >>|
       printf "%s\n"
     )
  )

let print_video : (string * Command.t) =
  ("videos",
   Command.async_basic
     ~summary:"print videos"
     Command.Spec.(
       empty
       +> Param.repo_root
     )
     (fun repo_root () ->
       Conference.years ~repo_root () >>=
       Deferred.List.map ~f:(fun year ->
         sprintf "src/site/%d" year |> Conference.of_dir
       ) >>=
       lift Conference.videos_page >>= fun x ->
       return (Html.to_string [x]) >>= fun x ->
       print_string x;
       Deferred.unit
     )
  )

let print : (string * Command.t) =
  ("print",
   Command.group ~summary:"print various items"
     [
       print_conference_list;
       print_event_list;
       print_blog;
       print_video;
     ]
  )


(******************************************************************************)
(* `main` command                                                             *)
(******************************************************************************)
let main = Command.group
  ~summary:"build and publish the cufp.org website"
  [make; print]

;;
let build_info = match About.git_commit with
  | None -> "unknown"
  | Some x -> x
in
try Command.run ~build_info main
with e -> eprintf "%s\n" (Exn.to_string e)
