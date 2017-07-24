- type: talk
- title: Gens N' Roses: Appetite for Reduction
- speakers: Jacob Stanley
- affiliations: Ambiata

## Target
Anyone who is interested in getting improved counterexamples from their property based testing tools, and anyone who would like to to better understand how property based testing systems like QuickCheck actually work.

The code will be presented in Haskell, but the concepts are applicable to anyone who might want to build or improve purely functional testing tools for static or dynamically typed programming languages.

## Abstract
QuickCheck is a shockingly effective tool for validating the initial and ongoing correctness of production software. One of QuickCheck's most compelling features is that when a test failure is found, the failing test case is simplified to a minimal counterexample, through a process called shrinking. This makes it significantly easier to understand why a test has failed.

The Haskell version of QuickCheck, and most of its derivatives, tackle shrinking in a type-directed fashion. The Erlang version on the other hand, and a few similar tools for other dynamic languages, couple their shrinking capability directly with their test data generators. Now, types are good, right? So surely the Haskell version is better! Why wouldn't we want to use types to guide our shrinking process?

In this talk, I will highlight the technical and social problems that we, at Ambiata, experienced with type-directed shrinking. We'll explore the alternative, integrated shrinking, and we'll see that even in a statically typed language, integrated shrinking provides enormous benefits for developer productivity. We will see how to implement integrated shrinking, using rose trees, in the context of a strong statically typed language. Finally, we will see how to create a rose tree monad transformer, a tool which will allow us to create effectful test data generators, which still shrink properly!

From this talk, the audience will learn about the difference between type-directed and integrated shrinking, and how integrated shrinking can provide superior counterexamples, while placing a smaller burden on developers writing tests.

## Notes
This talk has been given at YOW! Lambda Jam 2017 in Sydney. See the conference website (http://lambdajam.yowconference.com.au/speakers/jacob-stanley-2/) for the slides that I used that day.
