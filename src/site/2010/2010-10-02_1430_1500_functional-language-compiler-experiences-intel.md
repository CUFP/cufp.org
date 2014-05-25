- type: talk
- title: Functional Language Compiler Experiences at Intel
- speakers: Leaf Petersen, Neal Glew
- affiliations: Intel, Intel
- video: http://vimeo.com/16754099

## Abstract
For five years Intel's Programming Systems Lab \(PSL\) has been
collaborating with an external partner on a new functional programming
language designed for productivity on many-core processors.  While the
language is not yet public, this talk outlines motivations behind the
language and describes our experiences in implementing it using a
variety of functional languages.  The reference interpreter is written
in Haskell and compiled with GHC while PSL's performance
implementation is written in SML and compiled with Mlton.  We have
also generated Scheme code compiled with PLT Scheme as part of a
prototyping effort.

At several points, the project has had several contributors that did
not have a background in functional languages working on the compiler
and on writing benchmarks.  We describe their experiences working in
SML and with functional languages in general.  Specifically:

- what they liked and disliked about using functional languages
- what was easy and hard about learning and using functional languages
- what worked/didn't work for helping them learn to program in functional languages
- which functional features they used and didn't use
- general observations about the code that they wrote
- what \(if anything\) they took away from the experience

A design principle of the implementation effort was to by default
avoid the use of imperative features.  Previous experience and review
of the literature suggested that many parts of a compiler could be
written as well or better using primarily functional code, but that
restricting ourselves entirely to the functional fragment of SML was
probably not reasonable.  We describe our experiences with this, and
the tradeoffs that we encountered.  Specifically:

- During the project we experimented with both immutable and mutable
 intermediate representations \(IRs\).  We describe and motivate
 some of the scenarios where we used one or the other, explain our
 experiences with this, and describe cases where we feel that we made
 an inappropriate initial choice.
- We chose to avoid all global mutable state in the compiler.  Most
 notably, symbol tables and global configuration information are
 always passed explicitly as parameters to parts of the compiler that
 require them.  This choice had benefits and costs, and we discuss
 our experience with this.

We also describe some of the features of SML that we found useful, and
discuss some of the lack of features and quirks of SML that annoyed
us.  Specifically:

- We discuss places where we encountered limitations in the
 module system.  These include the lack of uniformity between the
 signature and structure language, and the lack of recursive modules.
- We describe some of the ways in which we believe that better
 syntactic support could have lessened the programming burden,
 especially with respect to attempting to be purely functional.
 Examples of this include a type class mechanism and/or monadic
 syntax to lessen the burden of passing around explicit state, better
 syntactic support for using the imperative features of the language,
 and better support for custom control operators.
