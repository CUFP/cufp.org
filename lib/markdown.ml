open Core.Std
open Async.Std

let to_html s =
  Omd.of_string s |> Omd.to_html |> Html.parse

let file_to_html file =
  Reader.file_contents file >>| to_html

let rec of_html html =
  List.map html ~f:(function
  | Nethtml.Data x -> Omd.Text x
  | Nethtml.Element (tag, attributes, child_html) ->
    let child_html = of_html child_html in
    match String.lowercase tag with
    | "h1" -> Omd.H1 child_html
    | "h2" -> Omd.H2 child_html
    | "h3" -> Omd.H3 child_html
    | "h4" -> Omd.H4 child_html
    | "h5" -> Omd.H5 child_html
    | "h6" -> Omd.H6 child_html
    | "a" -> Omd.Url (
      List.Assoc.find_exn attributes "href",
      child_html,
      ""
    )
    | _ -> Omd.Html (
      tag,
      List.map attributes ~f:(fun (x,y) -> x, Some y),
      child_html
    )
  )

let parse_assoc_list = function
  | Omd.Ul ul ->
    List.map ul ~f:(fun l ->
      List.map l ~f:(function
      | Omd.Text x -> x
      | Omd.Raw "&amp;" -> "&"
      | md ->
        failwithf "unexpected markdown list item: %s" (Omd.to_markdown [md]) ()
      )
      |> String.concat ~sep:""
      |> String.split ~on:':'
      |> (function
        | [] | _::[] ->
          failwith "colon not found in markdown assoc list"
        | x::rest ->
          (String.strip x, String.concat ~sep:":" rest |> String.strip)
      )
    )
  | _ -> failwith "expected markdown unordered list"
