- type: talk
- title: Bonsai: a DSL for serverless firm real-time decisioning
- speakers: Jeremie Lasalle Ratelle
- affiliations: AppNexus

## Abstract

AppNexus is an internet technology company that powers the real-time sale and purchase of digital advertising via an auction technology called ""real-time bidding."" A key component of our technological stack is the AppNexus Programmable Bidder which allows buyers to plug in custom algorithms in order to modify bidding behavior. Most of those algorithms are coded using the Bonsai language, a sub-Turing declarative decision tree DSL with a Python-like syntax.

Bonsai abstracts away most of the messiness of evolving industry standards. The created trees are symbolic and easy to reason about for ad-tech experts who are not software engineers. The language semantics say nothing about how trees are evaluated which gives us a lot of freedom regarding the execution strategy.

We run the models on our own hardware, in a multi-tenant environment with sub-millisecond firm real-time constraints. We also host the compiler and the model's source code, intermediate representations, and compiled output. This makes our language design, optimization and deprecation processes very different from traditional compiler and language development. This talk will present many of the challenges that we've faced while developing a hosted debugger-less DSL targeted at non-programmers.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/jeremie-lasalle-ratelle.jpg" alt="Jeremie Lasalle Ratelle"></img>
</div>
</div>

<div class="content" media:type="text/omd">

### Jeremie Lasalle Ratelle
Jeremie is a senior software engineer at AppNexus. He develops compilers and runtimes for languages that run on the AppNexus real-time bidding platform. He is currently very interested in program synthesis. Outside of work, he's learning to be a dad while listening to new metal bands.
</div>
</div>
