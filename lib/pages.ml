open Core.Std
open Async.Std
open Html_types
open Tyxml.Html

let menu ~years =
  let home = div [a ~a:[a_href "index.html"] [pcdata "CUFP"]] in

  let years = List.sort years ~cmp:(fun x y -> Int.compare y x) in
  let latest_year = List.hd_exn years in
  let years =
    div [
      a ~a:[a_href @@ sprintf "%d/" latest_year] [
        pcdata @@ Int.to_string latest_year
      ];

      div ~a:[a_class ["sub-menu"]] (
        List.map years ~f:(fun x ->
          div [
            a ~a:[a_href @@ sprintf "%d/" latest_year] [
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
