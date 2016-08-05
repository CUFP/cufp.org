open Core.Std
open Async.Std

type json = Yojson.Basic.json

type redirect = {
  url : string;
}

type t =
| Redirect of redirect

let get_string al field : string =
  match List.Assoc.find al field with
  | Some (`String x) -> x
  | Some x ->
    failwithf "\"%s\" field expected to be a string but got %s"
      field (Yojson.Basic.to_string x) ()
  | None -> failwithf "\"%s\" field not found" field ()

let of_file file =
  Reader.file_contents file >>|
  Yojson.Basic.from_string >>|
  function
  | `Assoc al -> (
    match get_string al "type" with
    | "redirect" ->
      Redirect {url = get_string al "url"}
    | x -> failwithf "%s: unsupported json with \"type\": \"%s\"" file x ()
  )
  | _ -> failwithf "%s: expected json object" file ()

let to_html ?(production=false) ~depth t =
  let open Nethtml in
  let html = match t with
    | Redirect x ->
      let url =
        if production
        then x.url
        else
          Html.relativize_link ~depth x.url
          |> Html.append_index_html
      in
      [Element ("html", [], [
        Element ("head", [], [
          Element ("meta",
                   [
                     "http-equiv", "refresh";
                     "content", sprintf "0; url=%s" url;
                   ],
                   []
          )])])]
  in
  if production then html
  else
    Html.map_links html ~f:(fun link ->
      Html.relativize_link ~depth link
      |> Html.append_index_html
    )
