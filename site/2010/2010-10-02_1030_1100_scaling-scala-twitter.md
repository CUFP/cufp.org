- type: talk
- title: Scaling Scala at Twitter
- speakers: Marius Eriksen
- affiliations: Twitter
- video: http://vimeo.com/16753839

## Abstract
Rockdove is the backend service that powers the geospatial features on
Twitter.com and the Twitter API \("Twitter Places"\). It provides a
datastore for places and a geospatial search engine to find them. To
throw out some buzzwords, it is:

- a distributed system
- realtime \(immediately indexes updates and changes\)
- horizontally scalable
- fault tolerant

Rockdove is written entirely in Scala and was developed by 2 engineers
with no prior Scala experience \(nor with Java or the JVM\). We think
the geospatial search engine provides an interesting case study as it
presents a mix of algorithm problems and "classic" scaling and
optimization issues. We will report on our experience using Scala,
focusing especially on:

- "functional" systems design
- concurrency and parallelism
- using a "research language" in practice
- when, where and why we turned the "functional dial"
- avoiding mutable state
