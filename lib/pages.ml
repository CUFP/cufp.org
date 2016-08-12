open Core.Std
open Async.Std
open Html_types
open Tyxml.Html

let menu ~years =
  let home = div [a ~a:[a_href "index.html"] [pcdata "CUFP"]] in

  let years =
    List.sort years ~cmp:(fun x y -> Int.compare y x) |>
    List.tl_exn
  in
  let previous_year = List.hd_exn years in
  let prior_years = List.tl_exn years in
  let years =
    div [
      a ~a:[a_href @@ sprintf "/%d/" previous_year] [
        pcdata @@ Int.to_string previous_year
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
