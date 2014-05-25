- type: talk
- title: Beckman Coulter Inc: Medical Device Automation using Message-Passing Concurrency in Scheme
- speakers: Vishesh Panchal, Bob Burger
- affiliations: Beckman Coulter Inc., Beckman Coulter Inc.
- links: , http://www.cs.indiana.edu/~burger/
- slides: /2013/slides/panchal.pdf)
- video: http://www.youtube.com/watch?v=D8PN_M-XRpM


## Abstract
We are a group in Beckman Coulter using functional programming for
controlling a molecular diagnostic device. The device contains 19
temperature, motor control and sensor boards, two barcode readers, and
a spectrometer. It can be used to perform various qualitative and
quantitative assays involving DNA and RNA.  The software has a thin
client UI implemented in C# and a server implemented in Chez Scheme
with an embedding of Erlang's concurrency model and some of the OTP
framework. It also implements a web server that presents data and
visualizations for diagnostics and debugging and also supports fast
prototyping of UI's.  There are three key advantages of this approach:
1\. For a medical device, the primary concern is safety. In a highly
concurrent environment where patient results are critical, the message
passing paradigm of Erlang avoids the pitfalls of the standard lock
and shared memory model. As far we know, we are the only group using
functional programming for a high level of concern medical device for
submission to the FDA.  2\. To support development of assays by
engineers and scientists, the software extends the Scheme programming
language with domain-specific constructs using the hygienic macro
system.  3\. The web pages provide a cross-platform, remote enabled
and extensible way of adding diagnostics and debugging.  There are
several challenging aspects of this development: dealing with
non-determinism, designing the process breakdown and supervision
hierarchy, and error handling and recovery especially when controlling
hardware.  This is a very large and ambitious project and we have
learned a lot while developing this software. We would like to share
our experience with the wider functional programming community and
learn something new in the process.

## Vishesh Panchal
got his Master's in Computer Science from Indiana University in
2006\. Since then he has worked at Beckman Coulter, where he has
developed software for laboratory automation.

## Bob Burger
got his PhD in programming languages from Indiana University in
1997\. Since then he has worked at Beckman Coulter, where he uses a
multi-paradigm, linguistic approach to solving problems using
Scheme. 
