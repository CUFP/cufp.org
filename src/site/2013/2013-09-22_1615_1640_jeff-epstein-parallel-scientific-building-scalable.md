- type: talk
- title: Building scalable, high-availability distributed systems in Haskell
- speakers: Jeff Epstein
- affiliations: Parallel Scientific
- video: http://www.youtube.com/watch?v=ZiyDJEfXOXw
- slides: /2013/slides/epstein.pdf


## Abstract
We are using Haskell to develop an ultra-scalable high-availability
resource management system for big clusters (millions of nodes).  A
key element of the design is to provide scalable and reliable
mechanisms for communicating failures and coordinating recovery
transitions. In this talk, we‚Äôll describe the design of the project
and some challenges we‚Äôve faced along the way.  For distributed
concurrency, we use the actor model provided by Cloud Haskell, which
provides good network semantics and remote process management, the
importance of both of which we will explain.  The challenges of using
Cloud Haskell include dealing with scalability issues and providing
backend transports for multiple kinds of network hardware.  A
replicated state machine preserves the state arising from failures and
transitions and is at the center of our design.  It uses the Paxos
algorithm, and we used formal verification in the design \(and
debugging\) of this algorithm, beautifully combining Promela and
Haskell.

## Jeff Epstein
is a development lead as Parallel Scientific. He has an extensive
background with managing teams and developing software of many types,
including web sites, digital telephony, embedded systems, and
distributed systems.  He has a graduate degree from Cambridge
University, where he studied under Simon Peyton Jones.
