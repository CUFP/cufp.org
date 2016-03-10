- type: tutorial
- title: T2: JaneStreet's OCaml Core Library
- speakers: Yaron Minsky
- affiliations: Jane Street


## Abstract
Jane Street's Core library is an industrial-strength alternative to
the OCaml standard library.  Core is designed with consistency,
explicitness and efficiency in mind.  This tutorial will cover:

## Core
An overview of the main library, including:

- How to download and install Core on your own system
- The design principles behind Core
- Examples of how to use some of the trickier libraries

## Syntax Extensions:
A review of the the syntax extensions included in Core and how to use
them effectively.  The extensions to be covered are:

- <code>pa_sexplib</code>: auto-generation of functions for serializing to and from
 an s-expression format
- <code>pa_binprot</code>: auto-generation of functions for serializing and
 deserializing to an efficient binary format
- <code>pa_compare</code>: auto-generation of comparison functions
- <code>pa_typehash</code>: for generating a hash of a type definition.  Useful for
 ensuring agreement on types in network protocols.
- <code>pa_fields</code>: for auto-generating first-class fields and various
 iterators over the fields of a record type.
- <code>pa_variants</code>: for auto-generating first-class variants and iterators
 over the set of cases in a variant type.

## Core_extended:
In addition to giving an overview of the Core and how to make the most
of it, we'll cover Core_extended, which is a set of extensions to core
that are less stable, but still highly useful.  Notable among those
libraries is:

- <code>Shell</code>: a library for interacting with the UNIX shell
- <code>Command</code>: a library for building command-line executables featuring
 subcommands for combining a collection of utilities into one common
 command, and built in auto-completion support for Bash.

## Audience
The class will not teach OCaml proper, so attendees should already
know the basic constructs of the language, and be comfortable writing
short programs in it.  Beyond a facility with the concepts of
functional programming, no further experience is required.

## Preparation
*Note: This is the same VM as for the [T3: Building a Functional OS](t3-building-functional-os.html).*

You'll need:

- an SSH client on your machine
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- the [machine image](http://minsky-primus.net/CUFP-Core-and-Mirage-Tutorials.ova)

Click `Import Appliance` from the File menu, and select the `.ova` file.
After it imports the file, click on `CUFP Core and Mirage Tutorials`,
and click the green `Start` arrow.

The user account is `cufp`, and the password is `cufp2011`.  Log in,
and type `/sbin/ifconfig` to figure out what the internet address of
the virtual image is.  It should be the one associated with `eth1`.
Then ssh to the box as `cufp` and log in.  All the software you should
need is installed on the virtual machine.

You can also direct a web-browser at the virtual host.  You'll find
ocamldoc documentation for the Core libraries there.

## Alternate preparation
If you have trouble with virtualbox, you can install OCaml and the relevant packages on their own.  Here are the packages you should get, and the order of installation:

- [type-conv](http://www.janestreet.com/ocaml/type-conv-2.3.0.tar.gz)
- [sexplib](http://www.janestreet.com/ocaml/sexplib-7.0.2.tar.gz)
- [bin-prot](http://www.janestreet.com/ocaml/bin-prot-2.0.3.tar.gz)
- [fieldslib](http://www.janestreet.com/ocaml/fieldslib-107.01.tar.gz)
- [variantslib](http://www.janestreet.com/ocaml/variantslib-107.01.tar.gz)
- [core](http://www.janestreet.com/ocaml/core-107.01.tar.gz)
- [core-extended](http://www.janestreet.com/ocaml/core_extended-107.01.tar.gz)

All of Jane Street's packages can be found [here](http://ocaml.janestreet.com/?q=node/13).

## Yaron Minsky
is the head of the technology group at Jane Street, a proprietary
trading firm that uses OCaml as its primary development language.
Yaron got his PhD in Computer Science at Cornell in 2002, where his
research was focused on probabilistic algorithms for distributed
systems.
