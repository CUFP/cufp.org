- type: talk
- title: Transmitting customised ads to set-top boxes with Erlang
- speakers: Laura M. Castro, Macías López
- affiliations: University of A Coruña, University of A Coruña
- video: https://www.youtube.com/watch?v=1hzlreTtXS4

## Abstract
There is a large market for customized direct advertising. In the context of cable TV operators, specifically IPTV, the
catalog of products offered to customers includes a range of services that provide a suitable scenario for advertisement
transmission. Optimal use of the connection is a feasible and profitable source of revenue for the operator. Moreover, a
complete system for advertisement transmission could potentially not only deliver advertising in a timely, efficient
manner, but also take into account customer's preferences and characteristics, allowing for very interesting
personalisation.

Serving hundreds of thousands of people with their own customized advertisements while watching real-time television is,
however, challenging. Not only because of its high performance, concurrency and high availability \(i.e. zero downtime,
in-service updates\) requirements, but also due to fault-tolerance demands which are hard to warrant when the
communication channel \(i.e. IP connection\) is not fully reliable.

ADVERTISE is a distributed system, entirely implemented in Erlang, for transmission of customised ads to
on-customer-home set-top boxes over a Digital TV network of a cable operator. The functional programming language Erlang
is a very well suited tool for the task, as it is proven by the application serving nowadays more than a hundred
thousand customers.

One important challenge to overcome was delivering quality over an unstable network; the production network very
frequently experienced partitioning, where part of the network could not reach the rest of the network. We designed and
implemented a set of contingency mechanisms to deal with network partitions and node failures, and we established a
recommended deployment of ADVERTISE Erlang nodes in order to have maximal fault-tolerance capabilities in the given
production setting.

Thanks to the designed solutions, the distributed system is a success: not only has the system been working with no
incidents reported in the last four months, but each of the current three ADVERTISE nodes handles an average number of
18000 connected boxes 24/7, with peaks of 23000 boxes during prime time.

## Dr. Laura M. Castro
#### MADS Research group, University of A Coruna \(Spain\)
Laura is an assistant professor at the University of A Coruña \(Spain\),
where she has been teaching since 2005\. At the moment, she gives
lectures on Information Systems Design, Software Design and Software
Architecture.
Laura is also an active researcher, nowadays focused on software
testing \(automated, model and property-based testing\), applied to
software in general, and distributed, concurrent, functional systems
in particular.

## Macías López
#### MADS Research group, University of A Coruna \(Spain\)
Macías is a PhD studet at the University of A Coruña \(Spain\), and one
of the most recent and enthusiastic MADS researchers. He has been
working in several of the most prominent software development projects
in which the research group collaborates with the local industry. In
many of those projects, where fault-tolerance is usually a very
important requirement, Erlang is often one of the key technologies
used.
