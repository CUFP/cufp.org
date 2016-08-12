open Printf
open Solvuu_build.Std
open Solvuu_build.Util

let project_name = "cufporg"
let version = "dev"

let lib : Project.item = Project.lib project_name
    ~pkg:project_name
    ~dir:"lib"
    ~pack_name:project_name
    ~findlib_deps:[
      "async"; "core"; "markup"; "mpp"; "omd"; "ppx_sexp_conv";
      "uri"; "tyxml"
    ]
    ~ml_files:(`Add ["about.ml"])

let app : Project.item = Project.app "cufp.org"
    ~internal_deps:[lib]
    ~file:"app/cufp.org.ml"

let ocamlinit_postfix = [
  "open Core.Std";
  "open Async.Std";
  "open Cufporg.Std";
]

;;
let () =
  Project.solvuu1 ~project_name ~version ~ocamlinit_postfix [lib;app]
