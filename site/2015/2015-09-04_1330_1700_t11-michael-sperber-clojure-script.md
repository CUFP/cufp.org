- type: tutorial
- title: T11: Declarative, immutable GUIs with ClojureScript, React and Reacl
- speakers: Michael Sperber
- affiliations: Active Group GmbH

## Abstract

Truly declarative GUIs have been an elusive dream for all functional
programmers. Instead, the state of the art in practical GUI
programming, even in functional languages, still relies on variations
of the MVC model where the program itself needs to align changes in
the model with changes in the GUI. This, and circular dependencies
between the view and the data, cause the universally hated "callback
hell." [Facebook's React](http://facebook.github.io/react/) is
frustratingly close to declarative, as it renders the GUI via a pure
function from the model. However, React's idea of a model and its
event event handling are still fundamentally imperative.
[The Reacl framework](https://github.com/active-group/reacl), built on top of
React, rectifies this fault and provides purely functional management
of rendering, state and event handling to the ClojureScript
programmer. This makes Reacl a practical and efficient substrate for
frontend programming across almost all platforms: web, mobile, Java,
and .NET. More importantly, it makes GUI programming enjoyable
again. Come and find out how at this tutorial!


## Tutorial objectives

- learn how to compile and deploy ClojureScript/Reacl programs
- learn how write front-end programs using ClojureScript and Reacl
- learn how to leverage HTML5 knowledge to improve GUI design
- enjoy the whole process

## Target audience

All functional programmers with an interest in front-end development.
No JavaScript knowledge or experience with DOM programming is
required.  A short introduction to the relevant parts of ClojureScript
will be given.  Rudimentary familiarity with HTML/CSS is helpful.

Please download the
[skeleton project](https://github.com/active-group/reacl-tutorial)
for the tutorial with instructions on setup before the tutorial.

## Michael Sperber
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/michael-sperber.jpg" alt="Michael Sperber"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Mike Sperber is the main author of Reacl.  He is also CTO of Active
Group, a small software consultancy in Filderstadt, Germany that
develops software for client projects using functional programming.
He has a long history of publishing on functional programming,
including many research papers, and being the project editor for the
R6RS standard for the Scheme programming language.  He has also
developed an introductory course in programming in use at several
German university, based on the PLT group's Program by Design
approach.  Mike is a member of the ICPF, CUFP, and FARM steering
committees.
</div>

</div>
