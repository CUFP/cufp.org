(** String views. View a string as either a [string] or a [file].

    [`As_string s] means the string [s] should be viewed as a string,
    i.e. as itself. This is the identity view.

    [`As_file s] means view the string as a file containing the string
    [s]. Clients of this view should write [s] to a temporary file
    [filename], and pass [filename] to the context making use of this
    view. The client should also delete [filename] when the view is no
    longer needed.

    Note: if the data you need to use somewhere is a [filename]
    itself, that should be represented as [`As_string filename].
*)


type t = [
| `As_string of string
| `As_file of string
]
