- type: tutorial
- title: T11: Batteries Included: Generative Programming with Scala and LMS
- speakers: Tiark Rompf, Nada Amin
- affiliations: Oracle Labs & EPFL, EPFL

<div class="row" media:type="text/omd">
<div class="small-12 columns" media:type="text/omd">
## Abstract
Functional language implementations have come a long way towards
robustness and efficiency. Nevertheless, for hard-core systems level
programming, low-level C code is still the industry standard. The
drawbacks are well known: buggy systems, security vulnerabilities,
poor programmer productivity, etc.

Generative programming is an alternative: writing expressive
high-level programs that generate fast low-level code at runtime.

While many functional languages come with basic code generation
facilities, generative programming has remained somewhat of a black
art. Recent developments, however, promise to make generative
programming much more accessible.

This tutorial provides a step-by-step introduction to the open-source
LMS (Lightweight Modular Staging) framework, which brings runtime code
generation and compilation to Scala programs.

We will present powerful generative programming patterns that enable
abstraction without (performance) regret, and thus make Scala a more
productive alternative to C for systems-level programming where the
last drop of performance matters.

Within this half-day tutorial, we will build a SQL query engine that
outperforms commercial and open source database systems and consists
of just about 500 lines of high-level Scala code.

Along the way, we will discuss concepts such as mixed-stage data
structures that contain both static and dynamic parts (e.g. static
schema and dynamic values for data records) and staged interpreters
which can be mechanically turned into compilers (e.g. for SQL queries
or regular expressions).

## Tutorial objectives
This tutorial will equip attendees with the knowledge required to use
generative programming techniques in general, and Scala/LMS in
particular.

To this end, the tutorial will cover the following parts:

1. Generative programming ideas and key LMS concepts 
  - using types to distinguish present-stage and future-stage code (T vs Rep[T])

2. Demo and hands-on with small generative examples as warm-up
  - sparse matrix vector multiply (“Shonan Challenge”)
  - compiling regular expression matchers
      
3. From a naive SQL interpreter to a fast SQL compiler, step by step,
   with a focus on generative design patterns
  - mixed stage data structures (static schema, dynamic values)
  - staging an interpreter yields a compiler (Futamura projection)
  - data structure specialization (fast hash-tables for joins)

## Target audience
This tutorial is aimed at programmers with a basic understanding of
functional programming, systems building and performance
considerations. Experience with Scala and/or generative techniques is
helpful but not required.

We will use SBT and LMS. Installation instructions can be found here:
https://github.com/scala-lms/tutorials/blob/master/README.md#dependencies
Participants are not required to install anything before the tutorial,
but are invited to follow along on their laptops.
</div>
</div>

## Tiark Rompf
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/tiark-rompf.jpg" alt="Tiark Rompf"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
This tutorial will be given jointly by Tiark Rompf and Nada Amin.

Tiark Rompf is a researcher at Oracle Labs. His work focuses on
runtime code generation, advanced compiler technology, and associated
language support. From 2008 to 2014 he was a member of Martin
Odersky's Scala team at EPFL where he developed the LMS compiler
framework and made various contributions to the Scala language and
toolchain (delimited continuations, efficient immutable data
structures, compiler speedups, type system work).
</div>

</div>

## Nada Amin
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/nada-amin.jpg" alt="Nada Amin"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Nada is a member of the Scala team at EPFL,
where she studies type systems and hacks on programming languages.
She has contributed to Clojure's core.logic and Google's Closure compiler.
She's loved helping others learn to program ever since tutoring SICP
as an undergraduate lab assistant at MIT.
</div>

</div>
