- type: tutorial
- title: Implementing web sites with Scala and Lift
- speakers: David Pollak


## Abstract
Lift is a Web framework in the vein of [Seaside](http://www.seaside.st/) and
[WebObjects](http://developer.apple.com/tools/webobjects). Lift is built on
Scala, a functional/OO hybrid lanugage that runs on the Java Virtual
Machine.

In contrast to frameworks oriented around the model-view-controller \(MVC\)
pattern, Lift abstracts the HTTP request~response cycle rather than wrapping
HTTP concepts in APIs.  Lift makes use of Scala's functional abstractions in
a way that allows composition of applications.

In this tutorial, we will build a multiuser, real-time chat application in
Lift and discuss Scala's language features that make Lift possible.

## Audience
Participants should bring basic knowledge of functional programming.

## Software prerequisites
You should have [Java 1.6](http://java.sun.com) and Simple [Build Tool 0.7+](http://code.google.com/p/simple-build-tool/) installed on your machine as
well as the ability to open a TAR or ZIP file and a text editor.

You should also download one of the following:

[`http://tunaforcats.com/chat.tgz`](http://tunaforcats.com/chat.tgz)

[`http://tunaforcats.com/chat.zip`](http://tunaforcats.com/chat.zip)

These are both self-contained starting points for the tutorial.

To test that you have everything you need, you should run

`sbt jetty-run`

in the the `chat` directory that the above archives unpack into.

## David Pollak
has been writing commercial software since 1977\. He wrote the
first real-time spreadsheet and the worlds highest performance spreadsheet
engine. Since 1996, David has been using and devising web development tools.
As CTO of CMP Media, David oversaw the first large-scale deployment of
WebLogic. David was CTO and VPE at Cenzic, a web application security
company. David has also developed numerous commercial projects in Ruby on
Rails.

In 2007, David founded the Lift Web Framework open source project. Lift is
an expressive and elegant framework for writing web applications. Lift
stresses the importance of security, maintainability, scalability and
performance, while allowing for high levels of developer productivity. Lift
open source software licensed under an Apache 2.0 license.
David is a consultant in San Francisco and works on Lift-based projects.
