- type: talk
- title: Probabilistic Synchronization of State Between Independent Nodes
- speakers: Erlend Hamberg


## Abstract 

In a distributed system with nodes that receive broadcast events and
that should each have an up-to-date history, a problem arises when a
node is restarted: Did it lose any events while it was down? If so, we
need to get this history from another node that hopefully is
synchronized in order to reply to future requests with the correct
history.

There are ways to achieve this for systems where it is important that
the history is (eventually) consistent – often by using vector clocks
and time stamped messages. However, if the problem domain allows a
small probability of not having a consistent history across nodes,
cheaper solutions exist. By maintaining a set of hashes (a Bloom
filter) per node of all the events it has received, it is possible to
discover that it is out of sync by simply sending this hash to other
nodes. Nodes that receive this bit-string compare it against their own
hash and see if they are the same. In cases where they do not match,
the node can reply with only the events that do not match the other
node's hash – saving both time and bandwidth.

We have implemented a distributed chat system in Erlang using this
approach. Nodes eventually get a consistent history by sending
“heartbeat” synchronization events to other nodes that reply with the
missing events (if any). The low-probability event of losing a chat
message is acceptable, and by tuning the Bloom filter parameters we
can weigh the benefit of short synchronization messages against the
risk of losing messages in the chat history.