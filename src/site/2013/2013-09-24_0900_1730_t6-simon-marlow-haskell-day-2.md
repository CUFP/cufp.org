- type: tutorial
- title: T6: Haskell (Day 2)
- speakers: Simon Marlow


## Abstract
Pure functional programming is about programming with expressions
rather than actions, data rather than control. Many programs are more
naturally expressed in this way, and functional programs are often an
order of magnitude shorter than equivalent imperative programs - just
as programs in traditional high-level languages like C and Java are
typically much shorter and clearer than their equivalents in assembly
language. Many exciting ideas in mainstream programming arose first in
FP, including garbage collection, generics, closures, and list
comprehensions. FP is a fertile laboratory for language innovation,
and familiarity with FP is good preparation for future developments in
programming. In particular, multicore chips and cloud computing
architectures are forcing us all into dealing with concurrency, and
there is good evidence that the breakthroughs here will come from FP,
with its emphasis on immutability and independence of evaluation
order.

On Day 2 you will get a little taste of the joys of concurrent
programming in Haskell. By the end, you will be writing some simple
(but real!) Concurrent Haskell programs. We will also cover some of
the practical aspects of day-to-day programming in Haskell, such as
working with third-party libraries.

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

## Simon Marlow
<img align="right" src="img/simon-marlow-portrait.jpg" alt="Simon Marlow"></img>
Simon Marlow is a developer at Facebook. He has been one of the two
lead developers of the Glasgow Haskell Compiler over most of its
lifetime. Simon was responsible in particular for GHC's
highly-regarded multi-core runtime system. He contributes to the
functional programming languages research community, and has a string
of papers on subjects ranging from garbage collection to language
design. In recent years Simon's focus has been on making Haskell an
ideal programming language for parallel and concurrent applications,
both by developing new programming models and building a high-quality
implementation. In 2012, he moved from Microsoft Research in Cambridge
to Facebook. He is also the author of the upcoming book Parallel and
Concurrent Programming in Haskell, published by O’Reilly Media.
