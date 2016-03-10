- type: talk
- title: Discrete Event Simulation using Erlang
- speakers: Olivier Boudeville
- affiliations: EDF R&D
- video: https://www.youtube.com/watch?v=gY_4RYB_bok

## Abstract
Any energy company planning to design and deploy a large- scale smart metering system is eager to minimize the risks in- volved by such a massive and costly roll-out. A simulation of that system before it exists is among the most effective tools to aid the decision-making process.
Yet the simulation of such large systems \(potentially dozens of millions of complex interacting devices like meters, gateways, concentrators, etc.\) requires a significant amount of computing resources to be harnessed.

As a result, our project needed an effective, highly concurrent \(parallel and distributed\) simulation engine, which was capable of also enforcing a set of required simulation properties \(uncoupling of virtual time, respect of causality, total reproducibility, some form of ergodicity, etc.\).

Our review of the state-of-the-art did not show us a good match for our requirements; the Sim-Diasca engine, which stands for Simulation of Discrete Systems of All Scales, was thus devel- oped to fulfill this need. Sim-Diasca is a generic discrete synchro- nous simulation engine which has been designed for maximum scalability.

To achieve this, we needed to bridge the semantic gap between the problem and its solution: in order to simulate an intrinsically concurrent system, we chose to rely on a language which was itself concurrent, Erlang. 

This choice had for side-effect to bring the functional ap- proach at the core of the engine design, an approach which in turn climbed our software stack and applied to all layers, from the engine to the models and simulation cases.

This experience report describes the various design issues and challenges that had to be overcome at all levels of the technical architecture, from the business modeling to the implementation of the engine and the models. 
