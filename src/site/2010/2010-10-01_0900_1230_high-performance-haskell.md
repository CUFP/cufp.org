- type: tutorial
- title: High-Performance Haskell
- speakers: Johan Tibell
- affiliations: Google


## Abstract
Haskell makes it possible to write elegant, high-level code that
rivals the performance of low-level, imperative languages. In this
tutorial, I will introduce the tools Haskell provides for reasoning
about the performance of your code and techniques that you can use to
make your code faster. I will cover important topics in Haskell
performance optimization, including:

- accurate benchmarking,
- CPU and memory profiling,
- laziness and strictness,
- making sense of compiler output,
- performance idioms, and
- data types and their impact on performance.

By the end of the tutorial you should have an understanding of how to
accurately measure the performance of your Haskell program, determine
which parts of the program needs improvement, and finally, improve the
performance of the program.

## Audience
Experienced programmers familiar with functional
programming. Familiarity with Haskell will be useful, but not
required.

## Software prerequisites
Haskell Platform 2010.1.0.0 \(or later\) and the Criterion benchmarking
library. The latter can be installed by running 

`cabal install -f-Chart criterion`

after installing the Haskell Platform.

The Haskell Platform can be downloaded for Mac, Windows, and Linux from:

[`http://www.haskell.org/platform/`](http://www.haskell.org/platform/)

## Johan Tibell
is a Software Engineer at Google Inc. His main
interests are in distributed systems and functional programming. He
received a M.S. in Software Engineering from the Chalmers University
of Technology, Sweden, in 2007.
