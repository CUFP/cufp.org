- type: talk
- title: Using Haskell to run a datacenter
- speakers: Pavlo Kerestey

## Abstract

We have seen wide adoption of Haskell in the various industries lately. As a data center providing variety of services, we have started using it for the first time in 2011 and replaced several tools previously written in ruby. Having immediately noticed improvement in stability of the overall system, we have committed ourselves to replace the rest of the code as well, and learn Haskell along the way. In September 2013 the transition was complete and we are running the datacenter with all the production code written in Haskell since. The main benefit was easy to extendable and flexible system over the years adapting to quickly changing business ideas without the compromise of quality. Specifically the fact, that one is confident that the source of possible errors is in the changing context and not a bug in the code.

We gather data from different systems like routers, firewalls, proprietary xml based interfaces of a virtualization platform, and specialized protocols of different generations of electricity meters. The usage reports help our technicians to run the infrastructure, provide precise invoices to the customers, and gives an overview for the company management.

I would like to present how overcoming the struggles we had initially when starting with Haskell and the the ecosystem, brought positive effect on the company organization, and stability of service. Committing to Haskell was probably one of the best business decisions we have made.
