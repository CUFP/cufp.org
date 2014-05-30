open Core.Std
open Async.Std
module Conference = Cufp_conference
module Html = Cufp_html
module Markdown = Cufp_markdown
module Person = Cufp_person
module Util = Cufp_util
let (/) = Filename.concat

module Post = struct
  type t = {
    title : string;
    url_title : string;
    author : Cufp_person.t option;
    pubdate : Date.t;
    description : Omd.t;
    categories : string list;
  }

  type file_name_info = {
    url_title : string;
    pubdate : Date.t;
  }


  (****************************************************************************)
  (* Miscellaneous                                                            *)
  (****************************************************************************)
  let uri ?(style=`Absolute) (t:t) =
    let prefix = match style with
      | `Absolute -> "http://cufp.org/blog"
      | `Site_root_relative -> "/blog"
    in
    Uri.of_string (
      sprintf "%s/%s_%s.html"
        prefix
        (Date.format t.pubdate "%Y-%m-%d" )
        t.url_title
    )


  (****************************************************************************)
  (* Printers                                                                 *)
  (****************************************************************************)
  let to_file t dir =
    let open Omd in
    let md =
      Ul (
        [Text (sprintf "title: %s" t.title)]::
          [Text (
            String.concat ~sep:"," t.categories
            |> sprintf "categories: %s"
          )]::
          [Text (
            Option.value_map t.author ~default:"" ~f:(fun x -> x.Person.name)
            |> sprintf "author: %s"
          )]::
          [Text (
            Option.value_map t.author ~default:"" ~f:(fun x ->
              Option.value_map x.Person.email ~default:"" ~f:Fn.id
            )
            |> sprintf "email: %s"
          )]::
          []
      )
      ::t.description
    in
    let out_file = Filename.concat dir (
      sprintf "%s_%s"
        (Date.to_string t.pubdate)
        (t.url_title ^ ".md") )
    in
    Unix.mkdir ~p:() dir >>= fun () ->
    Writer.save out_file ~contents:(Omd.to_markdown md)

  let to_html_item (t:t) =
    let open Html in
    let date = data (Date.format t.pubdate "%B %d, %Y") in
    let uri = uri ~style:`Site_root_relative t |> Uri.to_string in
    div ~a:["class","post"] [
      h3 [
        a ~a:["href",uri] [data t.title]
      ];
      div ~a:["class","date"] [date];
      div (Omd.to_html t.description |> Html.parse);
    ]

  let to_html t = [to_html_item t]

  let to_rss (t:t) : Rss.item =
    let link =
      uri ~style:`Absolute t
      |> Uri.to_string
      |> Neturl.parse_url
    in
    Rss.item
      ~title:t.title
      ~link
      ~desc:(Omd.to_html t.description)
      ~pubdate:(Date.to_string t.pubdate |> Netdate.parse)
      ?author:(match t.author with
      | None -> None
      | Some x -> Person.to_string_rss x
      )
      ~cats:(List.map t.categories ~f:(fun cat_name ->
        {Rss.cat_name; cat_domain=None} )
      )
      ?comments:None
      ?encl:None
      ~guid:(Rss.Guid_permalink link)
      ?source:None
      ?data:None
      ()


  (****************************************************************************)
  (* Parsers/Constructors                                                     *)
  (****************************************************************************)
  let parse_filename s =
    if not (Filename.check_suffix s ".md") then
      failwithf "invalid filename %s" s ()
    else
      let s' = Filename.chop_suffix s ".md" |> Filename.basename in
      match String.split ~on:'_' s' with
      | pubdate::(_::_ as rest) ->
        {
          pubdate = (Date.of_string pubdate);
          url_title = String.concat ~sep:"_" rest
        }
      | _ -> failwithf "invalid filename %s" s ()

  let is_valid_filename s =
    try ignore (parse_filename s); true
    with Failure _ | Invalid_argument _ -> false

  let make ~title ~url_title ?author ~pubdate ~description ~categories () =
    if not (Util.is_url_string url_title) then
      failwithf "invalid url_title %s" url_title ()
    else
      {title; url_title; author; pubdate; description; categories}

  let of_markdown ~filename contents =
    let expected_fields = String.Set.of_list
      ["title"; "author"; "email"; "categories"]
    in
    let {pubdate; url_title} = parse_filename filename in
    match contents with
    | ul::description -> (
      Markdown.parse_assoc_list ul
      |> fun ul ->
        let got_fields = List.map ul ~f:fst |> String.Set.of_list in
        if not (Set.subset got_fields expected_fields) then
          failwithf "%s: invalid fields: %s"
            filename
            (
              Set.diff got_fields expected_fields
              |> Set.to_list
              |> String.concat ~sep:", "
            )
            ()
        else
          make
            ~title:(List.Assoc.find_exn ul "title")
            ~url_title
            ?author:(
              match List.Assoc.find ul "author", List.Assoc.find ul "email" with
              | None, None -> None
              | None, Some email ->
                failwithf "%s: must give name for email %s" filename email ()
              | Some name, email ->
                Some (Person.make ~name ?email ())
            )
            ~pubdate
            ~categories:(
              match List.Assoc.find ul "categories" with
              | None -> []
              | Some x ->
                String.split ~on:',' x
                |> List.map ~f:String.strip
                |> function [""] -> [] | l -> l
            )
            ~description
            ()
    )
    | _ -> failwithf "%s: invalid markdown schema" filename ()

  let of_string ~filename s =
    of_markdown ~filename (Omd.of_string s)

  let of_file filename =
    Reader.file_contents filename >>|
    of_string ~filename

end

(******************************************************************************)
(* Feeds                                                                      *)
(******************************************************************************)
type t = Post.t list

let make posts =
  let n = List.length posts in
  let m =
    List.map posts ~f:(fun x ->
      Post.uri ~style:`Absolute x
      |> Uri.to_string
    )
    |> String.Set.of_list
    |> Set.length
  in
  if m <> n then
    failwith "posts do not have unique URIs"
  else
    List.sort posts ~cmp:(fun (p:Post.t) q ->
      Date.compare q.Post.pubdate p.Post.pubdate
    )

