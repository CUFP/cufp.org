- type: talk
- title: Fourteen Days of Haskell: A Real Time Programming Project in Real Time
- speakers: Gregory Wright
- affiliations: Alcatel-Lucent
- video: https://www.youtube.com/watch?v=ra_pdIMdFaA

## Abstract
For a long time it has been believed that functional programming should be suited to dataflow computations, like those in signal processing and communication systems.  But there have been few concrete examples of it being used in these applications.
This talk describes a project that used functional programming to build the core of a real time communication system.  It was built by the GreenTouch consortium, an organization of telecommunication equipment vendors, service providers, universities and research institutes to show a new antenna technology that could reduce the energy used by wireless networks.  The goal of the project was to demonstrate an algorithm that reduces radio transmit power as the number of base station antenna elements is increased, and is capable of scaling to antennas with thousands of elements.

The heart of the demonstration system is a narrowband software radio, written in Haskell and running in \(soft\) real-time. Not only did the software have to run in real time, but it had to be written very quickly.  The project, from the beginning specification to delivery of hardware, took just over three months.  I will walk through the timeline of writing the software, and tell how the data acquisition, signal processing and data display were put together within two weeks.

Of particular interest is how the control structures of Haskell were used to lash the pieces together.  Lazy lists and software transactional memory turned out to be an architecturally simple way to have the component modules communicate.  Using sophisticated control structures of Haskell to abstract away the complexity of the data path was a big win, and was key to getting the job done within the allotted time.

The demonstration system was a success and was shown to the public at a press event in London in early February 2011.
