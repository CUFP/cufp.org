- type: tutorial
- title: T5: Idris: Practical Software Verification with Dependent Types 
- speakers: Edwin Brady
- affiliations: University of St Andrews


## Abstract
Idris is a general purpose functional programming language with full
dependent types, building on state-of-the-art techniques in
programming language research. Dependent types allow types to be
predicated on any value - in this way, required properties of a
program can be captured in the type system, and verified by a type
checker. This includes functional properties (i.e. does the program
give the correct answer) and extra-functional properties (i.e. does
the program run within specified resource constraints).

Idris aims to bring type-based program verification techniques to
programming practitioners while supporting efficient systems
programming via an optimising compiler and interaction with external
libraries.

In this tutorial, I will use a series of examples to show how
dependent types may be used for verifying realistic and important
properties of software, from simple properties such as array bounds
verification, to more complex properties of communicating and
distributed systems.

## Tutorial objectives
The main objective of the tutorial is to give an overview of what is
expressible in modern, state-of-the-art, type systems, and to give
participants some introductory experience with the Idris programming
language.

The tutorial will explain why software correctness, particularly
extra-functional correctness, is important, and show how Idris\'
dependent type system can support this. It will cover:

* Getting started: compiling and running programs
* Simple functional properties of lists
* Extra-functional properties including side-effects and resource
  usage protocols
* A concluding example: using the type system to reason about
  communicating systems

By the end of the tutorial, participants will understand how to
express invariants in a dependent type system, how to write programs
which respect those invariants, and how to use embedded domain
specific languages as an abstraction layer over those invariants to
reduce or even eliminate the theorem proving burden on application
developers.

Code for the tutorial examples will be made available, along with accompanying exercises.

## Target audience
Participants should be comfortable reading (but not necessarily
writing) a typed functional language such as Haskell or OCaml. No
advance knowledge of dependent types or software verification will be
required.

Participants should install Idris on a laptop beforehand to follow
along with examples (instructions at http://idris-lang.org/download).


## Edwin Brady
<!--<img align="right" src="img/edwin-brady.jpg" alt="Edwin Brady"></img>-->
Edwin Brady is a Lecturer in Computer Science at the University of St
Andrews in Scotland. His research interests there include programming
language design, in particular type systems and domain specific
languages.  Since 2008, he has been designing and implementing the
Idris programming language, a general purpose functional programming
language with dependent types, which he uses to implement verified
domain specific languages. When he\'s not doing that, he\'s likely to
be playing a game of Go, wrestling with the crossword, or stuck on a
train somewhere in Britain.
