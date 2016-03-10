- type: talk
- title: The Big Board:  Teleconferencing over High-res Maps with Haskell
- speakers: Jefferson Heard
- affiliations: Veracentra
- slides: /archive/2009/slides/HeardJeff.pdf
- video: http://vimeo.com/6701254

## Abstract
A public emergency is the ultimate example of multitasking and collaboration over a wide area. Crowd control, first aid, fire, police, and search and rescue teams all have to provide a timely and coordinated response to save lives and property. This requires situational awareness, meaning that emergency managers know what and where their resources are on the ground, and what the ground's features are. Managers who direct emergency operations centers have few technological tools to help them with these complicated, critical tasks. They are, in fact, still largely paper based.

The Big Board aids in filling this technological gap by providing aerial photography, facility for dynamic, geo-referenced content creation, and a mechanism for simulcasting the content to everyone participating in the management of an emergency. The goal is that it should give emergency managers a reliable and flexible way to coordinate on their most natural medium \(maps\), be as easy to use as pen and paper, quick to train a new user on, and able to run in many environments, some quite technologically out of date.

In The Big Board, users open a map, join a virtual conference room, and then can collaboratively mark up the map with paths, polygons, and placemarks and add content behind these using a wiki that is generated as part of every conference room. As they mark up the map, their annotations are simulcasted to everyone else in the same conference room. Additionally, web-services serving geo-referenced content can be integrated onto the map to overlay things such as real-time vehicle location and sensor data.

This application has been written from the ground up in Haskell, with a PostGIS backend. Haskell was chosen for its laziness, reliability of applications written in it, rapid development, multicore scalability, and native compilation. In this presentation I will describe:

- The Big Board, who's using it, and where we're going with it.
- The requirements of it, and how Haskell fulfills these   requirements better than the alternatives.
- A high level overview of the application's structure.
- The challenges and advantages of functional design in such a large application.
- How the design led naturally to two reusable, publicly available libraries now in Hackage: Buster \(FRP for application orchestration\) and Hieroglyph \(for functional 2D vector-graphics\).

I will also give a demonstration of the application running, showing how it can be used to coordinate a disaster response.
