- type: tutorial
- title: Introductory Haskell / Concurrent Haskell - Day 2
- speakers: Jeremy Gibbons, Simon Marlow
- affiliations: University of Oxford, Microsoft Research


## Abstract
Pure functional programming is about programming with expressions
rather than actions, data rather than control. Many programs are more
naturally expressed in this way, and functional programs are often an
order of magnitude shorter than equivalent imperative programs \- just
as programs in traditional high-level languages like C and Java are
typically much shorter and clearer than their equivalents in assembly
language.

Many exciting ideas in mainstream programming arose first in FP,
including garbage collection, generics, closures, and list
comprehensions. FP is a fertile laboratory for language innovation,
and familiarity with FP is good preparation for future developments in
programming.  In particular, multicore chips and cloud computing
architectures are forcing us all into dealing with concurrency, and
there is good evidence that the breakthroughs here will come from FP,
with its emphasis on immutability and independence of evaluation
order.

## Important Note
This is a *two-day* tutorial. When you register for this tutorial, you register for both days.
You are welcome to look around other events on these days, but you will have to skip
part of the tutorial to do so.

## Content
This two-day tutorial introduces the essentials of Haskell, a pure
lazy functional language with a mature compiler, a wealth of
libraries, and an active community.  We will focus particularly on
concurrent programming \- handling multiple interactions at the same
time \- which is increasingly important in a wide range of applications
today, from GUI programming to server-side web development.  There
will be a balance between lectures and exercises, so that you will be
exposed to both the theory and the practice of FP.

Day 1 will focus on the basics of FP with Haskell, introducing the
concepts necessary to get you writing simple programs, including an
introduction to monads.  On Day 2 you will get a little taste of the
joys of concurrent programming in Haskell.  By the end, you will be
writing some simple \(but real!\) Concurrent Haskell programs.  We will
also cover some of the practical aspects of day-to-day programming in
Haskell, such as working with third-party libraries.

## Jeremy Gibbons
<img align="right" src="/sites/all/files/speaker-portraits/jeremy-gibbons-portrait.jpg" alt="Jeremy Gibbons"></img>

Jeremy Gibbons is Professor of Computing at the University of Oxford,
and has been a FP enthusiast for twenty five years. For the last
thirteen of those, all his teaching has been to professional software
engineers on the part-time [masters' programme at
Oxford](www.softeng.ox.ac.uk), of which he is currently
Director. Among other roles, he is also an Editor of the Journal of
Functional Programming, with special responsibility for the Functional
Pearls column; Chair of IFIP WG2.1 on Algorithmic Languages and
Calculi; and Vice-Chair of ACM SIGPLAN.

## Simon Marlow
<img align="right" src="/sites/all/files/speaker-portraits/simon-marlow-portrait.jpg" alt="Simon Marlow"></img>

Simon Marlow is a developer at Microsoft Research in Cambridge.  He
has been one of the two lead developers of the Glasgow Haskell
Compiler over most of its lifetime.  Simon is responsible in
particular for GHC's highly-regarded multicore runtime system.  When
he is not developing GHC, Simon also contributes to the functional
programming languages research community, and has a string of papers
on subjects ranging from garbage collection to language design.  In
recent years Simon's focus has been on making Haskell an ideal
programming language for parallel and concurrent applications, both
by developing new programming models and building a high-quality
implementation.

## Preparation
Please bring a laptop to the tutorial. Ideally, you should install the required software on your laptop *before the tutorial*. If that fails, we'll have a machine on-site for you to connect to.  In that case, make sure to have an [RDP](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol) client \(a client for Microsoft's Remote Desktop protocol\) installed on your laptop, so you can connect to our on-site machine.

If you have problems or questions, please contact Mike Sperber \(sperber\(at\)deinprogramm\(dot\)de\).

### Installing the prerequisite software
+     First, download and install the [Haskell Platform](http://hackage.haskell.org/platform/).

+     Run the following commands:


<pre>
cabal update
cabal install HTML xml
</pre>

