- type: talk
- title: Haskell in the Misson Control Domain
- speakers: Michael Oswald

## Abstract 

Having been shaped by maintaining highly complex systems over vast
periods of time Space Industry is conservative by its very nature.
This does not seem to make it a likely candidate of adopting
Functional Programming. On the other hand omnipresent budget cuts and
pressure towards achieving higher levels of time efficiency in
implementing new systems have the potential of prompting novel
approaches to existing challenges. This presentation reports on
hands-on experience in successfully applying functional languages in
the Space Domain.

Space software systems show a tendency towards being overly complex,
incorporating code of a long ancestry line, which also leads to
maintenance issues and high irreducible error rates in the code base.
SCOS, the European Space Agency’s workhorse system for doing mission
control, is no exception to that. Furthermore SCOS is by itself an
example demonstrating that new, safe idioms as promoted by the C++
community, are widely ignored or had been unknown to the majority of
developers during its creation. In order to mitigate this, ESA decided
to take the Java approach, which has the potential to overcome at
least some shortcomings of C++. Nevertheless, first results don’t seem
to be very promising with respect to extensibility and maintainability
as well as the residual bug count.

Taking a different approach, Siemens CVC Austria and DLR (Deutsche
Zentrum für Luft- und Raumfahrt) embrace functional languages within
the Space Domain. For this purpose a prototype, yet fully functional
software system implementing a closed-loop testing tool for DLR’s
mission control system GECCOS (originally branched from SCOS) was
developed in Haskell, in order to evaluate the code development,
maintainability, and the residual error numbers. This proved to be a
success in terms of productivity, bug count, extensibility and also
user acknowledgement, such that additionally an additional tool (a
protocol bridge) was developed in Haskell. This presentation details
on the findings gained in these investigations and compares it with
traditional implementations in C++.