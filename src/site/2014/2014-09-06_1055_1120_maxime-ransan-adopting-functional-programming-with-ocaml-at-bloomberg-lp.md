- type: talk
- title: Adopting Functional Programming with OCaml at Bloomberg LP
- speakers: Maxime Ransan
- affiliations: Bloomberg LP

## Abstract 

Bloomberg utilizes functional programming (OCaml) in production for
powering part of its Bloomberg Professional Services product. Aided by
a collaboration with LexiFi, several Bloomberg applications are now
making use of GUI generation and financial contract representation;
Bloomberg furthermore has embraced OCaml to develop domain specific
languages and the problem of integrating the vast amount of data
available in the Bloomberg infrastructure.

This talk will detail our experience of the adoption process of
functional programming by a team of primarily C++ developers and how
we plan to extend the use of OCaml to more applications. We will use
the concrete business problem of trade capture to illustrate our
technology transition.

New financial products are created continuously and the ability to
quickly develop and deploy applications to capture the details of such
contracts accurately is crucial. While one can easily build generic
screen to record unstructured data, difficulties arise when complex
validation and UI behaviors need to be implemented. Bloomberg has
been through many iterations in the development of solutions to this
problem. At one time, code generation techniques were employed; this
technology was then migrated to benefit from the modified OCaml
compiler developed by LexiFi (MLFi). This technology is now fully
integrated into the Bloomberg development environment and makes use of
all available proprietary APIs.

{{ input src/site/2014/_register_button.html }}
