- type: talk
- title: Functional Probabilistic Programming
- speakers: Avi Pfeffer
- affiliations: Charles River Analytics 
- slides: /2013/slides/pfeffer.pdf
- video: http://www.youtube.com/watch?v=U67guma2H6s


## Abstract
Probabilistic modeling is one of the most widely used approaches to
machine learning \(ML\). In recent years, the number and variety of
probabilistic models has increased dramatically. Currently, developing
a new probabilistic model requires developing a new representation and
reasoning and learning algorithms. This is expensive and requires much
expertise. Probabilistic programming \(PP\) is designed to make
development of probabilistic ML applications less expensive and easier
for non-experts. A PP language provides the tools to represent complex
models using the power of programming languages and provide reasoning
and learning algorithms that work automatically for any model written
in the language.  The development of PP languages has been inspired by
functional programming. Just as an expression in a function
programming language defines a computation that produces a value, an
expression in a functional PP language defines an expression that
stochastically produces a value by sampling the program. The purpose
of PP, however, is not just to produce stochastic values, but to
reason about the probability distribution over values produced by the
program, for example, to predict the value of one variable given
another.  In this talk, I will describe PP through two functional PP
languages I have developed. The first language, IBAL, was the first
general-purpose PP language. Implemented in OCaml, it showed how
probabilistic reasoning could be performed with algebraic data types
and higher-order functions. Our more recent language, Figaro, is an
embedded library in Scala. The main concept behind Figaro is that a
Scala program is used to construct a Figaro data structure that
represents a functional probabilistic program.  This enables creation,
manipulation, and integration of probabilistic programs in a way that
was not previously feasible. I will describe the process of transition
from IBAL to Figaro and the gradual understanding of what Figaro is.

## Avi Pfeffer
Dr. Avi Pfeffer is a Principal Scientist at Charles River
Analytics. Dr. Pfeffer is a leading researcher on a variety of
computational intelligence techniques including probabilistic
reasoning, machine learning, and computational game
theory. Dr. Pfeffer has developed a number of probabilistic
representation and reasoning frameworks, such as probabilistic
programming, which enables the development of probabilistic models
using the full power of programming languages, and statistical
relational learning, which provides the ability to combine
probabilistic and relational reasoning. He is the lead developer of
Charles River Analytics‚Äô Figaro probabilistic programming
language. As an Associate Professor at Harvard, he developed IBAL, the
first general-purpose probabilistic programming language. While at
Harvard, he also produced systems for representing, reasoning about,
and learning the beliefs, preferences, and decision making strategies
of people in strategic situations. Prior to joining Harvard, he
developed object-oriented Bayesian networks and probabilistic
relational models, which form the foundation of the field of
statistical relational learning. Dr. Pfeffer serves as Action Editor
of the Journal of Machine Learning Research and served as Associate
Editor of Artificial Intelligence Journal and as Program Chair of the
Conference on Uncertainty in Artificial Intelligence. Dr. Pfeffer
received his Ph.D. in computer science from Stanford University and
his B.A. in computer science from the University of California,
Berkeley.
