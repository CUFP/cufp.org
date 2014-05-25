- type: tutorial
- title: T3: Building a Functional OS
- speakers: Anil Madhavapeddy, Richard Mortier, David Scott
- affiliations: University of Cambridge, University of Nottingham, Citrix


## Abstract
Have you ever wondered what lies beneath the mysterious layers of your
OS kernel? This tutorial will dispel such questions by walking you
through the construction a web server operating system, written almost
entirely in OCaml.  We use the Xen hypervisor to supply virtual
hardware that the guest will execute under, so that only a single set
of virtual drivers are required for networking and storage \(ideal for
learning about how it all works\).

The tutorial will last 3 hours and be highly interactive. We will:

- begin by introducing the Mirage programming framework, and how to
 use it under a familiar UNIX environment
- introduce high-level OCaml abstractions for a console, lightweight
 threads, and channels that map to UNIX sockets
- use the tuntap infrastructure to insert a TCP/IP/Ethernet stack as
 an alternative to the UNIX kernel stack
- compile the same source code to a microkernel running directly under
 Xen
- build your own "hello world" webserver and execute it on the public
 internet using Amazon EC2!

After the initial tutorial, we plan to hang around and help with
further questions, or even explore alternative microkernels such as
HalVM \(Haskell\) or GuestVM \(Java\). Come along and learn the essential
skills to learn how to build specialised services in your favourite
programming language!

## Audience
The tutorial will start gently, but participants should have some
proficiency in OCaml.

## Preparation
*Note: This is the same VM as for the [T2: JaneStreet's OCaml Core Library](t2-janestreets-ocaml-core-library.html).*

You'll need:

- an SSH client on your machine
- [Virtualbox](http://www.virtualbox.org/wiki/Downloads)
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

## Alternative Preparation
If you prefer not to use VirtualBox, you can run most of the Mirage tutorial if you have the following software:

- MacOS X \(10.6+\) or Linux. 64-bit is preferred, but 32-bit should work
- Tuntap networking \(usually default on Linux, and downloadable for MacOS X from [here](http://tuntaposx.sourceforge.net/)
- OCaml-3.12.0 with the native code version of the compilers \(e.g. ocamlopt.opt\) installed; available [here](http://caml.inria.fr/pub/distrib/ocaml-3.12/). Note that you need precisely this version of OCaml.
- [Git](http://git-scm.com/)

You can test that your setup works by cloning [http://github.com/avsm/mirage](http://github.com/avsm/mirage) and typing in 'make'.  A final version of the source tree will be tagged the day before the tutorial, but the expectation is that you just pull the latest version before beginning.

## Anil Madhavapeddy
is a Senior Research Fellow at Wolfson College Cambridge based in the
Systems Research Group. Dr. Madhavapeddy was on the original team at
Cambridge that developed the Xen hypervisor, and subsequently served
as the senior architect and product director for XenSource/Citrix
before returning to academia. Prior to obtaining his PhD in 2006 from
the University of Cambridge, he had a diverse background in industry
at Network Appliance, NASA, and Internet Vision. In addition to
professional and academic activities, he is an active member of the
open source development community with the OpenBSD operating system, a
member of the steering committee for Commercial Uses of Functional
Programming, and on the boards of startup companies such as Ashima
Arts.

## Richard Mortier
is a Horizon Transitional Fellow in Computer Science at the
University of Nottingham.  His research currently centres on
networked technologies within the Digital Economy.  In addition to
the topic of this talk this currently also includes exokernels for
secure high-performance multiscale computing; and infrastructure to
build an ecosystem around privacy preserving third-party access to
personal data. His background is in systems and networking, covering
operating systems, distributed systems, and local and wide-area
networking.  Prior to joining Nottingham he spent two years as
founder at Vipadia Limited designing and building the Clackpoint and
Karaka real-time communications products, six years as a researcher
with Microsoft Research Cambridge, and seven months as a visitor at
Sprint ATL, CA. He received a Ph.D. from the Systems Research Group
at the University of Cambridge Computer Laboratory, and a B.A. in
Mathematics, also from the University of Cambridge.

## Dave Scott
is the XenServer System Architect at Citrix, making virtualisation
products based on the open source Xen hypervisor. Previously he was a
consultant research scientist at Fraser Research, where he worked on
their next-generation networking initiatives. In 2004 he finished a
PhD in the University of Cambridge Computer Laboratory, affiliated
with the Cambridge Programming Research Group . He was also a
co-founder of High Energy Magic, which produced mobile phone software
to recognise printed visual symbols, known as SpotCodes.
