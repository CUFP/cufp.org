- type: talk
- title: Cryptol, a DSL for Cryptographic Algorithms
- speakers: Sally Browning
- affiliations: Galois
- video: http://vimeo.com/16753890

## Abstract
Cryptol is a domain-specific functional language designed by Galois,
Inc in collaboration with the the NSA for specifying cryptographic
algorithms. The Cryptol language includes native support for arbitrary
sized words, a strong type-system based on Hindley-Milner style
polymorphism extended with arithmetic size constraints, and the
ability to generate proof-objects throughout the compiler toolchain to
provide correctness evidence that can be independently verified. In
addition, high-level specification is fully executable. The
accompanying toolset provides a rich set of translators that can
produce both hardware and software implementations for a variety of
target platforms. In addition, the toolset can generate formal models
representing the specification and an implementation, whether
automatically generated from the Cryptol specification or written
independently, and show that the two models are functionally
equivalent.

A team of developers from Rockwell Collins, Inc. and Galois, Inc. has
successfully produced high-speed embedded Cryptographic Equipment
Applications \(CEAs\), automatically generated from high-level
specifications. These high-speed CEA implementations comprise a
mixture of software code and VHDL, and target a compact new embedded
platform designed by Rockwell Collins. Automated formal methods prove
that algorithm implementations faithfully implement their high-level
specifications.

Cryptol's high-level approach to hardware implementation does not come
at the expense of performance. For instance, an algorithm core
generated from a Cryptol specification for AES-256 and running in
Electronic Codebook mode demonstrated throughput in excess of 16
Gbps. When feedback from the output stage to the input was introduced,
thereby defeating the advantage gained by "unrolling" AES rounds,
encryption performance for AES-256 still exceeded 1 Gbps, while
consuming less than 2% of the available programmable logic for the
algorithm core.

Significantly, the Rockwell Collins/Galois team was able to design,
implement, simulate, integrate, analyze, and test a complex CEA on the
new hardware, including AES-256 and Galois Counter Mode \(GCM\), in less
than 3 months, significantly reducing the usual time to produce a new
design on a new platform.
