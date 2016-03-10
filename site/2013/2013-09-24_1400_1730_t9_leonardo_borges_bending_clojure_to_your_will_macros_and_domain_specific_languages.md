- type: tutorial
- title: T9: Bending Clojure to your will: Macros and Domain Specific Languages
- speakers: Leonardo Borges


## Abstract
Programmers, functional or not, oftentimes struggle to understand the
ways of Lisp macros: when to use them, what to use them for and, more
importantly, when not to use them.  Macros are programs that write
programs \- and that can be daunting at first. But it doesn't have to
be!  Through a series of real-world examples from the Clojure world
you'll learn how to write your own macros and use them to make your
programs more expressive and elegant by building powerful
abstractions.  Do more with less.

Previously given at
[LambdaJam](http://www.yowconference.com.au/lambdajam/).


## Rough Outline:
+   Macros and why you should care
Brief example of the power of macros vs. when not to use them leading into the next topics.

+   Compile-time vs. Runtime
It's important to understand the different "times" in which Clojure code is executed. Know what "macro-expansion" time means.

+   Syntax
Everything about macros syntax in clojure: quoting, unquoting, unquote-splice, macro hygiene. We'll write a few basic macros here.

+   Code walkthrough
We'll run through several macro examples both from Clojure core and a couple I've used in my own code in order to show the usefulness of macros in production code. This will allow plenty of time for discussions.

+   Writing your own macros
Get your hands dirty writing a few more involved macros. I'll come with suggestions but attendees are welcome to use their own ideas. Plenty of time for discussions.

+   Wrap up
Q&amp;A and anything else attendees might be willing to discuss.


## Intended Audience
Functional programmers familiar with any Lisp dialect \- though basic knowledge of Clojure would be helpful. 

No knowledge of macros is required.

## Infrastructure required:
All you need is to make sure that you have these installed:

+     JDK 6+

+     [Leiningen](http://leiningen.org/) 2.x

+     [Clojure](http://clojure.org/) 1.5+

+     A text editor/IDE of your choosing. Popular choices include: Emacs, Vim, IntelliJ with the [LaClojure](http://plugins.jetbrains.com/plugin/4050) plugin and Eclipse with the [CounterclockWise](http://code.google.com/p/counterclockwise/) plugin


## Leonardo Borges
<img align="right" src="https://confuiimagesproduction.s3.amazonaws.com/uploads/speaker/photo/5168110636c61b2a80000005/0e06f854-e3cd-4ab6-ad58-471eed1d1a57.png" alt="Leonardo Borges" width="200"></img>
A programming languages enthusiast, Leonardo loves writing code,
contributing to open-source and speaking about subjects he feels
strongly about. Currently undertaking the challenges of consulting at
ThoughtWorks, his first contact with Functional Programming came from
using Scheme while reading SICP. Not too long after he fell in love
with Clojure and has since sneaked it into his latest client project,
which became ThoughtWorks' first Clojure engagement to go live in
Australia. He created and runs clj-syd, the Clojure Sydney User Group,
where local Clojurians gather monthly for talks and hack nights. He
also blogs about other geeky stuff, plays the guitar and does stupid
things like skydiving, rafting or rock climbing whenever he
can. [http://www.leonardoborges.com/](http://www.leonardoborges.com/)
twitter: [@leonardo_borges](https://twitter.com/leonardo_borges)
