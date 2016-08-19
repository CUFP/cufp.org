open Core.Std
open Async.Std

(******************************************************************************)
(* HTML fragments *)
(******************************************************************************)
let menu ~years =
  let open Tyxml.Html in
  let home = div [a ~a:[a_href "index.html"] [pcdata "CUFP"]] in

  let years = List.sort years ~cmp:(fun x y -> Int.compare y x) in
  let current_year = List.hd_exn years in
  let prior_years = List.tl_exn years in
  let years =
    div [
      a ~a:[a_href @@ sprintf "/%d/" current_year] [
        pcdata @@ Int.to_string current_year
      ];

      div ~a:[a_class ["sub-menu"]] (
        List.map prior_years ~f:(fun x ->
          div [
            a ~a:[a_href @@ sprintf "/%d/" x] [
              pcdata @@ Int.to_string x
            ]
          ]
        )
      )
    ]
  in

  div ~a:[a_class ["row"]] [
    nav [home; pcdata " "; years]
  ]


(******************************************************************************)
(* Links *)
(******************************************************************************)
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
