- type: tutorial
- title: T3: Concurrent Programming with Effect Handlers
- speakers: Daniel Hillerström and KC Sivaramakrishnan

## Abstract
Algebraic effect handlers are a new control operator that generalize common control-flow abstractions such as exceptions, generators, or concurrency, as well as other seemingly esoteric programming abstractions such as transactional memory and probabilistic computations. The idea of algebraic effects and handlers has been experimented with in the form of libraries in several mainstream languages, including OCaml, Haskell, Standard ML, Clojure, and Scala. Multicore OCaml is an extension of OCaml with effect handlers as a primary means of expressing concurrency. Effect handlers are used to implement thread schedulers as user-level libraries, enabling programmers to specialize their concurrency and parallelization strategies.

We propose a tutorial on practical concurrent and parallel programming using effect handlers in Multicore OCaml. We aim to introduce algebraic effects handlers in Multicore OCaml with toy examples. We will then illustrate through several hands-on exercises, how exceptions, cooperative concurrency, generators, async/await mechanisms can be implemented using effect handlers.

The tutorial is targeted at functional programmers who are beginners in concurrent programming.

## Tutorial objectives
* Observe the common control-flow abstraction that connects exceptions,
generators, async/await, concurrency, non-determinism, etc.
* Write concurrent programs in Multicore OCaml.
* Debug concurrent programs with GDB.
* Roll out your own concurrency abstractions.

## Target audience
The tutorial is targeted at functional programmers (preferably OCaml)
who are beginners in concurrent programming.

## Infrastructure required
The tutorial participants should have a local installation of the
Multicore OCaml compiler. The compiler can be obtained through OPAM:

$ opam remote add multicore https://github.com/ocamllabs/multicore-opam.git  
$ opam switch 4.02.2+multicore

<div class="content" media:type="text/omd">
### Daniel Hillerström
[Daniel Hillerström](http://homepages.inf.ed.ac.uk/s1467124) is an occasional Multicore OCaml compiler hacker and a PhD student in the Centre for Doctoral Training in Pervasive Parallelism at the University of Edinburgh under the supervision of Sam Lindley. His research interests revolve around the design, implementation, and application spaces of effect handlers.
</div>

<div class="content" media:type="text/omd">
### KC Sivaramakrishnan
[KC Sivaramakrishnan](http://kcsrk.info) is a Research Fellow at University of Cambridge Computer Laboratory. He is
interested in applying programming languages and program verification techniques to parallel and distributed
computing. He is one of the core developers of Multicore OCaml project.
</div>
