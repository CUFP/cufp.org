- type: tutorial
- title: C8: GraphQL Servers in OCaml
- speakers: Andreas Garnæs

## Abstract
By being client-centric, GraphQL allows you to deliver features faster, with fewer network roundtrips and less data going over the wire. Unlike REST, types are front and center in GraphQL: all input and output types must be declared up front in a schema. It's these type declarations that enable some of GraphQL's unique selling points: self-documenting APIs that can be explored and introspected with explicit guarantees on the shape of data.

The types declared in your GraphQL schema are connected to the types in your application code, but it turns out to be quite hard to capture this connection. Most GraphQL libraries resolve to runtime checks and type coercions rather than static type checking to enforce this connection. With OCaml's powerful type system, `ocaml-graphql` is able to tie the types in  schema to the types in your application code, resulting in compile-time checking of GraphQL schemas!

## Tutorial objectives
* Gain a fundamental understanding of GraphQL.
* Be introduced to `ocaml-graphl` and the type machinery involved.
* Learn how to write GraphQL endpoints in OCaml that are fast and correct.

## Target audience
OCaml developers with an interest in web programming.

## Infrastructure required
- Beforehand participants should either (1) download a preconfigured Docker image, or (2) install OCaml, opam and required packages locally.
- Internet connectivity is required during the tutorial.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/User_silhouette_512.png" alt="Andreas Garnæs"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Andreas Garnæs
Andreas Garnæs leads a team of engineers at Zendesk, where GraphQL is playing an
increasingly important role. After much frustration about the lack of type safety in other
GraphQL implementations, Andreas authored a GraphQL library in OCaml, ocaml-graphql.
Besides OCaml, Andreas is excited about microservices, Go and Ruby.
</div>

</div>
