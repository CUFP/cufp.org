- type: talk
- title: Using F# to Prove Stabilization of Biological Networks
- speakers: Samin Ishtiaq
- affiliations: Microsoft
- video: https://www.youtube.com/watch?v=wOldpHtwjyY

## Abstract
[BMA](http://biomodelanalyzer.research.microsoft.com) is a tool for
modeling and analyzing Systems Biology models, such as cellular-level
descriptions of skin and blood.

One important property that these biological artifacts have is
*homeostasis* or stability. Stability in skin, for instance, means
that the epidermis is dividing at the same rate that the surface is
losing cells; instability, in contrast, means either cancer or surface
sores.

A tool that verifies stability is, we hope, part of a development to
target drugs better, by identifying the cellular components that 
enable stability. The whole endeavor can be seen as an EDA for biology.

In this talk, I will describe the F# implementation of the
stabilization prover of BMA.

The prover checks that, regardless of the initial values the model's
variables, there is one stability point that the model always reaches
and then remains in. The complexity of this analysis stems from the
high number of possible states of such a system. Yet the BMA prover
scales by composing a lot of local, small proofs together. The
prover's underlying procedure is based on mathematical techniques for
the specification and verification of properties in concurrent
systems.

Though this domain \(automatically proving properties of systems\) is
one that is known to be amenable to functional programming techniques,
the BMA implementation exploits several F# features. Almost all the
data structures are immutable collections like Set and Map. The main
fixed-point loop is implemented using the Seq lazy sequences library:
transforming the loop from a recursive function to a Seq.fold was
quick, yielding code that is elegantly asynchronous, and allows the
C#-based UI to pause, step, and fast-forward the proof search.

The analyzer also uses FParsec \(a parser combinator library\) to parse
the definition of the model's update functions, and Z3 \(an SMT solver\)
to generate counter-examples to stability.

I am normally an Emacs/OCaml functional programmer. I'll also compare
my development experience of Visual Studio/F#.

## Samin Ishtiaq
Samin Ishtiaq is Principal RSDE in the Programming Principles and
Tools group at Microsoft Research Cambridge.  He builds formal
verification and testing tools as part of the SLAyer \(Separation
Logic-based memory safety for C programs\), TERMINATOR \(program
termination\) and BMA \(analysis of gene regulatory networks\) projects.
He was previously Principal CPU Verification Engineer at ARM.
