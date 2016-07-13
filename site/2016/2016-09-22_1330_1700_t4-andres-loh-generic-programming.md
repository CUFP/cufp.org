- type: tutorial
- title: An Introduction to to Type-Level and Generic Programming in Haskell
- speakers: Andres Löh

## Abstract
In this tutorial, I will introduce "generics-sop", a library that
supports datatype-generic programming in Haskell.

The idea of datatype-generic programming is to expose a uniform,
yet typed, representation of all datatypes, which can be used to
define algorithms that work over a large class of datatypes, and
can automatically adapt to changes in datatypes.

Examples of datatype-generic functions are functions that are typically
"derived", such as equality and comparison functions, all sorts of
(de)serialization functions to various formats, traversals and
accessors, editing operators, functions for querying and updating
databases, and many more.
The specific structure that generics-sop uses is based on heterogenous
lists and heterogeneous choices. Working with them in Haskell requires
several type system extensions available in Haskell, such as GADTs,
data kinds, polymorphic kinds, constraint kinds, and rank-n
polymorphism.

We will define several example generic functions using generics-sop,
and use the goal of datatype-generic programming as a motivation to
introduce the type system features that we need.

## Tutorial objectives


## Target audience
Intermediate and advanced Haskellers with solid knowledge
of the core language features, and who want to learn more about type-level
and/or datatype-generic programming. No prior knowledge of type system
extensions such as GADTs or data kinds is assumed.

## Infrastructure Required
Participants need to bring a laptop with the GHC compiler (>= 8.0.1) and

## Speaker Bio
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
practice. I am also responsible for designing and developing our Haskell training courses.
