- type: talk
- title: If your server is a function, is your company a library?
- speakers: Andrew Cowie

## Abstract

Haskell is lauded for being a good foundation for building high
quality software. The strong type system eliminates huge classes of
runtime errors, laziness-forced-purity aides in separating messy IO
from pure computational work, and the wealth of tools like quickcheck
mean that individual codebases can be robustly unit tested.

That's fine when your service runs from a single program. Building
anything larger requires integration testing of components and that
can be difficult when it's a distributed system.

Over the past year, one of our projects has been building a data vault
for system metrics. It has all the usual suspects: client side code in
various languages, message queues and brokers, daemons ingesting data,
more daemons to read data out again, analytics tools, and so on.

Testing all this was challenging; in essence we didn't have any
integration testing and overall-function testing was often manual.

As we embarked on a rewrite, a small change was made: the message
broker was rewritten in Haskell and the daemon code was made a
library. Soon other formerly independent Haskell programs were turned
into libraries and linked in too. And before we knew it, we had the
entire distributed system able to be tested as a single binary being
quickchecked end-to-end. This is very cool.

This has, however, raised a bigger possibility: if each project is a
library, can you express the entire company as the composition of
these various libraries in a single executable? We have people working
on internal APIs, monitoring systems, and infrastructure management
tools. These projects are all in a state of flux, but bringing the
power of the Haskell compiler and type system to bear on the ecosystem
as a whole has already improved interaction between teams.

There are a number of hard problems. Not everything is written in
Haskell. Many systems have external dependencies (databases, third
party web services, etc). This talk will describe our approaches to
each of these, and our progress in abstracting the overall idea
further.

{{ input src/site/2014/_register_button.html }}
