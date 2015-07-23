- type: talk
- title: Modeling state transitions with specification-based random testing 
- speakers: Zeeshan Lakhani 
- affiliations: Basho 

## Abstract 
What if you thought about tests only in terms of properties and counterexamples? Properties that may assert failures and/or successes. Counterexamples to a set of properties that can “shrink” to smaller failures and be better reasoned about. Properties and counterexamples are the foundation of QuickCheck, a tool to generate tests over concurrent and non-deterministic code.

The difficult component of most real-world approaches to generative testing is understanding the bounds and requirements surrounding a problem/feature/application. Using Erlang’s QuickCheck implementation, we’ll walk through an example which models a continuous, side-effecting, hashtree-based synchronization mechanism, called Active Anti-Entropy (AAE), as an abstract state machine. By being able to query the (Erlang) process state and compare it against our model state, we can assure that our system matches its intended specification – which is a whole lot more important than tests being green.

## Zeeshan Lakhani
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/zeeshan-lakhani.jpg" alt="Zeeshan Lakhani"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Zeeshan became a programmer by way of film and music recording/technology. Moving from science center to startup to labs to working on distributed systems at Basho, he has accrued tons of necessary and needless information, and is a polyglot who will dive into anything related to programming languages, particularly functional ones, machine learning, and math. Additionally, he is one of the lead organizers and founders of Papers We Love!
</div>
</div>
