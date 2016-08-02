- type: talk
- title: Composable Caching in Swift
- speakers: Brandon Kase
- affiliations: Pinterest

## Abstract 

Consider what it means to be a cache. You need to be able to 
(1) associate a key with a value and 
(2) get some value given a key if such a value exists. 
That's basically it. Caches tend to appear in layers. In a CPU, memory reads check L1, then L2, then L3, then RAM. When we want to load an image, we first check RAM, then disk, and finally network. 

In a mobile app, if you don't nail your cache code, your users will suffer. Excessive networking causes both battery and data-plan drain. We can help ensure a clean correct implementation by combining caches. Given two caches A and B, A `on-top-of` B means first check A, fallthrough to B, then write back to A. Now we can define a monoid for caches. Monoids imply easy composition. Easy composition means reasoning about our code becomes easy.

Such an abstraction isn't possible to express both statically and generically in languages like Objective-C and Java, but we can with Swift's strong type system. The caching library Carlos provides the foundation upon which we can build prefetching and other useful transformations. In our app, adopting such a system simplified our codebase: Caches became reusable legos. But the complexity doesn't just all go away, it's just hidden. With an abstraction so nice, it's tempting to think of the actual caches and cache glue as black-boxes. One problem we ran into was a reference cycle that led to large bitmaps leaking and phones running out of memory. It's important to actually think about the implementation details in detail, since these are your building blocks for the rest of the system. When your building blocks are stable, your building is stable.

Caching and prefetching are necessary for mobile apps. In this talk, I will explain how to think about caches as monoids, how a monoidal caching system can simplify our jobs as software engineers, and what real-world problems we ran into when putting such a system into production.

## Brandon Kase

<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/brandon-kase.jpg" alt="Brandon Kase"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Brandon Kase is a product engineer at Pinterest. He formerly hacked on Shorts as a member of the Math Camp team (now part of Pinterest). He first came across functional programming while pursuing a B.S. in Computer Science from Carnegie Mellon University. Brandon is excited that strong static typing and functional programming are becoming mainstream, and believes that techniques once reserved for academia will help industry produce more reliable software. He is in general fascinated by anything and everything related to well-designed programming languages and libraries.
</div>
</div>
