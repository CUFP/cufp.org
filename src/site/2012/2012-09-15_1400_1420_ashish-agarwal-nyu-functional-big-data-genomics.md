- type: talk
- title: Functional Big-Data Genomics
- speakers: Ashish Agarwal
- affiliations: New York University
- links: http://ashishagarwal.org
- video: http://www.youtube.com/v/02YykaSMP0I


## Abstract
High-throughput genomic sequencing is characterized by large diverse
datasets and numerous analysis methods. It is normal for an individual
bioinformatician to work with thousands of data files and employ
hundreds of distinct computations during the course of a single
project. This problem is magnified in "core facilities", which support
multiple researchers working on diverse projects. Most investigators
use ad hoc methods to manage this complexity with dire consequences:
analyses frequently fail to meet the scientific mandate of
reproducibility; improved analysis methods are often not considered
because recomputing all downstream steps would be overwhelming; hard
drives and CPUs are used sub-optimally; and, in some cases, raw data
is lost.

We describe HITSCORE, an OCaml software stack that operates all
computational aspects of the Genomics Core Facility at New York
University's Center for Genomics and Systems Biology. HITSCORE has
been in production use for one year, and was implemented quickly by
less than two programmers following design advice from several
biologists. A simple domain specific language \(DSL\) enables generating
type safe database bindings and GUI components, and greatly eases
updates and migration of our data model. We found a multi-lingual
stack too burdensome in a small team setting, and credit OCaml for
fulfilling the needs of our full application stack. It has good
database bindings, excels at encoding complex domain logic, and now
allows construction of rich websites due to the Ocsigen web
programming framework. Higher level libraries for distributed
computing would be a welcome improvement.

The opportunity to build this system did not stem directly from any
strength of functional programming or OCaml. It was necessary for a
person with credibility amongst biologists to champion its
development, and this credibility took several years to build. Rapid
development appears to be the single most important factor in allaying
doubts about using a lesser known language, and we will briefly
describe our experiences in bringing OCaml to several high profile
projects.

## Ashish Agarwal
Ashish Agarwal received his PhD in the area of programming languages from
Carnegie Mellon University. Since then, he has embedded himself amongst
biologists, first at Yale and now at New York University, to learn
intimately what their pain points are. He currently manages the
computational core facility at New York University and runs multiple
big-data genomics projects on an OCaml code base.

## Authors
Ashish Agarwal [1,2], Sebastien Mondet [1], Paul Scheid [1], Aviv Madar [1], Richard Bonneau [1,2], Jane Carlton [1], Kristin C. Gunsalus [1]

1. Center for Genomics and Systems Biology, Department of Biology, New York University
2. Courant Institute of Mathematical Sciences, New York University
