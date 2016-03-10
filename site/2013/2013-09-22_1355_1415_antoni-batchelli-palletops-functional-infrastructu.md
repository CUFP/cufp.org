- type: talk
- title: PalletOps: Functional Infrastructures
- speakers: Antoni Batchelli
- slides: /2013/slides/batchelli.pdf
- video: http://www.youtube.com/watch?v=2U0QdyWQAGM


## Abstract
We live a privileged life for most of our days: quick REPL
prototyping, immutable data structures, abstractions, declarative
statements, multi-methods, you name it, it's all fun!  This fun stops
when we have to deploy our beautifully crafted functional applications
inside a larger infrastructure. Then it's all pain: setting up
servers, installing the right versions of software, updating
configuration files... Ugh! No more quick REPL prototyping,
abstractions, code reuse, declarative statements, immutability; all
gone! It gets worse though. We now use platforms like Hadoop, HBase or
Cassandra that require complex cross-node configurations. We have
multiple developers wanting to test on different versions of the
software and infrastructure. There are also many environments to
deploy on: Integration, QA, Stage, Production, and There are different
OS distros and versions to support, each with their own quirks and
bugs. Oh!, and different hardware options too: cloud, virtualized, or
even bare metal. You get the gist: a combinatorial explosion of
complexity.  We built Pallet \( http://palletops.com \) as an open
source functional infrastructure automation platform using
Clojure. This platform is used in production by many well known
companies already, usually as a response to the limited capabilities
and flexibility of mainstream script&amp;template based automation
platforms. This talk is about how we use functional programming
principles to manage infrastructure and the big ball of state this
infrastructure has.

## Antoni Batchelli
started programming computers for fun when he was eight years old with
a ZX Spectrum and has not stopped since then. Over the years, Toni has
worked in consulting, startups, academia and corporations. He has gone
back and forth between coding, architecting and managing, having fun
in each role, while always working on large software installations. In
2009, Toni started Disclojure \( http://disclojure.org \), a website
devoted to news about Clojure. in 2009, Toni met Hugo Duncan, with
whom he has since them been working full time on Pallet \(
http://palletops.com \) , an Open Source, Clojure-based DevOps
platform; and VMFest, a Virtual Machine automation library.
