- type: talk
- title: ACL2: Eating One's Own Dogfood
- speakers: Warren Hunt
- affiliations: U. of Texas


## Abstract
We are using the ACL2 theorem-proving system for formally verifying
properties of the X86-compatible, 64-bit VIA Nano microprocessor.  To
validate Nano circuit models, we translate its Verilog into our
formally defined HDL.  We write specifications in the ACL2 logic, and
mechanically verify HDL descriptions using the ACL2 theorem prover to
orchestrate the use of BDDs, AIGs, SAT, symbolic simulations
techniques, and the theorem prover itself.  Our system has been
integrated into the Centaur design toolflow; this includes rapid and
regular translation of the Nano design into our framework and daily
regression runs.

Our tools are written in ACL2, which is itself a functional language.
For instance, our BDD package is written in ACL2 and has been proven
correct using the ACL2 theorem prover \-- likewise so is our AIG
package and many other tools.  Our symbolic simulation system for the
entire ACL2 logic is also written in ACL2, and it has been verified by
the ACL2 theorem prover.  In fact, the entire ACL2 system is written
in the ACL2 language.  ACL2 is in commercial use by a number of
companies, including AMD, Centaur, IBM, and Microsoft.

We believe the FP community should consider the same operational
paradigm.  In fact, we challenge the FP community to write analysis
tools for their functional programs in their own programing languages.
This kind of "eating one's own dog food" tends to make one's system
better.  Our combined ACL2/CAD system may be the world's largest
functional program as the source code exceeds five megabytes.  Without
our associated mechanical verification system, we couldn't begin to
manage the complexity we have created.  We have wondered if we could
apply our tools to other functional languages.
