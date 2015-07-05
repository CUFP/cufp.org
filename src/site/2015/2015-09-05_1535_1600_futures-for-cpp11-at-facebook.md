- type: talk
- title: Futures for C++11 at Facebook 
- speakers: Hans Fugal 
- affiliations: Facebook 

## Abstract 

The Future (Promise) monad expresses asynchronous computation, e.g. "fetch this data, then post-process it, then reduce it". It is a popular pattern in various (semi)functional languages, such as Scala and JavaScript.

We at Facebook saw the utility of this pattern and wished to apply it in our C++ codebase. C++11 has std::future but it does not allow chaining; it is not monadic. So we wrote our own implementation, modeled after Twitter's futures (as used in Finagle)(1) and taking boost::future(2) and C++ standard proposal N3428(3) into consideration. We have open sourced it as part of Folly(4).

We will talk about implementing this pattern in C++ and in the Facebook environment. Various details of C++ have complicating implications that are not apparent at first blush when considering implementing this pattern. For example: polymorphism requirements, heap object lifetime, move semantics, and underpowered templates. Facebook developers demand extreme performance, clean and expressive syntax that fully leverages new C++11 features, and full control over execution context and flow between threads (with sensible defaults). We also strived to make it as frictionless as possible to migrate legacy synchronous code to be asynchronous using Futures, with an eye toward parallelizing the embarrassingly parallel sections of that code.

With the flurry of new functional features in C++11, C++ developers are starting to embrace functional idioms, but are also slow to let go of imperative habits. As we have helped C++ developers utilize this pattern we have seen recurrent pitfalls, compromises, and a-ha moments.

We will speak about the Folly Futures implementation, what challenges and tradeoffs we found due to C++ and Facebook developer culture, and how the pattern has been received and how it has paid off for us.

1. https://twitter.github.io/finagle/guide/Futures.html
2. http://www.boost.org/doc/libs/1_53_0/doc/html/thread/synchronization.html#thread.synchronization.futures
3. http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2012/n3428.pdf
4. https://github.com/facebook/folly/blob/master/folly/futures/README.md
5. https://code.facebook.com/posts/1661982097368498

## Hans Fugal 
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/hans-fugal.jpg" alt="Hans Fugal"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
</div>
Hans Fugal is a software engineer at Facebook. He has worked on memcache and mcrouter, datacenter QoS, and now asynchronous APIs. Before Facebook he was a computer music PhD student and VOIP consultant. He enjoys exploring languages, trying to make C++ pretend to be like those languages, and hopes to some day really grok functional programming.
</div>
