- type: tutorial
- title: T5: Erlang Web frameworks
- speakers: Steve Vinoski


## Abstract
Erlang started life nearly thirty years ago as part of an effort to
find more effective ways of developing highly concurrent, highly
reliable telecommunications systems. Fortunately, we've found that its
concurrency and reliability capabilities are just as valuable in other
domains as well, especially web development. This tutorial will
explore several Erlang web servers, including Yaws and Mochiweb, and
will examine the Nitrogen, Webmachine, and Chicago Boss Erlang web
frameworks. Each web server and framework provides different features
and capabilities, allowing them to address different portions of the
vast web development landscape.

Attendees should possess a basic knowledge of HTTP, HTML, and JSON. Some
prior knowledge of Erlang is preferred but not required, as the tutorial
also includes an overview of Erlang. Participants will gain deeper
knowledge of the basics of Erlang web development, will learn how to use
specific features of different Erlang web servers and frameworks, and
acquire a better understanding of which servers and frameworks to apply to
different kinds of web development problems.

## Preparations
The examples in this tutorial are designed for a UNIX-style system, so
if possible please bring a system running Linux, OS X, or some other
UNIX variant. Users of non-UNIX systems are welcome to attend the
tutorial, of course, but running the tutorial examples on those
systems will likely be difficult.

In addition, please ensure your system has the following:

1. Please install Erlang, preferably version R16B01 which you can
 retrieve from [this page](https://www.erlang-solutions.com/downloads/download-erlang-otp).

Binary installations from the above link are easiest, but you can
choose to install from source instead if you wish. Either way, please
make sure Erlang is installed such that it's available in your
PATH. Please do not install Erlang from typical OS-specific
repositories as their versions tend to be out of date and incorrectly
built.

1. Please download the tarball of tutorial examples from [here](http://bit.ly/14K6AvG) and unpack it somewhere on your system.

2. Please ensure you have the "make" development tool on your system.

3. You will also need the `curl` and `netcat` tools on your system. For example, OS X comes with these preinstalled in `/usr/bin/curl` and `/usr/bin/nc` respectively. Linux installations tend to have them as already installed as well, but if not, they're common and easy to find.


## Steve Vinoski
<img align="right" src="/sites/all/files/speaker-portraits/steve-vinoski-portrait.jpg" alt="Steve Vinoski"\</img\>

Steve Vinoski is an architect at Basho Technologies, Cambridge, MA,
USA. He's been a committer on the Yaws web server project since
2008. Steve has been writing "The Functional Web" column, in which he
explores the application of functional programming languages and
techniques to web development, for the IEEE Internet Computing
magazine since 2009. He's also written several other articles about
REST and HTTP over the past decade.
