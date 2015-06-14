- type: tutorial
- title: T5: LiquidHaskell: Programming With Liquid Types in Haskell
- speakers: Niki Vazou
- affiliations: UC San Diego

## Abstract
Haskell has many delightful features, perhaps the most
beloved of which is its type system which allows developers
to specify and verify a variety of program properties at compile
time. However, many properties, typically those that depend
on relationships between program values are impossible, or
at the very least, cumbersome to encode within Haskell's
type system.

Liquid types enable the specification and verification of
value-dependent properties by extending Haskell's type system
with logical predicates drawn from efficiently decidable logics.

In this tutorial, we will start with a high level description of
Liquid Types. Next, we will present an overview of
LiquidHaskell, a liquid type checker for Haskell.
In particular, we will describe the kinds of properties
that can be checked, ranging from generic requirements
like like totality (will 'head' crash?) and termination
(will 'mergeSort' loop forever?), to application specific
concerns like memory safety (will my code SEGFAULT?)
and data structure correctness invariants (is this tree BALANCED?) .

Joint work with: Ranjit Jhala, Eric Seidel, Patrick Rondon, Dimitris
Vytiniotis and Simon Peyton-Jones.

## Tutorial objectives
The goal of the tutorial is to teach attendees about the basics
of logic, and liquid types and they can use such types to
design, specify and verify correctness of their programs.

The tools will be available over the web (see below) and can be
accessed via a browser. However, ideally, the participants would
require on their system (MacOs, Windows or Linux) a recent installation
of Haskell (GHC-7.8.3 + cabal). After this the participants need to:

1. Install [Z3](https://github.com/Z3Prover/z3)
2. `cabal install liquidhaskell

The material will be drawn from a book on programming with
refinement types that we are writing (in concert with the
LiquidHaskell tool).

* [HTML](http://refinement-types.org)
* [PDF](http://ucsd-progsys.github.io/liquidhaskell-tutorial/book.pdf)
* [Source](https://github.com/ucsd-progsys/liquidhaskell-tutorial/tree/master/src)

**References:**

In addition to the book (we will only touch a fraction during the workshop),
the participants can learn more via introductory blog articles, as well as
research papers listed at: http://goto.ucsd.edu/liquid


## Target audience
Users, researchers, students of functional
programming. Basic knowledge of OCaml, ML, Haskell or other typed
higher-order functional language is assumed.

## Niki Vazou
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/niki-vazou.jpg" alt="Niki Vazou"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Niki Vazou is a PhD student studying type systems at UC San Diego.
She works on liquidHaskell and tries to integrate
formal verification into the standard Haskell development chain,
by building an automatic, usuable and fast refinement type checker.

</div>

</div>
