- type: talk
- title: Clear & Simple: Composing a Marketplace
- speakers: Mark Wong-VanHaren
- affiliations: Glyde
- slides: /archive/2009/slides/WongVanHarenMark.ppt
- video: http://vimeo.com/6698522

## Abstract
Glyde is a web-based marketplace, with the goal of making buying and selling as easy as possible. We also strive to provide a responsive, error-free experience. These goals represent challenges which functional programming helps mitigate.

First, easy-to-use often means complex-to-build, but FP's high-level abstractions and referential transparency help us to manage this complexity.  Second, as we handle people's money, mistakes could be damaging, but the expressiveness of FP give us confidence in our code, and a lack of side effects facilitates testing.  Third, a responsive site is a pleasure to use, so we write parallelizable logic, which FP's avoidance of side effects makes feasible.

This talk will describe Glyde's use of JoCaml and Scala and discuss our experiences with these tools.
