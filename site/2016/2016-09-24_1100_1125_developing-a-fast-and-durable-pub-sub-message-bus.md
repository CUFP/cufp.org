- type: talk
- title: Developing a fast and durable pub/sub message bus
- speakers: Will Sewell
- affiliations: Pusher

## Abstract 

Over the past year at [Pusher](https://pusher.com/), we have been using Haskell to write a new message bus for our core pubsub system. 
 
Customers currently send more than 50,000 messages per second through our existing system and we aim to keep latency below 50ms. This means we have hard requirements on the performance of the new system. On top of this we want to provide durability guarantees in the face of failovers and client disconnections. 
 
In this talk I will describe our experience with using Haskell for this problem.
 
On the one hand we found Haskell's type system and testing capabilities excellent for writing reliable production software. As an example of this you can read about how we used QuickCheck to test our raft implementation [here](https://blog.pusher.com/fuzz-testing-distributed-systems-with-quickcheck/).
 
On the other hand we encountered challenges when attempting to optimise for high throughput and low latency. The most fundamental of these problems was the length of GC pauses when there was a large working set in memory. You can read more about this in [James Fisher's blog post here](https://blog.pusher.com/latency-working-set-ghc-gc-pick-two/).

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/will-sewell.jpg" alt="Will Sewell"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Will Sewell
Will is a platform engineer at Pusher. He helps keep the realtime messaging system ticking along smoothly. He is a strong believer in the advantages that functional programming languages can bring to industry, and is interested in the challenges that need to be solved in order to get wider adoption: performance issues, the ecosystem, and lowering the barrier to entry.

He writes (mostly) about Haskell on the [Pusher blog](https://blog.pusher.com/author/will/).
</div>
</div>
