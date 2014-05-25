- type: talk
- title: Haskell for XenClient
- speakers: Matthias Görgens
- affiliations: Citrix
- video: https://www.youtube.com/watch?v=jOY5FK4_SZs

## Abstract
Like functional programming, which has been around in rudimentary form
since the dawn of computing, virtualization only found wider
commercial application more recently when people figured out how to
make it work efficiently on x86 processors.  So far virtualization
means headless servers running on the cloud.  XenClient is changing
that. XenClient is a client-side virtual machine manager based on the
Xen hypervisor. It targets laptop platforms, which means new
challenges compared to servers: power management, 3D graphics,
ubiquitous plug-in devices and worrying about adversaries tampering
with the hardware.  While still providing all the advantages of the
cloud, like presenting a synchronized state to the user independent of
the device they are using, or ease of provisioning and administration.

Early XenClient borrowed heavily from XenServer, a server
virtualisation platform that preceded XenClient by several years.  As
a major user of OCaml, XenServer had its share of talks here, too.
Over time our code bases diverged. A more modular architecture allowed
us to try different languages.  Today we are the proud owners of more
than ten thousand lines of Haskell employed in around ten daemons \(and
counting!\) making up all the intelligence of XenClient, running
reliably in embedded virtual machines without direct user
intervention.  This is the story of the second generation of
functional programming at Citrix.

## Matthias Görgens
Matthias Görgens is a mathematician by
training.  Thanks to attending ICFP 2009 he started his software
development career writing OCaml for XenServer three years ago, and
has been working on XenClient since last year.
