- type: tutorial
- title: Camlp4 and Template Haskell
- speakers: Jake Donham, Nicolas Pouillard
- affiliations: , INRIA
- links: http://jaked.org/, 


## Abstract
"Static metaprogramming" is compile-time code analysis and
synthesis. It has many applications, such as \(from simple to complex\):
defining abbreviations, generating boilerplate from type definitions,
extending the language syntax, and embedding DSLs.

Static metaprogramming is supported for Haskell with Template Haskell,
and for OCaml with Camlp4; the two systems have a lot in common. In
this tutorial we will work through examples in both languages,
sticking mostly to their commonalities. We will also say a little
about features which are unique to each.

The main features we will cover are:

- host language syntax trees
- quotations / antiquotations for host language syntax trees
- defining new quotations
- pragmatics of each tool

\(Quotations / antiquotations are a mechanism for working with host
language abstract syntax trees using the concrete syntax of the host
language.\)

We will motivate these features through examples of increasing
complexity, including a simple DSL for working with JSON data.

Participants will leave with a basic understanding of how to build
syntax extensions with the two systems, including how to run the tool,
how to work with the host language syntax trees using quotations and
antiquotations, and how to define new quotations to extend the host
language.

## Audience
Participants should be familiar with either OCaml or Haskell, but we
will assume no prior knowledge of Template Haskell or Camlp4\. It would
be helpful to know the basics of parsing \(lexing vs. parsing, abstract
syntax trees, recursive descent\) and be familiar with at least one
parser generator.

## Software prerequisites
Participants should have recent versions of Objective Caml and the
Haskell Platform installed.  Objective Caml is available here:

[`http://caml.inria.fr/download.en.html`](http://caml.inria.fr/download.en.html)

The Haskell platform is available here:

[`http://hackage.haskell.org/platform/`](http://hackage.haskell.org/platform/)

For OCaml, participants need to
install Findlib:

[`http://projects.camlcity.org/projects/findlib.html`](http://projects.camlcity.org/projects/findlib.html)

and for both OCaml and Haskell the tutorial materials are at:

[`http://github.com/jaked/cufp-metaprogramming-tutorial/tarball/release-0930`](http://github.com/jaked/cufp-metaprogramming-tutorial/tarball/release-0930)

## [Jake Donham](http://jaked.org/)
is the author of several OCaml free
software projects, and blogs about OCaml at Ambassador to the
Computers. Jake previously spoke about the ocamljs project at CUFP
2008.

## Nicolas Pouillard
When learning programming in the engineering school of EPITA in Paris,
Nicolas Pouillard first met meta-programming using Camlp4 for very
basic syntax extensions, C++ templates and program transformation
using Stratego/XT.  Then he entered the research team of Xavier Leroy
at INRIA. He first spent six months as an intern for the renovation of
Camlp4 under the direction of Michel Mauny.  He continued with him by
accepting an engineer job on a project joint with Intel.  During this
contract he worked on a new front-end \(written in OCaml\) for their
in-house functional language featuring overloading and
meta-programming facilities.  During these months he also learned
Haskell and in particular meta-programming through Template Haskell.
Finally he continued as a PhD on "Safer and more expressive languages
for meta-programming" directed by Francois Pottier.  In this work we
aim at leveraging safety features like strong typing and lexical
scoping to manipulated programs within a meta-programming language.
