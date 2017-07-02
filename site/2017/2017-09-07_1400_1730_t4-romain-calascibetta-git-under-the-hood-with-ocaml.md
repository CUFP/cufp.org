- type: tutorial
- title: T4: Git under the hood with OCaml
- speakers: Romain Calascibetta

## Abstract
Git is one of the most popular tools for developers and -- while this is usually little known -- part of the power of Git comes from functional concepts. `ocaml-git` is a re-implementation of the Git protocol(s) in pure OCaml: it can synchronize (push and pull) with remote Git servers and it can inspect, create and modify local Git repositories (all Git object kinds are supported, including compressed PACK files).
Using Git as a library with `ocaml-git` unlocked a new ecosystem of Git-based applications, including `Irmin`, a Git-like database or `datakit`, a Git-like orchestration tool (both used in production at Docker Inc).. Blockchain ledger such as `Tezos`, tamper-evident logging system, or conflict-free replicated datatypes have also been built using `ocaml-git` and `Irmin`.

In this tutorial, we will learn more about Git using OCaml.  The first part of the talk will be dedicated to understanding the on-disk Git format and to explaining the functional concepts that Git uses to be really efficient: immutability, radix/patricia tree, etc.
In the second part of this talk, we will implement a simple application to display the history of local Git repositories on a webpage, using `ocaml-git` and `js_of_ocaml`.

## Tutorial objectives
The main goal of this tutorial is to understand the core of Git; where, why and how Git uses functional concepts; and how to interface Git repositories with OCaml applications.
The tutorial will primarily focus on using `ocaml-git` on a specific platform (JavaScript) with  `js_of_ocaml`. At the end of the tutorial, people will have built a web interface to show the history of Git repositories.

## Target audience
This tutorial uses OCaml and it is therefore expected that attendees will have prior understanding of OCaml language and concepts. Having experience will `js_of_ocaml` will also help, but is not necessary as templates for the toolchain workflow will be provided.

## Infrastructure required
A working dev environment for OCaml, using your favorite text editor. `ocaml-git` and `js_of_ocaml` can be installed beforehand using opam.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/User_silhouette_512.png" alt="Romain Calascibetta"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Romain Calascibetta
Romain Calascibetta is an independent developer specializing in OCaml. He currently works for OCaml Labs on improving the current implementation of `ocaml-git`, and also contribute widely to the MirageOS project. Prior work includes a library to process email (Mr. MIME), an implementation of `zlib` in OCaml, an implementation of some encryption functions (BLAKE2B and Curve25519) and other-side projects. Romain previously worked with the Ocsigen team (to start a PoC to integrate `ocaml-cohttp` in the Ocsigen server), and OCamlPro and he works now with the OCaml Labs team and contribute to MirageOS.
</div>

</div>
