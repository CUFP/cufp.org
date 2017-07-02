- type: tutorial
- title: T2: Extensible Effects: understanding them, implementing them, using them
- speakers: Oleg Kiselyov

## Abstract
_Effects_ is a model of side-effects as an interaction between a
program and a handler: an authority in charge of resources that
receives and acts on program requests. The explicitness about the
possible and not possible side-effects, the localized handling,
controlled interactions and encapsulation, the ease of reasoning make
effects useful even in impure languages, which can do side-effects
natively.

There are several implementations of effects in Haskell and Scala.
Effects are natively supported in Idris and soon to be in OCaml. They
are the defining feature of PureScript.  Finally, the language Eff is
built on algebraic effects and local effect handling. By nature
effects are extensible, letting us easily combine in the same program
independently developed components, each with their own effects.  In
the narrow sense, _extensible effects_ refer to a specific
implementation method, often used in Haskell, Scala, and even in Coq.

This tutorial aims first to explain the ideas behind the extensible
effects, on a progression of simple to understand but nevertheless
realistic implementations. Using the final implementation, we we will
experience defining and handling various effects, on more complex and
actually useful examples: transactional memory, probabilistic
programming, incremental parsing and modular rollback.

This tutorial to be interactive, working through problems with
active audience participation.

## Tutorial objectives
* think of effects not as "lifting State through two Error and Reader" but as
a query or a transformation on resources such as memory, configuration data, schedulers, oracles, etc. Written
formally, this transformation often takes the form of an effect handler;
* define their own effects and handlers, as befits the task at hand;
* learn to control the interactions between effects;
* have the background for their own implementation of effects in your favorite language

## Target audience
Users, researchers, students of functional programming. Basic knowledge of Haskell,
ML or other typed higher-order functional language is assumed.

Programming language: Haskell, although tutor will strive (especially in the first,
"understanding" part) to use a very simple subset of Haskell that could be easily
mapped to other functional languages such as Scala or OCaml.

## Infrastructure required
It will be very helpful for the participants to have a laptop with the GHC installed (and being able to download tutorial materials, before or during the tutorial). No libraries and packages beyond the standard library will be needed. The most basic installation should suffice.

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
[http://okmij.org/ftp/](http://okmij.org/ftp)
</div>

</div>
