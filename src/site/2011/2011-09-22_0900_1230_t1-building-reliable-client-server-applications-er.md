- type: tutorial
- title: T1: Building Reliable Client-Server Applications in Erlang
- speakers: Francesco Cesarini
- affiliations: Erlang Solutions Ltd.


## Basic & Sequential Erlang:
This section deals with Erlang data types and pattern
matching. Functions, and modules are discussed. It continues by
introducing recursion, with a special emphasis on different recursive
patterns, including tail recursion.

## Concurrent Programming
This section describes the creation of processes and their life
span. It looks at sending and receiving messages, selective reception,
and passing data in the messages. It continues with the various uses
of time outs and registering processes, and terminates by showing the
generic process code structure. We conclude this section by
introducing the simple but powerful error handling mechanisms in
processes. It looks at process links, exit signals and their
propagation semantics.

Generic Servers and Supervisors This section introduces the <code>OTPdesign</code>
patterns commonly referred to as generic servers and supervisors. We
give an example of a client server application written in Erlang,
migrating it to a system using the <code>gen_server</code> behaviour libraries. We
wrap up this section by demonstrating how to place the server we've
just written in a supervision tree.

## Audience
Attendees who will benefit from this tutorial includes those want to
learn more about Erlang and its concurrency model. Attending will put
you on the right track in building distributed, fault tolerant
massively concurrent soft real-time systems.

In order to get the most out of this tutorial, you must have a good
grasp of other programming languages. Having dabbled with
[<code>http://tryerlang.org</code>](http://tryerlang.org) is not necessary, but will help.

## Preparation
We will have a lot of material to cover in a
short time, so the more prepared you are, the better. To be able to
attend the tutorial, you must have Erlang working alongside your
favorite editor. You can download binary snapshots of the distro
[here](http://www.erlang-solutions.com/section/98/downloads).

If you prefer to compile from source, you can download it
[here](http://www.erlang.org/download.html).

It would be beneficial if you can get the Erlang mode running on your
favorite editor. The most commonly used editors include emacs and vim,
but you will find an Erlang support in most environments.

If you have time to dabble with Erlang, a great site with simple
tutorials is [tryerlang](http://www.tryerlang.org).

If you do not have one of the Erlang books, online resources where you
can read more about Erlang include

- [Learn You Some Erlang for Great Good!](http://learnyousomeerlang.com/)
- The [User's Guide](http://www.erlang.org/doc/getting_started/users_guide.html)

If you have any questions, do not hesitate to 
[email me](mailto:francesco@erlang-solutions.com).

## Francesco Cesarini
is Technical Director of Erlang Solutions Ltd, a company specialised
in high availability, massively concurrent soft real time systems. He
has been programming Erlang since 1995 and was on the team who worked
on the OTP R1 release. Francesco has worked with start-ups and blue
chip companies alike helping them with all the aspects of Erlang based
projects \- from coding, reviews and architecture designs to setting up
development centers. He has taught Erlang to hundreds of developers,
testers, support staff and university students.He documented these
experiences in Erlang Programming, a book published by O'Reilly Media
in 2009\. Francesco is also a frequent speaker at conferences worldwide
and teaches graduates and undergraduates at the IT University of
Gothenburg in Sweden and Oxford University in the UK.
