- type: tutorial
- title: T2: OCaml tutorial
- speakers: Yaron Minsky, Anil Madhavapeddy
- affiliations: Jane Street, University of Cambridge


## Abstract
OCaml is a statically typed functional language with a fast native
code compiler and incremental garbage collector. In this tutorial, we
will first introduce the basics of OCaml using an interactive
environment running in a web browser, as well as a local install of
OCaml using the OPAM package manager. Then, we will introduce Jane
Street's Core library, which is an industrial-strength alternative to
the OCaml standard library. Core is designed with consistency,
explicitness and efficiency in mind. We will build up to the
construction of a simple publish-subscribe data broker using the Async
monadic concurrency library.

## Preparations
The Real World OCaml tutorial is intended to be interactive, with a
guided introduction to building a distributed broker service using the
Core and Async libraries.  Complete beginners can also work through
the first few chapters of the O'Reilly "Real World OCaml" book, with
questions being answered by the authors.

Before arriving for the tutorial, it would save time if you set up the
compilation environment.  You will need at least OCaml 4.01.0, which
you can easily install using the OPAM package manager.

1. Install OPAM by following the quick-start guide at [this
page](http://opam.ocaml.org/doc/Quick_Install.html).

 (You can use OCaml 3.12.1 or greater to get this in place, or just
 use binary packages if available on your platform.)

2.Once OPAM is installed, compile the 4.01.0 compiler by running:

    $ opam update
$ opam switch 4.01.0
$ eval `opam config env`

3. Install the Core and Async packages required for the tutorial.

    $ opam install utop core_extended async core_bench
    $ utop   # to test it out

PCRE and pkg-config need to be installed before Core_extended will
compile.

On MacOS X:

```
$ brew install pcre pkg-config
```

And Debian/Ubuntu users should have it in their respective APT repositories.

This will take 10-15 minutes depending on the speed of your computer,
so it's best to get it done before the tutorial starts.

## Yaron Minsky
<img align="right" src="img/yaron-minsky-portrait.jpg" alt="Yaron Minsky"></img>
Yaron Minsky obtained his PhD in Computer Science from Cornell
University in 2002, focusing on distributed systems. In 2003, he
joined Jane Street where he founded the quantitative research group
and introduced OCaml to the organization. Today, he leads Jane
Street's technology group, which uses OCaml as its primary development
language.

## Anil Madhavapeddy
<img align="right" src="img/anil-madhavapeddy-portrait.jpg" alt="Anil Madhavapeddy"></img>
Dr. Anil Madhavapeddy is a Senior Research Fellow at Wolfson College
Cambridge based in the Systems Research Group in the Cambridge
Computer Laboratory. Dr. Madhavapeddy was on the original team at
Cambridge that developed the Xen hypervisor, and subsequently served
as the product director for XenSource/Citrix before returning to
academia. Prior to obtaining his PhD in 2006 from the University of
Cambridge, Dr. Madhavapeddy had a diverse background in industry at
Network Appliance, NASA, and Internet Vision. In addition to
professional and academic activities, Dr. Madhavapeddy is an active
member of the open source development community with the OpenBSD
operating system and various networking, database and web
applications, a member of the steering committee for Commercial Users
of Functional Programming, and on the boards of startup companies such
as Ashima Arts.
