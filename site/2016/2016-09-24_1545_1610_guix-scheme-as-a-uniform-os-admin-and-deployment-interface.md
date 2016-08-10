- type: talk
- title: Guix: Scheme as a uniform OS admin and deployment interface
- speakers: Ludovic Courtès
- affiliations: Inria

## Abstract 

GNU Guix is a tool implementing the functional package management paradigm pioneered by Nix.  It is rooted in the free software world where it has a growing user and contributor community.  Guix and the Guix System Distribution (GuixSD) put an emphasis on providing a unified Scheme environment to deal with package management, container and virtual machine provisioning, operating system deployment, configuration, services, and associated activities.

In this talk I will describe the techniques we use to achieve this unified interface, with the intent to blur the user/developer distinction, and our early experience.  The oft-discussed advantages of embedding domain-specific languages (DSLs) have allowed us to develop tools and a programming environment that many envy.  Our use of Scheme covers  domains traditionally associated with C, Perl, or Python: “build scripts”, system initialization code, service management, Linux containers, and more.  Pervasive use of Scheme leads to a “multi-tier” programming environment; I will describe our staging techniques, implemented as mere Scheme syntax extensions.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/ludovic-courtes.jpg" alt="Ludovic Courtès"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Ludovic Courtès
Ludovic is a Schemer and a free software activist, currently working
as a research engineer at Inria.  After contributing to GNU Guile and
NixOS, Ludovic continued his independent hacking journey with Guix, a
blend of both worlds.  Ludovic likes to investigate how functional
programming and Scheme can help empower users by lowering the barrier
of entry to programming and operating system hacking.
</div>
</div>
