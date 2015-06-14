- type: tutorial
- title: T4: Embedding and optimizing domain-specific languages in the typed final style
- speakers: Oleg Kiselyov
- affiliations: Tohoku University

## Abstract
Typed final (aka, ``tagless-final'') style is a general method of
embedding (typed, higher-order) domain-specific languages (DSL) in a
typed functional language such as Haskell, OCaml, Scala and Coq. Once
written, a DSL expression may be interpreted many times. Evaluator,
compiler, partial evaluator, pretty-printer are all interpreters. At
any time one may add more interpreters, and even more expression forms
to the DSL while re-using the previous interpreters as they were. Only
well-typed DSL terms are representable. Therefore, the type checker of
the host language checks -- and even infers for us -- DSL types. Even
DSLs with resource-sensitive (affine, linear) types are thus
embeddable.

It was recently discovered how to transform, simplify, and generally,
optimize DSLs embedded in this style. The optimization rules are
reusable, modular, composable, and type- and scope-preserving by
construction.

Using a familiar example and the OCaml language, the tutorial will explain the general
framework of embedding and optimizing DSLs. The tutorial will
be interactive, working through problems with active audience
participation.  It will be very helpful for the
participants to have a laptop with OCaml installed. No
libraries and packages beyond the standard library will be needed. The
most basic installation should suffice.

Only passing familiarity with OCaml will be assumed from the audience.
The tutorial will introduce all necessary language features, with
comments how they may be realized in other languages. 

## Tutorial objectives
By the end of the tutorial, the participants will:
* implement a simple but realistic and usable DSL of logical circuits
(hardware description language)
* write many interesting transformations, such as constant
propagation, conversion to normal forms, and simplification --
in small and easily composable steps.


## Target audience
Users, researchers, students of functional
programming. Basic knowledge of OCaml, ML, Haskell or other typed
higher-order functional language is assumed.

## Oleg Kiselyov
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/oleg-kiselyov.jpg" alt="Oleg Kiselyov"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Oleg Kiselyov is an Assistant Professor at the Tohoku
University, Japan. More information is on the web site
http://okmij.org/ftp/
</div>

</div>
