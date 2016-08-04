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
      "async"; "core"; "mpp"; "netstring"; "omd"; "ppx_sexp_conv";
      "rss"; "uri"; "yojson";
    ]
    ~ml_files:(`Add ["cufp_about.ml"])

let app : Project.item = Project.app "cufp.org"
    ~internal_deps:[lib]
    ~file:"app/cufp.org.ml"

let ocamlinit_postfix = [
  "open Core.Std";
  "open Async.Std";
  "open Cufporg.Cufp";
]

;;
let () =
  Project.solvuu1 ~project_name ~version ~ocamlinit_postfix [lib;app]
