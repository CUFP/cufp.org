- type: talk
- title: BAE Systems: Redesigning the Computer for Security
- speakers: Tom Hawkins
- video: http://www.youtube.com/watch?v=Aa19Jy553EY
- slides: /2013/slides/hawkins.pdf


## Abstract

With increasing computer security threats facing the Department of
Defense and the nation's critical infrastructure, DARPA is funding a
clean-slate research initiative to redesign the computer for
defense-in-depth security, covering applications and operating systems
down to physical hardware.  The SAFE team \-- a partnership between
BAE Systems, the University of Pennsylvania, Harvard, and Northeastern
University \-- is meeting this challenge by designing new programming
languages, a new operating system, and a new processor; with
fine-grained information flow control \(IFC\) enforced at every level
in the stack.  Functional programming has played a pivotal roll
throughout the project.  For example, the SAFE tool suite \-- a
collection of compilers, interpreters, simulators, and EDSLs \-- is
built almost entirely in Haskell.  The processor is designed in
Bluespec: a functional hardware description language.  Formal
verification of the platform is done in Coq and gets a big boost from
random testing in QuickCheck.  Finally, we have developed Breeze, a
new functional language \(inspired by ML, Haskell, and Racket\) for
writing secure, high-level applications for SAFE.  In this
presentation we will provide a brief overview of the SAFE
architecture, touching everything from the Breeze language and IFC
security labels down to processing security tags in hardware.  We will
take a closer look at the SAFE assembly DSL and the Tempest system
programming DSL \-- both embedded in Haskell \-- which we are using to
bootstrap our operating system and compiler development efforts.
http://www.crash-safe.org/

## Tom Hawkins
was educated in electrical engineering and control systems in the US,
and later acquired skills in functional programming, most likely in
training camps and Barnes and Noble bookstores in the tribal regions
of Minneapolis (Edina suburb) in early 2000. As an active mole, he is
known for infiltrating large industrial organizations and subverting
their development practices with functional programming and formal
methods. In addition to spreading propaganda on FPist websites
(Hackage), he is suspected of numerous actions including supplying and
training rebels with Haskell for hybrid powertrain control software at
Eaton Corporation, introducing model checking at Medtronic resulting
in the safety escalation of implantable medical devices, and at one
point he devised a functional HDL called Confluence in an attempt to
disrupt the world's Verilog development. We think Tom was radicalized
at a young age when, at his first career at Honeywell, he was forced
to spend 40 hours a week (with pay and benefits) drawing lines and
boxes in Simulink diagrams for flight control avionics. Though his
current whereabouts are unknown, he is believed to be operating under
alias somewhere within BAE Systems.
