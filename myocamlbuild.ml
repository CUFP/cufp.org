open Solvuu_build

include Make(struct
  let name = "cufporg"
  let version = "dev"

  let info = Info.of_list [
    {
      Info.name = `Lib "async";
      libs = [];
      pkgs = [
        "async"; "core"; "mpp"; "netstring"; "omd"; "ppx_sexp_conv";
        "rss"; "uri"; "yojson";
      ];
      build_if = [];
    };
    {
      Info.name = `App "cufp.org";
      libs = ["async"];
      pkgs = [];
      build_if = [];
    };
  ]

  let ocamlinit_postfix = [
    "open Core.Std";
    "open Async.Std";
  ]
end)

let () = dispatch()
