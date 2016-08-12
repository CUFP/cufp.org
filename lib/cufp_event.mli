(** Events. *)
open Core.Std
open Async.Std

type typ = Talk | Keynote | Tutorial | BoF | Break | Discussion | Reception

type t = {
  typ : typ;
  title : string;
  url_title : string;
  date : Date.t;
  start : Time.Ofday.t;
  finish : Time.Ofday.t;
  speakers : Person.t list;
  session : string option;
  video : Video.t option;
  slides : Slides.t option;
  description : Omd.t;
}

(** Information encoded in filename. *)
type file_name_info = {
  url_title : string;
  date : Date.t;
  start : Time.Ofday.t;
  finish : Time.Ofday.t;
}


(** {6 Parsers and Constructors} *)

val make :
  typ:typ ->
  title:string ->
  url_title:string ->
  date : Date.t ->
  start : Time.Ofday.t ->
  finish : Time.Ofday.t ->
  speakers : Person.t list ->
  session : string option ->
  video : Video.t option ->
  slides : Slides.t option ->
  description : Omd.t ->
  unit ->
  t

(** First item in markdown must be a list specifying: typ, title,
    speakers, and files. Everything after is taken as the
    description. The url_title, date, start, and finish are taken from
    the filename. *)
val of_markdown : filename:string -> Omd.t -> t
val of_string : filename:string -> string -> t
val of_file : string -> t Deferred.t

val parse_filename : string -> file_name_info
val is_valid_filename : string -> bool


(** {6 Printers} *)

(** Return base of a filename for given event, without any extension. *)
val filename_base : t -> string

(** [to_file t dir] prints [t] to a file within [dir]. The filename is
    determined automatically. *)
val to_file : t -> string -> unit Deferred.t

val to_html :
  years:int list ->
  background_image:string ->
  t ->
  Html_types.body_content Tyxml.Html.elt list

val typ_to_string : typ -> string

(** Return description of a Break or Discussion as a plain
    string. Raise [Failure] if called on other types of events. *)
val short_description : t -> string

(** Foundation icon for given event [typ], if any. *)
val icon : typ -> Html.item Or_error.t
