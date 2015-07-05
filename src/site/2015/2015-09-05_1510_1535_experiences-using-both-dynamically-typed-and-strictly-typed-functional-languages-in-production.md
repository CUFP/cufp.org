- type: talk
- title: Experiences using both dynamically-typed and strictly-typed functional languages in a production environment
- speakers: Anders Fugmann 
- affiliations: Issuu 

## Abstract 

issuu is a digital publishing platform where visitors can read magazines and other publications. We use OCaml and Erlang extensively in production systems to serve 5 million unique visitors daily. This presentation will report on our experiences with using functional programming since 2007.

The two functional languages we use are very different. OCaml has a rich static type system while Erlang is dynamically typed. We find that the difference between static and dynamic types matters more in practice than whether the language is functional. The type system of OCaml increases development velocity because we can fearlessly refactor code to keep it in good shape. Rich types eliminate a large class of potential run-time errors: checking that calls match function signatures, forcing us to check "null pointers", ensuring that a newly-added case is handled everywhere in the program, etc. However, it remains difficult to guarantee bounds on integer values and list lengths or that a certain key must exist in a certain hash table.

Functional programming, typed or not, makes it natural to separate effectful code such as network communication from pure code such as algorithms and business logic. This separation greatly eases testing because pure functions are easy to unit-test without maintaining an unwieldy ad-hoc library of "mock objects". Our ideal program structure is a top-level module that performs all major side effects plus independent pure modules that inspect and produces immutable data.

From a hiring perspective, we see a trend that skilled back-end developers enjoy functional programming even though they do not all practice it. Those who know functional programming are likely to know other languages and paradigms very well and understand their limitations.

## Anders Fugmann
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/anders-fugmann.jpg" alt="Anders Fugmann"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
</div>

</div>
