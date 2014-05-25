- type: talk
- title: Functional Programming at Freebase
- speakers: Warren Harris
- affiliations: Metaweb
- video: http://vimeo.com/16754274

## Abstract
Freebase is a community-built, online database of facts and information, developed by Metaweb Technologies in San Francisco, California [1]. Freebase uses a proprietary graph database technology to store and query a network of over 12 million interrelated topics involving several hundred million individual graph relations. Third-party applications are free to query and update the Freebase database, and do so using the Metaweb Query Language, MQL [2]. MQL queries are expressed with a JSON-based template language which makes them easy to integrate into web applications, particularly the client-side portion which is processed with JavaScript?.

Metaweb's first-generation MQL implementation was written as a Python-based middle-tier application that dynamically translates JSON-based queries into a low-level proprietary graph query language and networking protocol [3]. The low-level query language was designed for efficiency rather than for direct usability, and significant effort is required to translate between the two languages. Analysis of the entire Freebase application stack has revealed that as much time was being spent in the MQL query and result translation process as was being spent actually resolving the low-level graph queries. Much of this was attributed to the memory-intensive architecture of the translator, but a large portion was attributed to overhead inherent in the Python 2.6 runtime.

We have undertaken developing a second-generation MQL translator written in Ocaml and drawing on a number of pure functional techniques. The core language translation process is expressed in terms of embedded language that implements the graph query protocol. This embedded language is used for both for static queries, e.g. for schema lookups, and for expressing the dynamic translation of MQL queries. The translator operates as a server and uses Lwt \(Lightweight Threads library [4]\) to interleave both client and graph database requests. A web services API and monitoring console have been developed using the Ocsigen web server and associated Eliom infrastructure [5].

The performance of our reimplemented MQL translator service is very encouraging. One process can sustain over an order of magnitude more simultaneous MQL requests, and service each request in a small fraction of the time consumed by the Python implementation. Moreover, due to the asynchronous nature of the underlying Lwt I/O subsystem, a single processor core can handle several times the capacity of an entire multi-core server machine running the former Apache/WSGI/Python [6] infrastructure.

In addition to describing the MQL translator system, I would like to discuss the underlying mechanism by which it batches fragments of I/O requests together into single larger protocol messages, thereby minimizing communication overhead with the underlying graph database. This technique closely resembles monads typically used in functional programming, but also provides some of the benefits of 'arrows' [7].

- [1] http://freebase.com
- [2] http://mql.freebaseapps.com/
- [3] http://research.freebase.com/sigmod692-meyer.pdf
- [4] http://ocsigen.org/lwt
- [5] http://ocsigen.org/eliom/
- [6] http://www.wsgi.org/wsgi/
- [7] http://www.cs.chalmers.se/~rjmh/Papers/arrows.pdf 
