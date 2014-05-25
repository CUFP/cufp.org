- type: talk
- title: Riak Core: Building Distributed Applications Without Shared State
- speakers: Rusty Klophaus
- affiliations: Basho Technologies


## Abstract
Storing big data reliably is hard. Searching that data is just as
hard.  Basho Technologies, the company behind Riak KV and Riak Search,
focuses on solving these two problems.

Both Riak KV \(a key-value datastore and map/reduce platform\) and Riak
Search \(a Solr-compatible full-text search and indexing engine\) are
built around a library called Riak Core that manages the mechanics of
running a distributed application in a cluster without requiring a
central coordinator or shared state. Using Riak Core, these
applications can scale to hundreds of servers, handle enterprise-sized
amounts of data, and remain operational in the face of server
failure.\* This talk will describe the implementation,
responsibilities, and boundaries of Riak Core, including how Riak
Core:

- Divides the data- or computing-domain of your application into
 separate virtual nodes located on different physical servers.
- Distributes data and operations to the correct virtual nodes within
 the cluster.
- Dynamically re-shapes the cluster without requiring a central
 coordinator when nodes enter, leave, crash, slow down, or go dark.
- Provides the Erlang community with a solid platform for creating
 other distributed applications.

Special attention will be paid to how Riak Core adopts common functional
programming patterns and leverages OTP/Erlang libraries and behaviours.
