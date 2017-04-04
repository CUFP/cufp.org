- type: talk
- title: The Highs and Lows of Optimising DSLs
- speakers: Jacob Stanley
- affiliations: Ambiata
- video: https://www.youtube.com/watch?v=vewEILtqF7E

## Abstract 

So, you've written a DSL, it's a work of art! It so perfectly models the problem at hand that even a trained house cat could generate business value. You just have one problem, your interpreter runs 100x slower than a shell script launching JVMs in a loop.

Domain specific languages (DSLs) are able to offer the abstraction benefits of a high-level language, while when compiled, competing with low-level languages on performance. Because DSLs have a much smaller problem area, many specialised optimisations can be performed which are not feasible for a general purpose language.

In this talk, we will explain a number of optimisations which are useful for DSLs, and show our solutions to the practical issues we faced when implementing them in our query language, Icicle.

Icicle is a query language for processing large amounts of time-series data. Its type system enforces that queries require only a single pass over the data, and that multiple queries over the same data can be fused together. By using a combination of high level optimisations such as partial evaluation and common subexpression elimination, and low level optimisations such as parsing code which is specialised for the given input, our queries are faster than the equivalent hand-written C code.

From this talk, the audience will learn how the focused point of view that DSLs provide can be useful in performance critical systems, as well as a number of concrete techniques for optimising their own DSLs.

#### Target

Anyone who is interested in domain specific languages (DSLs), embedded or external, and wants to know how to make them beat the pants off hand written C/C++.

The techniques presented are applicable to DSLs written in any language, although a familiarity with Haskell syntax would be a plus.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/jacob-stanley.jpg" alt="Jacob Stanley"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Jacob Stanley
Jacob works at Ambiata, implementing the compiler and surrounding ecosystem for Icicle, a query language for processing large amounts of time-series data. His passion is building correct high performance software and he thinks functional programming and domain specific languages are outstanding tools for this purpose.
</div>
</div>
