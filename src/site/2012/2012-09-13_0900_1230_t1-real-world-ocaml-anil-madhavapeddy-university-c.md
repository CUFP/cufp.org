- type: tutorial
- title: T1: Real-World OCaml
- speakers: Anil Madhavapeddy, Yaron Minsky
- affiliations: University of Cambridge, Jane Street

## Abstract
OCaml is a statically typed functional language with a fast native
code compiler and incremental garbage collector.  In this tutorial, we
will first introduce the basics of OCaml using an interactive
environment running in a web browser, and the OPAM package manager.
Then, we will introduce Jane Street's Core library, which is an
industrial-strength alternative to the OCaml standard library. Core is
designed with consistency, explicitness and efficiency in mind.
Finally, we will demonstrate how to build fast Internet services such
as a database-driven webserver using the Lwt asynchronous programming
library and other open-source tools.

## Expectations
By the end of the tutorial, attendees will be familiar with basic
OCaml syntax and how to install useful packages such as `Core` and `Lwt`.
They will also understand how to build network servers for Internet
serving.

## Preparation
Please bring a laptop to the tutorial. Ideally, you should install the
required software on your laptop *before the tutorial*. If that fails,
we'll have a machine on-site for you to connect to.  In that case,
make sure to have an
[RDP](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol) client \(a
client for Microsoft's Remote Desktop protocol\) installed on your
laptop, so you can connect to our on-site machine.

If you have problems or questions, please contact Mike Sperber \(sperber\(at\)deinprogramm\(dot\)de\).

### Installing the prerequisite software
For the OCaml tutorial, you will only need:

- [OCaml 4.00.0](http://caml.inria.fr/)
- [OPAM](https://github.com/OCamlPro/opam/tarball/0.5.0)

After that, you run `opam install core async lwt`, and that will install
all the packages required for the tutorial material.

## Anil Madhavapeddy
<img align="right" src="img/anil-madhavapeddy-portrait.jpg" alt="Anil Madhavapeddy"></img>

Dr. Anil Madhavapeddy is a Senior Research Fellow at Wolfson College
Cambridge based in the Systems Research Group in the Cambridge
Computer Laboratory. Dr. Madhavapeddy was on the original team at
Cambridge that developed the Xen hypervisor, and subsequently served
as the product director for XenSource/Citrix before returning to
academia.  Prior to obtaining his PhD in 2006 from the University of
Cambridge, Dr. Madhavapeddy had a diverse background in industry at
Network Appliance, NASA, and Internet Vision.  In addition to
professional and academic activities, Dr. Madhavapeddy is an active
member of the open source development community with the OpenBSD
operating system and various networking, database and web
applications, a member of the steering committee for Commercial Uses
of Functional Programming, and on the boards of startup companies such
as Ashima Arts.

## Yaron Minsky
<img align="right" src="img/yaron-minsky-portrait.jpg" alt="Yaron Minsky"></img>

Yaron Minsky obtained his PhD in Computer Science from Cornell
University in 2002, focusing on distributed systems. In 2003, he
joined Jane Street where he founded the quantitative research group
and introduced OCaml to the organization.  Today, he leads Jane
Street's technology group, which uses OCaml as its primary development
language.
