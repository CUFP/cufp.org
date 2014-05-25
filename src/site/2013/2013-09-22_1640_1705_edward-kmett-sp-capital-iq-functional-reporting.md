- type: talk
- title: Functional Reporting
- speakers: Edward Kmett
- affiliations: S&P Capital IQ
- video: http://www.youtube.com/watch?v=o3m2NkusI9k
- slides: /2013/slides/kmett.pdf


## Abstract
We have been using functional programming here at S&P Capital IQ
in Scala, Haskell, and our homegrown reporting language Ermine, since
2008\.  We'll spotlight two of the projects we've worked on in the
past five years and cover the challenges that drove us to write our
own programming language.  The first project we'll cover is our
portfolio analytics \(PA\) engine, used on capitaliq.com for
performance and risk attribution and in ClariFI, a quant-focused
desktop product. The engine evaluates jobs consisting of batches of PA
calculations, which we represent monoidally and optimize to process in
a streaming fashion using a minimal number of passes over input data.
The second is how we've used Scala and Haskell in a multi-year project
to build a general purpose reporting and visualization framework for
constructing useful views and reports from CapitalIQ datasets. That
framework consists of several components, the most novel of which is a
Haskell-like programming language with row types, called Ermine,
designed for working with and manipulating relational data. Upon
Ermine we have layered a combinator library for building interactive
reports and visualizations from these data. These reports are abstract
descriptions of layout, with pointers to the data, and we've written
several interpreters for this DSL to export to a variety of formats: a
report can be rendered as an interactive HTML+JS page, a Java FX UI,
or exported to PDF or Excel from a simple declarative specification.
Along the way we've had to face many challenges including
interoperating with the web and the JVM, getting monadic code in scala
to scale, fostering adoption in a predominantly imperative workplace,
and selling management on a custom programming language.

## Edward Kmett
discovered Haskell in 2006 after many years of writing compilers for
toy imperative languages that somehow all looked like a mishmash of
Perl, Python and C++. Upon realizing the error of his ways and after
briefly flirting with dependent and substructural type systems he
switched to Haskell and ever since has sought to make up for his past
crimes by giving back to the community. He currently maintains more
Haskell packages than anyone, sits on the haskell.org committee,
chairs the Haskell core libraries committee, organizes Boston Haskell,
has managed the Google Summer of Code for the Haskell community for
the last 4 years and doesn't get to sleep much.
