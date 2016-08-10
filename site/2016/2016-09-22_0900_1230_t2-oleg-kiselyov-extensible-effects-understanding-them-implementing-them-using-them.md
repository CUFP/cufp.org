- type: tutorial
- title: T2: Extensible Effects: understanding them, implementing them, using them
- speakers: Oleg Kiselyov

## Abstract
_Effects_ is a model of side-effects as an interaction between a
program and a handler: an authority in charge of resources that
receives and acts on program requests. Effects let us represent
side-effects in pure computations. The explicitness about possible and
not possible side-effects, the localized handling, controlled
interactions and encapsulation, the ease of reasoning make effects
useful even in impure languages, which can do side-effects natively.

There are several implementations of effects in Haskell and Scala.
Effects are natively supported in Idris and soon to be in OCaml. They
are the defining feature of PureScript.  Finally, the language Eff is
built on algebraic effects and local effect handling. By nature
effects are extensible, letting us easily combine in the same program
independently developed components, each with their own effects.  In
the narrow sense, _extensible effects_ refer to a specific
implementation method, often used in Haskell, Scala, and even in Coq.

This tutorial aims first to explain the ideas behind the extensible
effects, on simple to understand toy implementations. Then, using one
real, optimized implementation, we will experience defining and
handling various effects, on progressively more complex examples:
catching IO exceptions in the presence of other effects, custom
interactive parsing, non-determinism with committed choice (LogicT),
semi-automatic management of file handles and other resources through
monadic regions.

I intend the tutorial to be interactive, working through problems with
active audience participation.

## Tutorial objectives
By the end of the tutorial, the participants will hopefully:
 * Think of effects not as _lifting State through two Error
 and Reader_ but as a query or a transformation on resources such as
 memory, configuration data, schedulers, oracles, etc. Written
 formally, this transformation often takes the form of an effect handler;
 * Define their own effects and handlers, as befits the task at hand;
 * Learn to control the interactions between effects;
 * Have the background for their own implementation of effects.

Programming language: Haskell, although I will strive (especially in
the first, _understanding_ part) to use a very simple subset of
Haskell that could be easily mapped to other functional languages such
as Scala or OCaml.

## Target audience
Users, researchers, students of functional programming. Basic knowledge of Haskell, ML or other typed higher-order functional language is assumed.

## Infrastructure Required
I intend to work through many exercises, with
active audience participation. It will be very helpful for the
participants to have a laptop with the GHC installed (and being able
to download tutorial materials, before or during the tutorial). No
libraries and packages beyond the standard library will be needed. The
most basic installation should suffice.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/User_silhouette_512.png" alt="Oleg Kiselyov"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Oleg Kiselyov
Oleg Kiselyov is an Assistant Professor at the Tohoku
University, Japan. More information is on the web site
http://okmij.org/ftp/
</div>

</div>
