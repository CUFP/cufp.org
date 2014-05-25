- type: talk
- title: Developing Medical Software in Scala and Haskell
- speakers: Stefan Wehr
- affiliations: factis research
- video: https://www.youtube.com/watch?v=YTmnrA1fPKM

## Abstract
Scala and Haskell are two prominent functional programming
languages. There are many similarities between the two languages making it
easy to transfer design and implementation concepts from one language to
the other. However, there are also enough differences that make up for an
interesting comparison between them.

This talks reports on our experience with developing real-world,
commercial software in Scala and Haskell. It outlines strengths and
weaknesses of both languages that we encountered while developing a
medical software product, it draws a comparison from our perspective, and
it gives a particular example showing how to share design and
implementation ideas between the two languages.

Our company develops mobile applications targeting the medical market, the
main product being an electronic health record running on the iPad. The
software provides doctors mobile access to all relevant medical
information such as images, letters, surgery reports, and patient
data. The software architecture of the product consists of an iPad
application and several server components for data synchronization and
data import. The server components are exclusively written in Scala
\(~37,000 loc\) and Haskell \(~69,000 loc\). Development of the product
started in March 2010, so we had more than two years to learn our lessons
before sharing our experience in this talk.

## Stefan Wehr
Stefan Wehr works as a software architect and developer for factis
research GmbH, a small company specializing on mobile software
solutions. He has more than ten years of experience with functional
programming languages. In 2010, Stefan received his PhD with a
dissertation on the integration of functional features into the
object-oriented language Java.
