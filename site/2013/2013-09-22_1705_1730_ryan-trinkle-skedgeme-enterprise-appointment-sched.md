- type: talk
- title: Enterprise Appointment Scheduling with Haskell
- speakers: Ryan Trinkle
- affiliations: skedge.me 
- slides: /2013/slides/trinkle.pdf
- video: http://www.youtube.com/watch?v=BveDrw9CwEg


## Abstract
skedge.me is an online scheduling platform that allows businesses to
completely automate the process of making appointments, such as
customer visits, job interviews, and tutoring sessions.  Our clients
include McDonald's, Sephora, the FBI, and Stanford University.
Serving such a wide range of clients requires flexibility to implement
business logic for a wide range of existing business processes,
scalability to handle large transaction volumes, and accuracy so that
our clients can be confident that when we make a scheduling commitment
on their behalf, they'll be able to keep it.  As skedge.me grew from
the small business market into the enterprise space, our clients'
needs began to outstrip the capabilities of our Grails-based back-end
architecture.  Eventually, we made the decision to replace it, and we
went with Haskell.  Using Haskell has presented some challenges.
We've run into our fair share of issues with the difficult learning
curve and occasional sparseness of the Haskell toolchain, but the
biggest challenge for us has been the impedance mismatch between the
relational database paradigm and the functional paradigm.  In contrast
to object-relational mapping, algebraic-datatype-relational mapping is
relatively uncharted territory.  Although some ORM-style libraries,
such as Persistent, have been written for Haskell, their support for
more complex functional datastructures, such as sum types, finite
maps, and deeply nested datastructures, leaves much to be desired.
This has forced us to make difficult trade-offs between structuring
our data in a way that best suits the application layer and
structuring it for the database layer.  On the whole, however, Haskell
has made our product \- and our lives as developers \- much better.
Haskell's powerful type system and GHC's powerful optimizer has
allowed us to make major architectural decisions that would simply be
impossible in practically any imperative language.  We use a stack of
monad transformers to create application layers with increasing levels
of safety ‚Äì transaction, data integrity, security, and business
logic \- which allow us to separate these concerns and give us much
greater confidence that layer invariants are not violated.  Our
security policies are implemented using multiparameter type classes,
which allow us to implement detailed per-client security policies,
omitting coverage of components a client doesn't use, while ensuring
total coverage and consistency of the components the client does use.
And, we've built our core calendaring code around a powerful library
of custom immutable datastructures that allow us to easily parallelize
large jobs while keeping code small, legible, and reusable.  These
advantages have enabled us to deliver a product that is more
customizable, higher performance, and better quality than its
predecessor, with only a fraction of the development effort.

## Ryan Trinkle
I've been working with Haskell for 8 years personally and 4 years
professionally, ever since I switched from C++ in pursuit of a faster
way to write better software.  I hold a B.S. in computer systems
engineering from Rensselaer Polytechnic Institute and a J.D. from
Harvard Law School.
