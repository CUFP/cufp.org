- type: tutorial
- title: T4: Collaborative Scientific Software
- speakers: Ashish Agarwal
- affiliations: New York University
- links: http://ashishagarwal.org


## Abstract
Science has always been a social activity. In this tutorial, we will build
an application in OCaml to support collaborative research amongst
scientists. A classic 3-layer architecture will be used: a domain logic in
the middle, a database backend to persist analysis results, and a web
interface to present the application's functionality to end-users.

Obtaining data and analyzing it are two basic scientific
activities. In the domain layer, we will implement a function to
download data from a widely used public genomics data repository, and
then use OCaml-R to analyze this data. The downloaded data as well as
the analysis results will be saved to a PostgreSQL database using
PG'OCaml, which validates OCaml code at compile time against the
database schema. Finally, we will implement a website using Ocsigen to
summarize the downloaded datasets and visualize the analysis
results. Time permitting, we will add user accounts and an access
control policy to give end-users the ability to select the
collaborators they share their data with.

By the end of this tutorial, participants should feel comfortable building a
complete application end-to-end in OCaml. It should be clear how each
layer's functionality could be extended to build a full enterprise
application. The tutorial should be of interest to non-scientists as well.
One needs only to replace tools in the domain layer to build applications
for other purposes.

## Audience
Audience should be comfortable writing basic programs in OCaml. Working
through any one of the introductory texts on OCaml is sufficient.
Familiarity with the specific libraries being used in the tutorial is not
necessary. Their use will be covered in the tutorial.

## Preparation
On September 15th, please download the
[virtual machine](http://cims.nyu.edu/~agarwal/download/CUFP2011-T4.ova)
needed for this
tutorial onto your laptop. Note the URL will not be active before then.
Install
[VirtualBox](https://www.virtualbox.org)
if you do not already have it. Open VirtualBox's
preferences and select the `Network` tab. In the `Host-Only Networks` box, you
should see one entry, `vobxnet0`. If not, click the `+` button to add it. Then,
import the VM into VirtualBox using the `File` -\> `Import Appliance` command.
During import, you will have the option of changing the VM's settings. Do
not change them unnecessarily, especially the Network settings. It should be
okay to change the name and path to the Virtual Disk Image if needed.

Once the import is complete, boot up the VM and make sure it runs correctly.
The user account name is `camel` and the password is `OCaml` with a capital
`O` and capital `C`. In particular, make sure you can do the following:

+     Run `ifconfig` in the VM, and note the IP address on `eth1`. From a terminal window on the host, ssh to the VM using this IP address. It should let you connect.

+     From within the VM, ping to an external site such as `google.com`. It should work.


## Ashish Agarwal
is a researcher at the Center for Genomics and Systems
Biology and the Courant Institute at NYU. He is designing a domain specific
language, implemented in OCaml, for managing and processing large quantities
of bioinformatics data in a high performance computing environment. His
background is a mix of the natural sciences, with studies in Chemistry and
Biology, and computer science, a PhD from CMU in the area of programming
languages.
