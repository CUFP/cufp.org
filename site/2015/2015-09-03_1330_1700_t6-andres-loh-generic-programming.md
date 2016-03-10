- type: tutorial
- title: T6: An Introduction to Type-Level and Generic Programming in Haskell
- speakers: Andres Löh
- affiliations: Well-Typed LLP

## Abstract
Many Haskell functions can be defined for a large class of datatypes in a
systematic way. Examples include structural equality and comparisons, all kind
of (de)serialization functions (plain text, JSON, binary,
etc.), traversal and access functions such as lenses and their various
variants, functions for querying and updating databases and many more. For
some built-in type classes, Haskell offers the "deriving" construct, but GHC
also has a "generics" feature that allows users to define their own derivable
classes, without having to resort to Template Haskell.

In this tutorial, we will introduce "generics-sop", a library that supports
such datatype-generic programming by means of a number of powerful,
higher-order combinators that can be reused and composed in several ways.
This approach makes use of several type-system extensions available for GHC,
such as GADTs (in particular, for heterogeneous lists), data kinds, kind
polymorphism, constraint kinds, and rank-n polymorphism. We will
introduce these concepts as needed and use "generics-sop" as motivation and
example of how they can be put to good use. We will then also use
"generics-sop" to define several example generic functions.

## Tutorial objectives



## Target audience
Intermediate and advanced Haskellers with solid knowledge
of the core language features, and who want to learn more about type-level
and/or datatype-generic programming. No prior knowledge of type system
extensions such as GADTs or data kinds is assumed.

Participants need to bring a laptop with the GHC compiler and the generics-sop
package (available on Hackage) installed.

## Andres Löh
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/andres-loh.jpg" alt="Andres Löh"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
I am a Haskell consultant and co-owner of Well-Typed LLP, living in
Regensburg, Germany. My first exposure to functional programming was during
my undergraduate studies in Mathematics and Computer Science at the
University of Konstanz. Inspired by that, I did a PhD on datatype-generic
programming in Haskell at Utrecht University, which I completed in 2004. After
being a postdoc and lecturer in Tallinn, Freiburg, Bonn, and Utrecht, I joined
Well-Typed in 2010.

I am very interested in applying functional programming to real-world
problems, and in particular in designing a programming language and its type
system such that it facilitates code reuse and code evolution. To me,
datatype-generic programming is an important technique to achieve these goals.
Other research interests of mine include domain-specific languages, dependent
types, parallel and concurrent programming, and version control.

At Well-Typed, I'm working on various projects for companies that use Haskell,
as well as on open-source Haskell projects. I enjoy finding many opportunities
to apply Computer Science research (other people's as well as mine) in
practice. I am also responsible for designing and developing our Haskell
training courses.

</div>

</div>
