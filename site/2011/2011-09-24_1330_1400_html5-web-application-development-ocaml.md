- type: talk
- title: HTML5 web application development in OCaml
- speakers: Keigo Imai
- affiliations: IT Planning Inc.
- video: https://www.youtube.com/watch?v=rj1gyyBCjZg

## Abstract
Recently, we have developed a few of HTML5 based web applications by using Ocamljs [1], which is a compiler from OCaml into JavaScript.  We will report on some experiences obtained by using OCaml as a client-side web language.
One of our project is a forex chart for smartphones which have rapid and responsive scroll-and-zoom animation based on CSS3\. Such quick animation was not achieved by any of previous forex charts which works on smartphone web browsers. You will see the working example at http://www.itpl.co.jp/ conga-forex-chart/. This works on both Android and iOS browsers, and also on a few PC browsers like Safari, Firefox, and Opera \(The support for Firefox and Opera is currently partial\). 

Other one is a web client of a peculiar filesystem. In the code it utilizes a monad that pretends complex asynchronous operations of Ajax to be a sequence of simple, synchronous ones. Although there’s no working example of that, you can access to the source code freely at http: //sourceforge.jp/projects/ngms/.  OCaml is currently not regarded as a ready-to-use programming language for web development.  When someone tries to use a new technology in the first place, one must usually convince their customers it is actually useful. Regarding to the forex chart development, say, the customer already trusted us and OCaml in some degree. I.e. we have been developed similar forex charts for several platforms for several years, and some server-side programs are already developed in OCaml. Additionally, to convince the feasibility of our challenge, we have prepared the prototypical build of CSS3 animation written in JavaScript, and they are not very interested in more technical details.

Our writing of the source code is rather standard \(i.e. there’s no phantom types, no reactive programming, no machine-verified proof of that, and so on\), except for the following aspects: \* It utilizes the inline-JavaScript feature of Ocamljs.  \* The usage of Ajax monad acts as if it is multi-threaded.

Inline JavaScript is sometimes necessary to gain performance, like in a tight loop to compute a sequence of forex analysis results. It also works like a charm when you want to use JavaScript's APIs \(like logging, regex and so on\) in that place.  There's the other compiler, Js_of_ocaml [2], which will produce faster code. We will report the experience of replacing Ocamljs with Js of ocaml.

[1] Jake Donham, Ocamljs, http://jaked. github.com/ocamljs.
[2] Jerome Vouillon and Vincent Balat, From bytecodeto Javascript: the js of ocaml compiler,  Available at http://www.pps. jussieu.fr/∼balat/publi.php
