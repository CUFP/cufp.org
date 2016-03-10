- type: talk
- title: Facebook: Analyzing PHP statically
- speakers: Julien Verlaguet
- affiliations: Facebook
- video: http://www.youtube.com/watch?v=gKWNjFagR9k
- slides: /2013/slides/verlaguet.pdf


## Abstract

Facebook has a very large PHP code base. At this scale, a dynamic
language leads to a challenging situation in terms of tooling.  The
lack of static knowledge can make simple tasks very time
consuming. Something as simple as renaming a method can cause
unexpected problems because not all the code paths were captured
through testing.  In the past few years, Facebook spent time working
on pragmatic approaches to improve the tooling around PHP.  More
recently, we started applying static-analysis and type-inference
techniques to PHP.  In this talk I will present how we applied these
techniques to PHP and how we scaled them for Facebook.  Since most of
the tools were written in OCaml, they constitute a good example of an
industrial scale application using a functional programming language.

## Julien Verlaguet
is a member of the HipHop team. HipHop is a JIT compiler for PHP used
at Facebook. Most of my work is focused on static analysis (front-ent
work).
