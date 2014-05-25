- type: tutorial
- title: Scala Primer
- speakers: Heiko Seeberger
- affiliations: Typesafe


## Abstract
This tutorial will introduce you to the Scala. It is intended to enable
experienced developers to confidently start programming in Scala. No previous knowledge of Scala is assumed. Although intense, the course ensures you will have a solid understanding of the fundamentals of the language and the tooling.

## Content
After having participated in this course you should

- be a competent user of Scala constructs in application code
- know and be able to apply the functional programming style in Scala
- know how to use the fundamental Scala tools
- be confident to start using Scala in production applications

## Prerequisites
The presentation will frequently be mixed with hands-on exercises that
give you a good opportunity to try what you have learnt and a chance to
clarify your understanding.

## Preparation
Please bring a laptop to the tutorial. Ideally, you should install the
required software on your laptop *before the tutorial*. If that fails,
we'll have a machine on-site for you to connect to.  In that case,
make sure to have an
[RDP](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol) client \(a
client for Microsoft's Remote Desktop protocol\) installed on your
laptop, so you can connect to our on-site machine.

If you have problems or questions, please contact Mike Sperber \(sperber\(at\)deinprogramm\(dot\)de\).

### Installing the prerequisite software
You will need a machine with Java 6 installed.

- Install the [TypeSafe Stack](http://www.typesafe.com/stack/download).
- Verify Verify the installation by opening a terminal and entering `scala -version`:


<pre>
Scala code runner version 2.9.2 -- Copyright 2002-2011, LAMP/EPFL
</pre>
+     Download and install [Eclipse 3.7 \(Indigo\)](http://www.eclipse.org/downloads/packages/release/indigo/sr2) for your platform.

+     Install the Scala plugin Special Edition for Scala 2.10.0-M5 with the menu "Help > Install New Software ...".

+     Use the following update site: `http://download.scala-ide.org/releases-210/milestone/site`.

+     Verify the installation by opening a fresh workspace, e.g. `~/workspaces/training-scala`, and switching to the Scala perspective.

+     Create a directory `~/.sbt/plugins` via the command


<pre>
mkdir -p ~/.sbt/plugins
</pre>
- Create a file `plugins.sbt` in the directory `~/.sbt/plugins` with the following contents:


<pre>
addSbtPlugin(
  "com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.1.0"
)
</pre>
+     In an `sbt` session, execute the `eclipse` command, which should produce the following output:

+     In Eclipse, import the new Eclipse project with the menu "Import ... > Existing Projects into Workspace".

+     Use the giter8 template `typesafehub/training-ftts` to create the case study project via the following command:


<pre>
g8 typesafehub/training-ftts
</pre>
- Accept the default name `scalanetworks` with the ENTER key.
- `cd` into the new `scalanetworks` directory.
- Start `sbt` and ceate an Eclipse project with the `eclipse` command.  This should produce the following output:


<pre>
[info] Successfully created Eclipse project files ...
</pre>
- Import the case study project into your Eclipse workspace.

## Heiko Seeberger
<img align="right" src="/sites/all/files/speaker-portraits/heiko-seeberger-portrait.jpg" alt="Heiko Seeberger"></img>

Heiko Seeberger is the Director Professional Services at Typesafe. He
has been a Scala enthusiast ever since he came to know this beautiful
language in 2008\. He has more than ten years of professional expertise
in consulting and software development on the Java platform, actively
contributes to Scala community projects and regularly shares his
expertise in articles and talks. Heiko is the main author of the German
Scala book "Durchstarten mit Scala".
