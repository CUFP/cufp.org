- type: talk
- title: Functional mzScheme DSLs in Game Development 
- speakers: Dan Liebgold
- affiliations: Naughty Dog Inc.
- video: https://www.youtube.com/v/Z8Xamkb-J2k


## Abstract
Naughty Dog has a history of using various Lisp dialects to solve a wide variety of game development problems. But when making the jump from the Playstation 2 to the Playstation 3 we decided that maintaining our custom Lisp-based game development system was too costly. We dedicated our efforts to rebuilding our tools, engine, and game in C++ and assembly language.

This left no scripting system for gameplay and, more importantly, no system for creating DSLs and the oodles of “glue” data that is typically required to develop a Naughty Dog video game. Existing tools weren’t going to cut it: there was no off-the-shelf scripting system that fit our stringent memory requirements and no language that would allow rapid DSL creation that fit into our tool chain. With a bit of naivety, a penchant for the Scheme language, and a passion for functional programming techniques we dove in and started putting together a system to fill in the gaps.

The results have been profoundly good but not without many issues. We’ve fought with poor tool performance, difficult build environment integration, alien syntax, abysmal error reporting, and just plain confusion. The functional nature of our system has been a big win, allowing us to flexibly distill our data down to just the right form to embed into our game’s run-time environment. And we’ve got a system where programmers, artists, animators, and designers are productively “programming” directly in our S-expression Scheme-like language.

This talk will give a brief overview of our experience at Naughty Dog building this functional DSL development system on top of MzScheme. I’ll talk about the challenges of “blue collar” programmers entering the somewhat academic world of language research and development while under the onerous deadlines of retail software development. I’ll talk about the many opportunities this approach afforded us, some of which we were able to capitalize on to great success, others which lay tantalizingly just out reach. I’ll talk about the culture clash of getting C++ programmers, technical game designers, and non-technical artists to be productive in a world of S-expressions and syntax transformations. And I’ll give an overview of some metrics of the impressive contributions our system was able to make to the development of Uncharted series of games for the Playstation 3.
