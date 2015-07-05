- type: talk
- title: Haskell in production, a survey
- speakers: Christian Marie 
- affiliations: Anchor Systems

## Abstract 

I've just spent a year running a small team of Haskell developers in a hosting company, building internal and customer facing tools and products.

I'd like to talk about abstractions, using Haskell in a small development team, and how things like packaging and deployment with Haskell can suck.

I'd will to start with a brief explanation of why Haskell is great, and useful, touching on the topics of:

* Leaky abstractions
* Mathematics as an abstraction that doesn't leak
* Getting it done vs getting it right.
* Types as a framework
* Generic programming as a way to program ourselves out of our own jobs.

Next, a brief interlude on the factors considered when choosing a language for a business.

Finally, for the meat of the talk I'd like to go over some real, useful advice on delivering haskell projects to production. What works and what doesn't (lot's of what doesn't). This would include:

* How things can be unit tested and packaged, going over things we've tried like docker, debian packages, and trying to Jenkins the Haskell.
* How staging/acceptance testing might work.
* How a deployment plan could work.
* How monitoring happens once things are deployed, introducing EKG and the like.

## Christian Marie 
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/christian-marie.jpg" alt="Christian Marie"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
</div>

</div>
