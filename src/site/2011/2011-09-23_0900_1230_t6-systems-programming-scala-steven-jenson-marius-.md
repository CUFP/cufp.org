- type: tutorial
- title: T6: Systems Programming in Scala
- speakers: Steven Jenson, Marius Eriksen
- affiliations: Twitter, Twitter


## Abstract
In this tutorial you will learn Scala from a *systems programming*
centric point of view. By the end of the tutorial you will have built
a simple, robust and performant distributed search engine for tweets
using many functional programming idioms in a systems context. Scala
is a large language, so we won't cover every nook and cranny. However,
the most important concepts will be covered, and participants will be
left with experience with writing a non-trivial Scala application and
with the skills to learn the rest by themselves.

We start out by teaching the basic Scala concepts and language syntax.

## Basic Language Concepts
- Functions, Classes, Methods, Inheritance, `try-catch-finally`.
 Value-oriented programming
- Lists, Maps, functional combinators: `map`, `foreach`, `filter`,
 `zip`, `folds`
- Case Classes, Objects, Packages, `apply`, `update`, Functions are
 Objects \(Uniform Access Principle\), Basic Pattern Matching
- `PartialFunction` and advanced Pattern Matching
- A Tour of the Scala Collections library

Next we introduce a few Twitter-specific concepts that will be used in
our example application

## Twitter Concepts
- Tweets, Twitter Streaming API
- `Future` and Finagle

Followed by building our example application: a distributed search
engine for tweets built using functional concepts

## Build our Search Application
- Read Tweets: Read fake data
- Index Tweets: Building a functional indexer
- Query Tweets: Read from the index
- Use *Your* Tweets: Read from Twitter's Streaming API
- Distributed Indexing
- Run multiple indexers
- query in parallel and merge results

Lastly we will discuss how these functional concepts map onto the
object-oriented JVM.

## How Scala concepts translate to Java
- Classes
- Bytecode

## Audience
We assume attendees have working knowledge of basic functional
programming constructs such as pattern matching, higher order
functions and recursion.  Basic knowledge of object oriented
programming \(classes, methods, inheritance\) is also required.
Familiarity with Java concepts is a plus, but not required.

## Software Prerequisites
- A Twitter account
- A working Java (JVM) installation
- The [bootstrap tarball](scalaschool.tgz), also available [online](http://twitter.github.io/scala_school/).

## Steve Jenson
An engineer at Twitter since 2008 focused on building Scala
applications and libraries for high-volume systems. He has been
programming on the JVM since 1999 and in Scala since 2007\. He's a
contributor to a number of open source Scala libraries.

## Marius Eriksen
Marius works on systems infrastructure at Twitter. He has worked on
RPC and streaming systems, profiling tools, storage &amp; indexing systems
and our front-end serving stack. He loves applying functional
programming techniques to these domains.