let of_dir dir =
  Sys.readdir dir >>=
  Util.lift Array.to_list >>=
  Util.lift (List.filter ~f:Post.is_valid_filename) >>=
  Deferred.List.map ~f:(fun file -> Post.of_file (dir/file)) >>=
  Util.lift make


let to_rss_channel (t:t) : Rss.channel =
  Rss.channel
    ~title:"CUFP"
    ~link:(Neturl.parse_url "http://cufp.org/blog")
    ~desc:"CUFP blog."
    ~language:"en"
    ~copyright:(
      sprintf
        "Copyright %d - %d, Commercial Users of Functional Programming"
        Conference.first_year Date.((today()).y)
    )
    ?managing_editor:None
    ?webmaster:None
    ?pubdate:(
      List.map t ~f:(fun x -> x.Post.pubdate)
      |> List.sort ~cmp:Date.compare
      |> List.last
      |> Option.map ~f:(fun x -> Date.to_string x |> Netdate.parse)
    )
    ~last_build_date:(Time.now() |> Time.to_epoch |> Netdate.create)
    ~cats:(
      List.map t ~f:(fun x -> x.Post.categories)
      |> List.concat
      |> String.Set.of_list
      |> String.Set.to_list
      |> List.map ~f:(fun x -> {Rss.cat_name=x; cat_domain=None})
    )
    ?generator:None
    ?cloud:None
    ?ttl:None
    ?image:None
    ?rating:None
    ?text_input:None
    ?skip_hours:None
    ?skip_days:None
    ?data:None
    ?namespaces:None
    (List.map t ~f:Post.to_rss)

let to_string_rss t =
  let date_fmt = "%a, %d %b %Y %T %z" in
  to_rss_channel t |>
  Rss.print_channel ~date_fmt Format.str_formatter;
  Format.flush_str_formatter ()

let to_html (t:t) =
  List.map t ~f:Post.to_html_item

let take = List.take
let filter = List.filter
