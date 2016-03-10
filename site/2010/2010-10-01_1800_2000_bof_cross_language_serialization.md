- type: bof
- title: BoF: Cross Language Serialization
- speakers: Anton Lavrik


Room 1

*Topic*: a BOF session for discussing cross-language interoperability
in general and cross-language data serialization in particular.

The ability for functional languages to inter-operate with other
programming languages especially in heterogeneous and distributed
environments is critical for their commercial applicability.

The situation with cross-system interoperability for FP has been
constantly improving, however there are a lot of challenges and
problems to be solved. Some problems are caused by the fact that FP
languages usually offer a richer and sometimes incompatible data
models compared to mainstream programming languages. Other problems
exist due to small user communities.

There are several projects which are related to the proposed topic and
which I'm aware of.

- Martin Jambon's json-wheel/json-static for OCaml and its successor
  atd/biniou/yojson. It addresses OCaml-Java and OCaml-\*
  interoperability via JSON.

- Hydro -- OCaml implementation of ZeroC ICE RPC. Addresses
  interoperability between OCaml and languages supported by ZeroC ICE
  system.

- Apache Thrift. Supports OCaml, Erlang, Haskel and a number of other
  languages.

- Google Protocol Buffers. There are third-party implementations for
  Scala, Common Lisp, Haskel, Erlang \(partial\) and many other
  languages \(officially supported are Python, C++, Java, Go\).

- Piqi. Addresses interoperability between OCaml, Erlang and languages
  supported by Google Protocol Buffers.

*Confirmed attendees*: Anton Lavrik, Martin Jambon, Thomas Gazagnaire,
Anil Madhavapeddy, Mark Lentczner, Sylvain Le Gall, Matthias Horn,
Ashish Agarwal
