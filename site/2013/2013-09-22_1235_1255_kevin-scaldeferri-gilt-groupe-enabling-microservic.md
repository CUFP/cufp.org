- type: talk
- title: Gilt Groupe: Enabling Microservice Architectures with Scala
- speakers: Kevin Scaldeferri
- slides: /2013/slides/scaldeferri.pdf
- video: http://www.youtube.com/watch?v=EDbO47MKljQ


## Abstract
Over the past 4 years, the production architecture at the [Gilt
Groupe](http://www.gilt.com) has evolved from a single monolithic web
application to a highly-distributed collection of more than 200
micro-services and small web applications. This architectural shift
allows greater scalability and faster, less coupled development of new
features, but also presents challenges around maintaining consistent
development, testing, and deployment processes. We've developed a
number of techniques for addressing these challenges and implementing
new features using our preferred language of Scala.  This experience
report will discuss some of the interesting and novel ways we make use
of Scala including: Creating an SBT uber-plugin to abstract and unify
the development process with testing, deployment, and operations Using
the cake pattern to bridge the divide between unit testing and
functional testing Type-safe shared configuration using Zookeeper Live
inventory updates using Play WebSockets and Akka Actors.

## Kevin Scaldeferri
is a software developer specializing in scalable, high-performance
server applications. He spent several years at Yahoo building ad
serving systems, and currently works at Gilt Groupe, where he has
worked on the core e-commerce and order processing components, as well
as development tools, infrastructure, and architecture. He has spoken
at OSCON, YAPC, several user groups, and given internal tech talks on
a variety of topics such as "How to Serve a Billion Requests a Day
with Perl", "Beautiful Concurrency with Erlang", SBT, Continuous
Deployment strategies, and more.
