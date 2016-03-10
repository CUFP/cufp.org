- type: tutorial
- title: T4: Systematic generation of optimal code with MetaOCaml
- speakers: Oleg Kiselyov
- links: http://okmij.org/ftp/


## Abstract
A common application of generative programming is building
high-performance computational kernels highly tuned to the problem at
hand. A typical simple linear algebra kernel is specialized to data
representation, loop unrolling factors, and the a priori knowledge
\(e.g., if a matrix is symmetric, almost tridiagonal, etc\). It is
tedious and error prone to specialize by hand, writing numerous
variations of the same algorithm. A typed staged programming language
such as MetaOCaml lets us state a general, obviously correct algorithm
and add layers of specializations in a modular way. By ensuring that
the generated code always compiles and letting us quickly run it,
MetaOCaml makes writing generators less daunting and more productive.
The tutorial will answer a simple Shonan Challenge.

## Goals
By the end of the tutorial, the participants will:

- implement a simple linear algebra DSL in MetaOCaml with
 layers of optimizations, specializing to memory layout of
 matrices and vectors and to their algebraic properties.
- generate a couple of simple and optimal BLAS

and learn how to

- write typed code generators; 
- write modular generators;
- locally optimize code.

## Intended audience
No prior knowledge of MetaOCaml is assumed. It is expected that
participants are familiar with a modern functional language, in
particular OCaml, F#, SML. The tutorial should also be comprehensible
to Haskell programmers.

## Preparation
The MetaOCaml tutorial is intended to be interactive, with exercises
and small projects to be done in class. Therefore, it will benefit the
participants to have MetaOCaml on their laptops.

Although any version of MetaOCaml \(including the legacy one\) should
be sufficient, the latest version, BER MetaOCaml N100 \(which is based
on OCaml 4.00.1\) is preferred. Code generators could then take
advantage of all features of OCaml 4.00.1.

The best way to install BER MetaOCaml N100 is through [OPAM, OCaml
package manager](http://opam.ocamlpro.com/):

The above web site explains how to install and use OPAM. A number of
binary OPAM installation options are available. One can install OPAM
without the prior installation of OCaml \(OPAM will bring its own
OCaml then\). After OPAM is installed, BER MetaOCaml can be installed
by the command

```
   opam switch 4.00.1+BER
```

The `opam switch` command is explained in the [Advanced manual](http://opam.ocaml.org/doc/Advanced_Usage.html)
Don't forget to execute the command to update the environment,
which `opam switch` tells you to do at the end.

BER MetaOCaml can also be installed from source as described

```
[here](http://okmij.org/ftp/ML/MetaOCaml.html#install).
```

You will need OCaml 4.00.1 distribution \(as a .tar archive or
as as a git clone\)

For the tutorial, byte-code top-level MetaOCaml \(`metaocaml`\) will be
sufficient.

## Oleg Kiselyov
Oleg Kiselyov is a Computer Scientist in Monterey, CA. His web site is
[http://okmij.org/ftp/](http://okmij.org/ftp/).
