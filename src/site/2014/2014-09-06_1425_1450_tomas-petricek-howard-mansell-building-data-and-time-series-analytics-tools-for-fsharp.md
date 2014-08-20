- type: talk
- title: Building data and time-series analytics tools for F#
- speakers: Tomas Petricek, Howard Mansell
- session: Data and knowledge

## Abstract 

This presentation is based on our experience with building and using
data and time-series analytics tools for F#. We look at two projects
that have been developed by BlueMountain Capital: the R type provider
allows analysts to access R packages and functions directly from the
F# environment while Deedle is a time-series and data manipulation
library implementing operations such as data alignment, joining and
handling of missing values. In the talk, we would like to discuss two
interesting questions that arise from the projects.

Firstly, the R type provider discovers R packages and functions and
makes them accessible via the F# type system. This raises interesting
questions about the interoperability between statically-typed and
dynamically-typed languages. How much information can we obtain from
dynamic runtime like R? And what features did we propose for F# to
make the interoperability between static and dynamic languages easier?

Secondly, the Deedle library raises similar interoperability
questions, but at the boundary between functional-first F# and
object-oriented C#. Our design goal has been to make the library
usable from both languages - what is the right balance between
object-oriented and functional API design? We'll also discuss finding
the right balance between immutable and mutable data structures in
this project.

{{ input src/site/2014/_register_button.html }}
