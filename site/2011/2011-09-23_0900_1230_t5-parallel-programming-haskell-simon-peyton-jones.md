- type: tutorial
- title: T5: Parallel Programming in Haskell
- speakers: Simon Peyton Jones, Simon Marlow, Manuel Chakravarty
- affiliations: Microsoft, Microsoft, University of New South Wales


## Abstract
In principle Haskell is a great language for parallel programming \(few
side effects, implicit parallelism, yada yada\), but how does this work
out in practice?  This tutorial will put you in a position where you
can try it for yourself.  There will be three parts \(about an hour
each\):

- What's hot in parallel Haskell: a whirlwind tour of what is going on
 \(Simon Peyton Jones\)
- Programming in the Par monad and ThreadScope \(Simon Marlow\)
- Data Parallel Haskell \(Manuel Chakravarty\)

We will mostly concentrate on *parallel* programming \(where the goal
is to improve performance\) rather than *concurrent* programming \(where
the goal is modular program design\).

Take home: A good understanding of the basics of two
parallel-programming paradigms in Haskell.

## Audience
Generally we will assume that you are reasonably proficient in
Haskell.  However, while non-Haskellers may not get all the details,
you should still have a good time.  The "whirlwind tour" part in
particular requires minimal Haskell expertise.

## Preparation
### Debian or Ubuntu Linux
From the command line:

<code>apt-get install Haskell-platform
apt-get install threadscope
cabal install monad-par</code>

This gets you GHC 6.12.3 at the moment, which is enough to run the examples and do the exercises in the tutorial.

Alternatively, you can get a more up to date Haskell Platform 
[here](http://hackage.haskell.org/platform/)
and installing it yourself.

You may also want to get the newer version of ThreadScope \(0.2\).  For instructions go to 
[this page](http://www.haskell.org/haskellwiki/ThreadScope).

### Windows
Install the [Haskell Platform](http://www.haskell.org/platform/).

Install the `monad-par` package \(using the command line\):

<code>cabal install monad-par</code>

Also, an installation of [ThreadScope](http://haskell.org/haskellwiki/ThreadScope) is optional but recommended.

### Mac
Install the [Haskell Platform](http://hackage.haskell.org/platform/).

Install the `monad-par` package \(using the command line\):

<code>cabal install monad-par</code>

ThreadScope is optional but recommended, although it depends on the GTK library which is reportedly hard to install on Mac OS X.  Apparently installing it via HomeBrew is the method most likely to work.  Some tips on installing ThreadScope are on the [ThreadScope page](http://haskell.org/haskellwiki/ThreadScope).

## Simon Peyton Jones
is a Principal Researcher at Microsoft's research lab in Cambridge
England. He became addicted to functional programming in 1979, and has
been working on the design and implementation of functional languages
ever since.  He is one of the original designers of Haskell and with
Simon Marlow is responsible for the Glasgow Haskell Compiler \(GHC\).

## Simon Marlow
is a Senior Research Software Engineer at Microsoft's Cambridge
research lab.  He has been working on Haskell-related research
projects since the 90's, and together with Simon Peyton Jones is
responsible for the Glasgow Haskell Compiler \(GHC\).  Simon in
particular developed GHC's multicore runtime system, and over the past
few years has been working to improve GHC's support for parallel and
concurrent programming, both at the runtime and the language level.

## Manuel Chakravarty
is an Associate Professor at the University of New South Wales,
Sydney.  His main research interests are in functional and parallel
programming.  He contributed to Haskell's foreign function interface,
the theory and implementation of type families, and the design and
realisation of Data Parallel Haskell, an implementation of nested data
parallelism in the Glasgow Haskell Compiler.
