- type: talk
- title: Distributed load testing with MZBench
- speakers: Renat Idrisov

## Abstract 

MZBench is open-source benchmarking tool written in Erlang. It allocates nodes directly in EC2 and setups Erlang cluster. System has web-frontend for charts and other useful information during the benchmarking. It is used for 100-node clusters and millions messages per second rates.

In this talk I want to show how functional programming helped us to build this system. The absence of implicit state makes possible to distribute working processes across a cluster. Like in other functional languages it is easy to create a DSL inside Erlang, so you could have a subsystem with a different semantics and different meaning.

I would also show how Erlang helps with immediate environment updates and harms with full-mesh network topology.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/renat-idrisov.jpg" alt="Renat Idrisov"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Renat Idrisov

I use Erlang for the last three years and have fun creating interpreters and distributed applications with it. I am involved in three open-source Erlang-related projects: MZBench (distributed benchmarking with Erlang), python_etf (pure Python parser for Erlang terms), and muterl (mutation testing tool for Erlang).

</div>
</div>
