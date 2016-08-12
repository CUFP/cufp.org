open Core.Std
open Async.Std

let attributes_with_link_values = [
  "link", "href";
  "script", "src";
  "img", "src";
  "a", "href";
]

let relativize_link ~depth link =
  match String.chop_prefix link ~prefix:"/" with
  | None -> link
  | Some link ->
    let prefix =
      if depth = 0 then
        "./"
      else if depth > 0 then
        (List.init depth ~f:(fun _ -> "..") |> String.concat ~sep:"/")
        ^ "/"
      else
        failwithf "invalid depth %d" depth ()
    in
    prefix ^ link

let append_index_html s =
  match Uri.of_string s |> Uri.host with
  | Some _ -> s
  | None ->
    match String.chop_suffix s ~suffix:"/" with
    | None -> s
    | Some _ -> s ^ "index.html"

let map_links_str ?(attributes_to_map = attributes_with_link_values) ~f x =
  let f = function
    | `Start_element ((elem_namespace,elem_name) as elem, attributes) -> (
        let attributes =
          match List.Assoc.find attributes_to_map elem_name with
          | None -> attributes
          | Some attr_to_map ->
            List.map attributes
              ~f:(fun (((attr_namespace,attr_name) as attr, value) as x) ->
                match String.equal attr_name attr_to_map with
                | false -> x
                | true -> (attr, f value)
              )
        in
        `Start_element (elem, attributes)
      )
    | `End_element
    | `Text _
    | `Doctype _
    | `Xml _
    | `PI _
    | `Comment _ as x -> x
  in
  Markup.(string x |> parse_html |> signals |> map f |> write_html |> to_string)
