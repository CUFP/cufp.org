- type: talk
- title: From Streams to Functions \(and Back Again\)
- speakers: Frank McCabe
- affiliations: Starview
- video: https://www.youtube.com/watch?v=lBj62fNNYu8

## Abstract
Starview's origins were in systems monitoring; especially of computer
controlled equipment in semi-conductor fabs. A typical factory has
several thousand machines all of which require monitoring for their
health.  In order to facilitate the collection of data, Starview
developed a rule language to help with filtering and validating the
multiple streams.

At this point a few critical choices were made that were to have a
deep impact on the future evolution of the language. We decided to
make it strongly, statically typed and we decided to allow programmers
to define new functions as well as rules on streams. Both of these
choices were strongly influenced by the expected environment of
deployed applications \(large expensive factories that cannot afford
to stop because of avoidable software errors\).

Over time, we re-discovered the need to design for flexibility. For
example, the 'event processing unit' of Star was \(and is\) the
actor. Early versions of the actor were tailored to initial use cases;
but was not suitable for slightly different cases. This resulted in
the re-engineering of the language concept that resulted in a simpler,
more combinatoric design. It also made the language slightly
lower-level but more general. This process of design and re-design
happened many times.

Star today is a high-level general purpose language that has many
modern features. For example, we have contracts \-- an analog of
Haskell type classes. It has a powerful macro language too \-- to
enable syntactic extensions to the language. It also has a number of
important extensions: for expressing SQL-like queries and for
structuring high-level components.

The original purpose of the language is now expressed as a syntactic
extension. You can define rules in this analytics extension which are
realized as a network of actors and functions. The details of
processing events for finding averages and temporal ordering are
masked from the analytics programmer.

The texture of Star is quite different to languages like Haskell and
Scala. This was heavily influenced by the kind of person we imagined
would be programming in Star: they were more likely to be familiar
with SQL than with Java.

The result is a programming language that is modern, powerful and
readable.

Star has been used for quite a divergent range of applications: from
real-time scheduling of the processes within the Fab to tracking
electricity charging of electric vehicles in a city region.

## Frank McCabe
Frank McCabe is CTO of Starview, Inc.  He is not an original functional programmer. In fact, he was heavily involved in the early days of Logic programming: he built the first commercial implementation of Prolog to run on micro-computers. His PhD topic was on the relationship between logic and object oriented programming. He came to appreciate the merits of strong types and overloading as a result of programming in the real world!

He has also been involved in research into multi-agent systems and into Service Oriented Architecture. 

Starview's primary product is a platform on which general purpose event processing applications can be easily constructed. Star is a critical part of the platform, but the focus and orientation of the platform is not primarily a programming platform but an application construction platform.
