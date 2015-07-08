- type: talk
- title: Coping with change: data schema migration in Haskell 
- speakers: Adam Gundry 
- affiliations: Well-Typed LLP 

## Abstract 

A strong type system makes refactoring large programs a relatively safe process, because the type checker helps identify all the places that must be updated. But what about refactoring our data? Software development necessitates coping with rapid change, and if we are to keep up we need to know that changing our data schema will not result in today's code being unable to read yesterday's data.
 
In this talk, I will explain how we've addressed this problem in the context of a Haskell-powered web service, by creating a DSL for describing data schema migrations at the level of Haskell datatypes. This allows us to write a self-documenting, human-readable schema changelog that can be validated by developers and executed on production data during automated deployments.

## Adam Gundry 

<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/adam-gundry.jpg" alt="Adam Gundry"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Adam is a Haskell Consultant at Well-Typed, providing software development, advice and training for businesses using Haskell. In 2013, he completed a PhD on combining Haskell with dependent types. He is interested in programming language design and compiler front ends, and contributes to the Glasgow Haskell Compiler.
</div>
</div>
