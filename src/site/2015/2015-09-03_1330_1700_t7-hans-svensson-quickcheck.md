- type: tutorial
- title: T7: Testing stateful systems with QuickCheck
- speakers: Hans Svensson
- affiliations: Quviq

## Abstract
Erlang QuickCheck support property based development. Instead of writing test cases
for your applications, you write a one-pager with a QuickCheck property from which
hundreds of test cases are generated automatically. QuickCheck simplifies failing
cases to a minimal example on a test failure (so that fault diagnosis is quick and
easy). QuickCheck enables developers to dramatically improve test coverage, and find
obscure errors at an earlier stage, lowering costs and improving quality as a result.


## Tutorial objectives

This tutorial will show how testing stateful systems is done using Quviq QuickCheck
We do this by writing a QuickCheck specification (an Erlang program) using the
QuickCheck API. The specification will allow us to generate and execute test cases.
We will show how QuickCheck's shrinking finds small examples that provoke errors,
greatly simplifying bug diagnosing.


## Target audience
The tutorial is aimed at anyone with a general interest in QuickCheck who wants to
test stateful systems. Some familiarity with Erlang will help, but the tutorial should
be accessible also to someone who knows another functional language.

People are supposed to bring their own laptop, further instructions on how to prepare
will be provided at a later stage.

## Hans Svensson
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/hans-svensson.jpg" alt="Hans Svensson"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Hans Svensson is a QuickCheck expert working for Quviq AB. Hans has been working with
QuickCheck since 2008, both as a researcher and as a consultant. Hans
has a PhD from Chalmers University of Technology (2008) on the topic 
"Verification of Distributed Erlang Programs using Testing, Model
Checking and Theorem Proving".
Hans is a an active member of the Erlang community with more than a handful of Erlang papers at the Erlang
Workshop and ICFP, as well as several EUC and Erlang Factory presentations.
</div>

</div>
