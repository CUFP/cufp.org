- type: tutorial
- title: T1: Haskell (Day 1)
- speakers: Andres Löh
- affiliations: Well-Typed LLP


## Abstract
Pure functional programming is about programming with expressions
rather than actions, data rather than control. Many programs are more
naturally expressed in this way, and functional programs are often an
order of magnitude shorter than equivalent imperative programs \- just
as programs in traditional high-level languages like C and Java are
typically much shorter and clearer than their equivalents in assembly
language.  Many exciting ideas in mainstream programming arose first
in FP, including garbage collection, generics, closures, and list
comprehensions. FP is a fertile laboratory for language innovation,
and familiarity with FP is good preparation for future developments in
programming. In particular, multicore chips and cloud computing
architectures are forcing us all into dealing with concurrency, and
there is good evidence that the breakthroughs here will come from FP,
with its emphasis on immutability and independence of evaluation
order.

## Important Note
This is a two-day tutorial. When you register for this tutorial, you
register for both days. You are welcome to look around other events on
these days, but you will have to skip part of the tutorial to do so.

This two-day tutorial introduces the essentials of Haskell, a pure
lazy functional language with a mature compiler, a wealth of
libraries, and an active community. We will focus particularly on
concurrent programming \- handling multiple interactions at the same
time \- which is increasingly important in a wide range of
applications today, from GUI programming to server-side web
development. There will be a balance between lectures and exercises,
so that you will be exposed to both the theory and the practice of FP.
Day 1 will focus on the basics of FP with Haskell, introducing the
concepts necessary to get you writing simple programs, including an
introduction to monads. On Day 2 you will get a little taste of the
joys of concurrent programming in Haskell. By the end, you will be
writing some simple \(but real!\) Concurrent Haskell programs. We will
also cover some of the practical aspects of day-to-day programming in
Haskell, such as working with third-party libraries.

## Preparations
You don't need to install or setup Haskell on your machine to follow
the CUFP Haskell Tutorials. Instead, you can use the just released FP
Haskell Center by FP Complete. To do so, go to [this
page](https://www.fpcomplete.com/) and click the "Free Trial" link to
sign up for a time-limited trial account that provides you with full
access to the system. Once you've done that, you have a Haskell IDE
and compiler that you can use from within your browser. You will be
able to use the Haskell packages needed during the course without
further setup, and we will provide you with access to the course
materials at the beginning of the CUFP tutorials.

Note that university students, faculty and staff can also sign up for
a 1-year academic license via [this
page](https://www.fpcomplete.com/business/fp-haskell-center/academic-account-request).

If you prefer to install and use Haskell on your own machine, this is
of course possible. In this case, you should install the latest
Haskell Platform \(2013.2.0.0, based on GHC 7.6.3\). Go to [this
page](http://www.haskell.org/platform/) and follow the instructions
for your platform. In addition, you should have a good
programmer-friendly text editor of your choice installed. You'll need
some additional Haskell libraries, but they can easily be installed
on-the-fly during the course.

## Andres Löh
<img align="right" src="http://www.cs.kent.ac.uk/people/staff/sjt/Misc/andres.jpg" alt="Andres Löh" width="200"></img>
Andres Löh is a Partner at Well-Typed LLP, a consulting company
specialized on Haskell. He has been using Haskell in both academia and
industry for more than 15 years. His main interests are making use of
the strength of Haskell's type system, improving code reuse by
datatype-generic programming, designing embedded domain-specific
languages, exploiting potential for parallelism, and applying
functional programming techniques to real-life problems. He has
created and contributed to various Haskell libraries and tools that
are available on Hackage. Andres is the main author of Well-Typed's
introductory and advanced Haskell courses, and is teaching Haskell to
commercial clients on a regular basis.
