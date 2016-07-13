- type: tutorial
- title: Transforming data into GUI: a new style graphical user interface library for Haskell
- speakers: Fumiaki Kinoshita

## Abstract
Today Haskell is widely used as a programming language which both supports functional and imperative programming with monads.
There are some Haskell bindings for GUI toolkits. They allows us to develop GUI applications in Haskell, however, the abstractions often discord with the programming style of Haskell. Also, the bindings tend to be difficult to install.

In this turorial, I introduce jugendstil, a new cross-platform GUI library originally designed for data visualization.
This is neither a binding for a GUI toolkit nor a re-implementation of an existing framework, but is a new style library implemented purely in Haskell.
Jugendstil provides highly composable expression of GUI components; with jugendstil you can create a GUI application by just writing a function from data into a combination of GUI components. You don't have to rely on a particular state management framework (e.g. an FRP library) in order to use jugendstil.
I will demonstrate how to use make applications on jugendstil and how the states are managed, using some practical examples.

## Tutorial objectives
* Create a simple interactive data visualization application.
* Learn a few state management techniques in Haskell.

## Target audience
Haskell users who have basic knowledge of lens

## Infrastructure Required
* A computer with GHC 7.10 or later installed
* A graphic driver that supports OpenGL 3.x
* cabal or stack

## Speaker Bio
Fumiaki Kinoshita is a composer at Tsuru Capital, interested in utilizing abstract concepts for practical use.
