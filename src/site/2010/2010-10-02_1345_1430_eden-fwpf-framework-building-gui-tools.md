- type: talk
- title: Eden: An F#/WPF framework for building GUI tools
- speakers: Howard Mansell
- affiliations: Credit Suisse


## Abstract
Our group within Credit Suisse is responsible for developing
quantitative models used to value financial products within the
Securities Division of the bank. One aspect of this role is to deliver
tools based on those models to trading and sales staff, which they can
use to quickly price proposed transactions and perform other analysis of
market conditions.  Historically these tools have been delivered as
Excel spreadsheets.

WPF \(Windows Presentation Foundation\) is a GUI framework which
encourages architectural separation between the layout of the user
interface itself \(the "View"\) and the underlying interactions and
calculations \(the "ViewModel" and "Model"\).  We have built a framework
for developing tools in WPF that makes use of a graph-based calculation
engine for implementing ViewModels and Models in F#. The engine is built
on F# asynchronous workflows and provides a standard set of features to
our tools. In this talk I'll discuss the implementation of this
calculation engine, including various steps in its evolution that led up
to our use of asynchronous workflows. I'll also talk about how well F#
and asynchronous workflows have worked for us, and briefly discuss some
of the challenges of integrating F# and WPF.
