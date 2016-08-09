open Core.Std
open Async.Std

type item = Nethtml.document
type t = item list
type attributes = (string * string) list

let parse s =
  Netchannels.with_in_obj_channel
    (new Netchannels.input_string s)
    Nethtml.parse

let parse_file file =
  Reader.file_contents file >>| parse

let to_string docs =
  let buf = Buffer.create 2048 in
  Netchannels.with_out_obj_channel (new Netchannels.output_buffer buf)
    (Fn.flip Nethtml.write docs)
  ;
  Buffer.contents buf

let item tag ?(a=[]) childs =
  Nethtml.Element(tag, a, childs)

let data s = Nethtml.Data s

let div = item "div"
let span = item "span"
let iframe = item "iframe"

let a = item "a"
let i = item "i"
let br = item "br" []

let ul = item "ul"
let li = item "li"

let h1 = item "h1"
let h2 = item "h2"
let h3 = item "h3"
let h4 = item "h4"
let h5 = item "h5"
let h6 = item "h6"

let table = item "table"
let thead = item "thead"
let th = item "th"
let tbody = item "tbody"
let tr = item "tr"
let td = item "td"

let dl = item "dl"
let dd = item "dd"

let script = item "script"

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

let map_links
    ?(attributes_to_map = attributes_with_link_values)
    ~f
    t
    =
  let rec map_links_in_item item =
    let open Nethtml in
    match item with
    | Data _ as x -> x
    | Element (elem_name, attributes, subnodes) ->
      let attributes = match List.Assoc.find attributes_to_map elem_name with
        | None -> attributes
        | Some attr_to_map ->
          List.map attributes ~f:(fun ((attr_got, value) as x) ->
            if attr_got = attr_to_map then
              (attr_got, f value)
            else
              x
          )
      in
      Element (
        elem_name,
        attributes,
        List.map subnodes ~f:map_links_in_item
      )
  in
  List.map t ~f:map_links_in_item

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
