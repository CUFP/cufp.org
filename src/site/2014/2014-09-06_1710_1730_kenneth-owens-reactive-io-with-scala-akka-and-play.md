- type: talk
- title: Reactive I/O with Scala, Akka, and Play
- speakers: Kenneth Owens
- affiliations: Comcast
- session: Potpourri
- video: https://www.youtube.com/watch?v=NVHjybjBZKY

## Abstract

On the Cross Platform team, in the National Engineering and Technology
Division of Comcast Cable, the distributed systems we design provide
back end services for many of the companies telecommunications, video,
home security, web based, and mobile products. Thus, the platforms we
design are generally required to be scalable, high throughput,
low-latency, soft-real time, and highly available.

We find that functional programming, as it encourages functional
rather than object oriented problem decomposition, is a natural choice
for implementing distributed, parallel, and concurrent systems, and
our experience with the Typesafe stack (Scala, Akka, and Play) has
lead to its adoption as a standard implementation choice within our
organization. As is often the case with distributed systems, I/O
throughput, and scaling to handle large numbers of simultaneous
connections, tends to be a greater challenge then computational
throughput for our platforms.

In this presentation, we will compare and contrast the various
patterns we use to achieve scalable, reactive, non-blocking I/O. These
include continuation passing based reactors, actor based reactors,
Play Iteratees, Enumerators, and Enumeratees, and asynchronous I/O
pipelines using promises and futures. We will walk through a simple
example for each pattern in Scala to demonstrate its strengths and
challenges it has presented for us.
