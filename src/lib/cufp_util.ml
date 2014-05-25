open Core.Std
open Async.Std

let is_YYYY s =
  (String.length s = 4) && (String.for_all s ~f:Char.is_digit)

let find dir =
  let rec f dir w =
    Sys.readdir dir >>=
      Deferred.Array.iter ~f:(fun file ->
        let file = Filename.concat dir file in
        let follow_symlinks = false in
        Sys.is_file ~follow_symlinks file >>= function
        | `Yes -> Pipe.write w (Ok file)
        | `Unknown  -> Pipe.write w (Error (`Unknown_file_type file))
        | `No -> (Sys.is_directory ~follow_symlinks file >>= function
          | `Yes -> f file w
          | `No -> Pipe.write w (Error (`Neither_file_nor_dir file))
          | `Unknown -> Pipe.write w (Error (`Unknown_file_type file))
        )
      )
  in Pipe.init (f dir)

let command ?(echo=false) ?(dry_run=false) cmd =
  let echo = echo || dry_run in
  if echo then printf "%s\n" cmd;
  if not dry_run then
    Unix.system cmd >>= function
    | Error err ->
      let err = Unix.Exit_or_signal.sexp_of_error err |> Sexp.to_string_hum in
      if not echo then printf "%s\n" cmd; (* print if not already printed *)
      eprintf "%s\n" err;
      Deferred.unit
    | Ok () -> Deferred.unit
  else
    Deferred.unit

let depth_from_root ?(offset=0) filepath =
  (if filepath = "" then
      failwith "depth_from_root: got empty filepath"
  );
  let parts = Filename.parts filepath in
  (List.iter (List.tl_exn parts) ~f:(function
  | "." -> failwith "depth_from_root: filepath contains \".\""
  | ".." -> failwith "depth_from_root: filepath contains \"..\""
  | _ -> () )
  );
  List.length parts - 1 - offset

let to_temp_file ?temp_dir ~prefix ~suffix contents =
  let filename = Filename.temp_file ?in_dir:temp_dir prefix suffix in
  Writer.save filename ~contents >>= fun () ->
  return filename

let is_url_string s =
  String.for_all s ~f:(function
  | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' -> true
  | _ -> false
  )

let lift f = fun x -> return (f x)

let mod_time file =
  Sys.file_exists file >>= function
  | `No | `Unknown ->
    return None
  | `Yes -> (
    Unix.stat file >>|
    fun x -> Some x.Unix.Stats.mtime
  )

let newer s t =
  mod_time s >>= fun s_time ->
  mod_time t >>= fun t_time ->
  match s_time, t_time with
  | None, _ ->
    failwithf "%s doesn't exist" s ()
  | _, None -> return true
  | Some s_time, Some t_time ->
    return Time.(s_time > t_time)

let newerl sl tl = match sl,tl with
  | _, [] -> return false
  | [], _ -> return true
  | _, _ ->
    Deferred.List.fold sl ~init:None ~f:(fun latest s ->
      mod_time s >>= fun s_time ->
      match latest, s_time with
      | _, None ->
        failwithf "%s doesn't exist" s ()
      | None, Some _ -> return s_time
      | Some latest', Some s_time' ->
        if Time.(latest' > s_time') then return latest
        else return s_time
    ) >>= fun s_time ->
    Deferred.List.fold tl ~init:None ~f:(fun earliest t ->
      mod_time t >>= fun t_time ->
      match earliest, t_time with
      | _, None -> return earliest
      | None, Some _ -> return t_time
      | Some earliest', Some t_time' ->
        if Time.(earliest' < t_time') then return earliest
        else return t_time
    ) >>= fun t_time ->
    match s_time, t_time with
    | None, _ -> assert false
    | _, None -> return true
    | Some s_time, Some t_time -> return Time.(s_time > t_time)


let file_or_dir file =
  Sys.is_directory file >>= fun is_dir ->
  Sys.is_file file >>= fun is_file ->
  match is_dir, is_file with
  | `Unknown, _ ->
    failwithf "error determining if %s is a directory" file ()
  | _, `Unknown ->
    failwithf "error determining if %s is a file" file ()
  | `No, `No ->
    failwithf "%s is neither a directory nor a file" file ()
  | `Yes, `Yes -> assert false
  | `Yes, `No -> return `Dir
  | `No, `Yes -> return `File

let ampm t =
  let {Time.Span.Parts.hr; _} = Time.Ofday.to_parts t in
  if 0 <= hr && hr < 12 then `AM
  else if 12 <= hr && hr < 24 then `PM
  else failwithf "invalid hour %d" hr ()

let time_ofday_to_string ?(print_ampm=true) t =
  let {Time.Span.Parts.hr; min; _} = Time.Ofday.to_parts t in
  let ampm =
    if not print_ampm then ""
    else match ampm t with
    | `AM -> " AM"
    | `PM -> " PM"
  in
  let hr = match hr with
    | 0 | 12 ->  12
    | _ -> hr mod 12
  in
  sprintf "%d:%02d%s" hr min ampm

let time_ofday_range_to_string s t =
  if Time.Ofday.equal s t then
    time_ofday_to_string s
  else
    let print_ampm = (ampm s) <> (ampm t) in
    let s = time_ofday_to_string ~print_ampm s in
    let t = time_ofday_to_string t in
    sprintf "%s - %s" s t

let string_list_to_string ?(use_and=false) ?(sep=", ") sl =
  let n = List.length sl in
  let buf = Buffer.create 128 in
  let rec loop = function
    | []
    | _::[] -> assert false
    | x::y::[] -> (
      Buffer.add_string buf x;
      (if use_and
       then Buffer.add_string buf " and "
       else Buffer.add_string buf sep)
      ;
      Buffer.add_string buf y
    )
    | x::l -> (
      Buffer.add_string buf x;
      Buffer.add_string buf sep;
      loop l
    )
  in
  match n with
  | 0 -> ""
  | 1 -> List.hd_exn sl
  | _ -> (loop sl; Buffer.contents buf)

let zip3 a b c =
  let rec loop accum a b c = match accum,a,b,c with
    | None, _, _, _ -> None
    | Some _, [], [], [] -> accum
    | Some accum, x::a, y::b, z::c -> loop (Some ((x,y,z)::accum)) a b c
    | Some _, [], _, _ -> None
    | Some _, _, [], _ -> None
    | Some _, _, _, [] -> None
  in
  loop (Some []) a b c
  |> Option.map ~f:List.rev

let get_list ?(on=',') al field =
  List.Assoc.find al field
  |> function
    | None -> []
    | Some y ->
      String.split y ~on
      |> List.map ~f:String.strip
      |> function [""] -> [] | l -> l

let quote = sprintf "\"%s\""
