- type: talk
- title: Building a web application with continuation monads
- speakers: Seitaro Yuki
- affiliations: Dwango

## Abstract 

Niconico is a video sharing and a live streaming platform operated by Dwango.
Dwango uses Scala widely for foundation systems such as an account system, a billing system and an event bus for inter-services.
In this talk, we will introduce how to build web applications by using continuation monads.
This approach is mainly used in the Niconico account system.

The Niconico account system has the following requirements:

- Various requests
  - Various user registration leads
  - OAuth logins (Google, Facebook, Twitter, etc.)
  - Multi-factor authentication

- Various responses
  - HTML Pages (in Japanese, English and Chinese)
  - JSON and XML
  - Redirects

- Various filterings
  - CSRF check
  - Add CORS headers
  - User tracking

The Niconico account system is developed with Play framework which is one of the most popular web framework in Scala.
[Play framework](https://www.playframework.com/documentation/2.5.x/ScalaActionsComposition) has component technologies for building web applications.
But the composition functionality of Play framework is insufficient to our requirements.
Therefore, we decided to use components of continuation monads instead of the standard technique of Play framework.
We believe that our approach can also be applied to other languages,
because a web framework often has similar nested structures such as Java Servlet, Python WSGI, and so on.

This talk will be a detailed explanation of the [topic presented](http://www.slideshare.net/hexx/scalamatsuri-2016-scala) at [ScalaMatsuri 2016](http://2016.scalamatsuri.org/index_en.html).

Our prototype implementation has been published on [GitHub](https://github.com/hexx/action-cont).

## Seitaro Yuki

<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/seitaro-yuki.jpg" alt="Seitaro Yuki"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Seitaro Yuki is a software engineer on the Niconico account team at Dwango.
He is the co-author of the Scala textbook for training in Dwango (available at [https://github.com/dwango/scala_text](https://github.com/dwango/scala_text)).
He got his MS in Computer Science from the University of Tsukuba, focusing on term rewriting systems.
He is interested in an application of functional programming to solve real world problems.
</div>
</div>
