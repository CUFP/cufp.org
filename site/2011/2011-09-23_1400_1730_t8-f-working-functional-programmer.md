- type: tutorial
- title: T8: F# for the Working Functional Programmer
- speakers: Michael Sperber
- affiliations: Active Group


## Abstract
F# is the functional language of choice for the .NET framework: Its
core resembles the core of OCaml, and its extensions over OCaml allow
direct access to the full .NET infrastructure.  Moreover, F# is a full
citizen of the language set of Visual Studio 2010\.  However, the
.NET/Visual Studio culture may sometimes seem a little alien to a
functional programmer coming from a different language: Some of the
terminology is subtly different, the documentation is sometimes hard
to navigate, and some programming choices are hard to make.  \("Classes
or sum types?"; "What unit testing framework?"; "WPF or Forms"? etc.\)

This tutorial is meant to bridge this gap: We'll go over the language
core quickly, and then cover some advanced topics relevant to the
working programmer, including:

- when and how to write native .NET types, classes, methods
- how to write unit tests and property-based tests
- casts and when to use them
- how asynchronous programming works
- concurrency, mailboxes and message passing

We'll do some hands-on exercises, and then you can be on your way,
hacking.

## Audience
Audience should be familiar with at least one other functional
language.

## Preparation
By far the most convenient way to follow the tutorial on your computer
is within Windows: Get a version of Visual Studio that works with F#.
F# ships with Visual Studio 2010, it works with the free Visual Studio
2010 Shell, and it can be installed as an add-on to Visual Studio
2008.

Details are on [Microsoft's F#
page](http://research.microsoft.com/en-us/um/cambridge/projects/fsharp/release.aspx).

If you must run F# outside Windows, you should get a recent version of
the *Mono* .NET-compatible run time from the [Mono download
page](http://www.go-mono.com/mono-downloads/download.html).  For Mac OS X, the latest version 2.10 is broken \- get the [slightly older version 2.8](http://download.mono-project.com/archive/2.8/download/).  If you're installing a Linux package of Mono or installing
from source, F# is probably not included: Check if there's a binary
`fsc` in the path after installation of Mono.

If you have Mono but *not* F# yet, get the F# distribution as a
`.zip` file from [Microsoft's F#
page](http://research.microsoft.com/en-us/um/cambridge/projects/fsharp/release.aspx).
Unzip it somewhere convenient, and run the
`install-mono.sh` shell script in the top-level directory.
(This will instruct you to download and install a key file.)
You should create front-end scripts `fsc` and
`fsi` in your path, that should look approximately like this:

```
# !/bin/sh
exec mono .../FSharp-2.0.0.0/bin/fsc.exe "$@"
```

(Replacing the `...` by the location where you unzipped the F# distribution.)

As to editing F# files outside of Visual Studio, it's probably best if
you bring a plain text editor that can indent without creating tabs.
If you know your way around Elisp, you may consider downloading and installing
the [F# Emacs Mode](http://sourceforge.net/projects/fsharp-mode/).

You may be tempted to download *MonoDevelop* and install the F# plugin,
but you need versions of Mono, MonoDevelop and the F# plugin \(not the
latest\) that are just right.  This is probably not worth the effort.

Finally, you'll also need the *NUnit unit-testing framework*, which
can be downloaded from [NUnit's download
page](http://www.nunit.org/index.php?p=download).

## Mike Sperber
is a software architect with Active Group in Filderstadt, Germany.
He's done research on functional programmince since 1995, and has used
functional programming in a wide variety commercial projects since

1. Mike designed the introductory programming curriculum at
the University of Tübingen \(which is based on functional programming,
of course\), which he still occasionally teaches.  He is the author of
several textbooks, was the project editor of the R6RS standard for the
programming language Scheme, and is a member of the CUFP Steering
committee.
