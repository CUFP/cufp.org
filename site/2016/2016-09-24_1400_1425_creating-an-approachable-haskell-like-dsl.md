- type: talk
- title: Creating an approachable Haskell-like DSL
- speakers: Jasper Van der Jeugt
- affiliations: Fugue
- video: https://www.youtube.com/watch?v=rIphd57Sm1U

## Abstract 

At [Fugue](http://fugue.co), we built our own statically typed DSL, Ludwig, to configure cloud infrastructure in a declarative way.

The DSL relates to the Haskell language in two ways. First, the language's compiler and toolchain are written in Haskell. Secondly, the DSL is heavily inspired by Haskell. It also borrows interesting features from other languages, such as extensible records with row-type polymorphism and an intuitive YAML-like syntax.

Having a Haskell-inspired functional language certainly made it possible to build powerful abstractions. However, this often come at a price. Many of our prospective users in DevOps have little or no experience in functional programming. This means that they frequently have a hard time understanding how these languages work.

This is a problem for adoption: we want people to look at our examples and immediately feel at home. This talk will focus on how we are trying to achieve that. We will talk about how we constructed the different aspects of the DSL (syntax, type system...) in such a way that anyone who is comfortable editing YAML can pick up the language easily.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/jasper-van-der-jeugt.jpg" alt="Jasper Van der Jeugt"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Jasper Van der Jeugt
Jasper is a Principal Engineer at Fugue, working primarily on tools
related to domain-specific languages.  He has been writing about and
coding in Haskell ever since he started studying Computer Science at
Ghent University.  His interests include compilers, functional
programming, skateboarding, open source software, and photography.
He currently works remotely from Zürich, Switzerland.
</div>
</div>
