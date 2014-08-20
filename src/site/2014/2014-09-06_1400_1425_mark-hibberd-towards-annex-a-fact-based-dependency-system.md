- type: talk
- title: Towards "annex", a Fact Based Dependency System
- speakers: Mark Hibberd
- session: Data and knowledge

## Abstract 

Knowledge is not static. Yet when dealing with program artifacts, we
choose to seal off what we _know_ at the point in time when we know
the _least_. This is wrong.

Context is important. Yet when defining dependencies on artifacts,
instead of directly specify the query we want (and hence embedding its
context), we manually translate our request into antiquated notions of
meta-data, encoded as a number, embedded in a string. Yes, semantic
versioning is wrong.

Reproducibility is essential. Yet most existing dependency systems
force a trade off of rigour and reproducibility against flexibility
and ease of use. This is not necessary.

Drawing on well understood foundations from datalog and deductive
databases, and utilizing functional programming fundamentals,
"annex" takes a different view on how to manage artifacts. We should
be able to ask: "Give me the latest binary compatible versions of X
with no known CVE"; or, "Give me the last stable builds of my
dependencies that have been tested in IE 9, Chrome and Firefox"; or
in a more general context outside of dependency resolution, queries
such as "What platforms has build x of my library been tested on?"
provide a useful understanding of the current state of artifacts; and
finally, it should be possible to phrase all of these questions with a
first class notion of time, for example "Give me the same
dependencies when I last asked this query".

This talk will start by walking through the concepts behind "annex",
before taking a deeper look at the design and implementation (in
Haskell). We will look at how its functional underpinnings give rise
to very desirable properties for a cross-language dependency system.
These properties include: trivial distribution and caching; guaranteed
reproducibility with minimal context; predictable performance; and
interestingly, how steadfastly holding to functional programming
principles contributes to being able to deliver a humane user
experience in the face of complexity.

{{ input src/site/2014/_register_button.html }}
