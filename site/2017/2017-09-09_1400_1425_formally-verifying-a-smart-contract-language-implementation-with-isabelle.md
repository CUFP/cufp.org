- type: talk
- title: Formally Verifying a Smart-Contract Language Implementation with Isabelle
- speakers: Simon Meier
- affiliations: Digital Asset

## Abstract 

Digital Asset builds distributed-ledger and smart-contract technology for enterprise applications. Two key promises of this technology are significantly lower operational costs and increased auditability. Key techniques to realize these promises are the representation of contracts as code and immutable, authenticated data-structures. However, these techniques also do require significantly higher correctness guarantees from both contract specifications and ledger implementations. At Digital Asset, we provide these correctness guarantees by systematically applying formal methods.
  
In this talk, I'll give insights into one such application of formal methods. More precisely, I'll explain how we use Isabelle/HOL to provide a verified implementation of the interpreter for DAML, our smart-contract language. The goal of this talk is to show how one can leverage Isabelle/HOL as a combined implementation and verification environment for core algorithms.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/simon-meier.jpg" alt="Simon Meier"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Simon Meier

Simon Meier works as a Distinguished Software Engineer at Digital Asset where he leads the team developing their purely-functional smart contract language and its tooling using Haskell and Scala. He holds a PhD from ETH Zurich where he built the Tamarin security protocol verifier, and worked on machine-checked security protocol verification in Isabelle/HOL. He regularly organises the Zurich HaskellerZ meetup and helped organize several ZuriHac Haskell Hackathons.

</div>
</div>
