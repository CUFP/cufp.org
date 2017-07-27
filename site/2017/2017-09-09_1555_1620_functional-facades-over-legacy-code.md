- type: talk
- title: Functional Facades over Legacy Code
- speakers: Nicholas Cowle, Robin Kay
- affiliations: G-Research

## Abstract 

As difficult to maintain legacy code bases proliferate within an organisation, tackling them head on often requires a substantial engineering investment without any guarantee of success.

We examine such a code base from within our own organisation - a large, stateful, object orientated .NET API for distributed computation with little type-safety.

It became apparent that idiomatic use of this library encouraged bad coding practices amongst its users, making it harder to make meaningful improvements to the API, and cementing its position as a legacy component.

When faced with this problem, we eschewed a big rewrite or major refactor in favour of abstracting over the problematic design with a declarative, type-safe facade written in F#.

This talk explores the significant advantages this approach offered to both the library's end-users and its development team - immediately preventing further accumulation of problematic user code, and establishing a better conceptual model for the library's functionality while laying a pathway for the ultimate replacement of the legacy implementation.

<div class="row author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/nicholas-cowle.jpg" alt="Nicholas Cowle"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Nicholas Cowle

Professional F# developer by day, amateur type theorist by night, Nick enjoys drawing ideas from the world of functional programming to create robust and safe software for the finance industry. In his spare time you can find him dabbling in Idris and saying 'correct by construction' far too much.
</div>

</div>

<div class="row author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/robin-kay.jpg" alt="Robin Kay"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Robin Kay

A long-time Haskell hobbyist, Robin Kay currently works professionally as an F# developer in the finance sector.
</div>

</div>
