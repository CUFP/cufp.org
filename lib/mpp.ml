open Core.Std
open Async.Std
module Path = Cufp_path

let mpp_sys ?(its=false) ?(set=[]) ?o ~app_dir file =
  let env = `Extend [
    "PATH", sprintf "%s:%s" app_dir (Sys.getenv_exn "PATH");
  ] in
  let prog = "mpp" in
  let args =
    (if its then ["-its"] else [])@
    (List.map set ~f:(fun (x,y) ->
      let y = match y with None -> "" | Some y -> sprintf "=%s" y in
      ["-set"; sprintf "%s%s" x y]
     )
     |> List.concat
    )@
    (match o with None -> [] | Some x -> ["-o"; x])@
    [file]
  in
  (* let cmd = sprintf "%s %s" prog (String.concat ~sep:" " args) in *)
  (* printf "%s\n" cmd; *)
  Process.run ~prog ~args ~env () >>= function
  | Ok _ -> Deferred.unit
  | Error e -> failwith (Error.to_string_hum e)


let mpp ?temp_dir ?(its=true) ?(set=[]) ?out_file ~app_dir mpp =
  let files_to_delete = ref [] in

  (match mpp with
  | `As_string filename -> return filename
  | `As_file contents -> (
    Util.to_temp_file ?temp_dir ~prefix:"template" ~suffix:".mpp" contents
    >>= fun mpp_file ->
    files_to_delete := mpp_file::!files_to_delete;
    return mpp_file )
  ) >>= fun mpp_file ->

  (Deferred.List.map set ~f:(fun (x, y) ->
    (match y with
    | None -> return None
    | Some (`As_string x) -> return (Some x)
    | Some (`As_file contents) -> (
      Util.to_temp_file ?temp_dir ~prefix:x ~suffix:".set" contents
      >>= fun filename ->
      files_to_delete := filename::!files_to_delete;
      return (Some filename)
    )) >>= fun y ->
    return (x,y)
   )
  ) >>= fun set ->

  let out_file = match out_file with
    | Some out_file -> out_file
    | None ->
      let x = Filename.temp_file ?in_dir:temp_dir "mpp_command" ".out" in
      files_to_delete := x::!files_to_delete;
      x
  in

  mpp_sys ~its ~set ~o:out_file ~app_dir mpp_file >>= fun () ->
  Reader.file_contents out_file >>= fun answer ->

  (List.map !files_to_delete ~f:Unix.unlink
   |> Deferred.all_unit
  ) >>= fun () ->

  return answer


let main_template ~repo_root ~depth
    ?(production=false) ?body_class ~content
    ~out_file ()
    =
  let temp_dir = Path.temp_dir repo_root in
  let template_file = Path.main_template repo_root in
  let set =
    ["content_file", Some (`As_file content)]@
    (match body_class with
    | Some x -> ["body_class", Some (`As_string (sprintf "class='%s'" x))]
    | None -> []
    )@
    (if production then ["production", None] else [])
  in
  let app_dir = Path.app_dir repo_root in
  (
    mpp ~temp_dir ~its:true ~set ~app_dir (`As_string template_file)
    >>| (fun x ->
      if production then x
      else
        x
        |> Html.map_links_str ~f:(fun link ->
          Html.relativize_link ~depth link
          |> Html.append_index_html
        )
    )
  ) >>= fun output ->
  Unix.mkdir ~p:() (Filename.dirname out_file) >>= fun () ->
  Writer.save out_file ~contents:output
