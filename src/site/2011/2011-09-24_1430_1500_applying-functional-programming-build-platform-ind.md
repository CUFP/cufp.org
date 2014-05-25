- type: talk
- title: Applying Functional Programming to Build Platform-Independent Mobile Applications
- speakers: Adam Granicz
- affiliations: IntelliFactory
- video: https://www.youtube.com/watch?v=e8EM_L4Wj1U

## Abstract
Native mobile applications enjoyed tremendous success in recent years, and looking at various mobile application stores such as Apple's App Store or Google's Android Market reveals a staggering number of native mobile applications. As technologies to build these applications mature and the market saturates, mobile OS vendors are struggling to find ways to keep up with and secure the exponential market growth.  Inhibiting factors include platform-specific development environments, programming languages, and building blocks for applications; developer-unfriendly licensing, policies and subscriptions; and controlled channels of application distribution.

These problems have given rise to many promising alternatives and technologies that aim to bridge across various mobile platforms and enable sharing some or all the code in between versions of applications for different mobile OSs. Two main directions unfolded: targeting mobile code generation from mainstream languages such as C# and Java, and embracing web applications with platform-independent UI abstractions and enhanced access to the capabilities of the underlying device. While the technologies that enabled the former are an interesting topic, we believe that the latter has implications not only for mobile applications but also for their desktop counterparts, and finding ways to utilize functional programming in the development of these web-based applications has an immense impact on mobiles and desktops alike.

In this talk I will highlight some of the work we are doing at IntelliFactory to enable building platform-independent mobile applications in F#. This work leverages our commercially available WebSharper framework, the premiere functional web development framework for F# with thousands of active users and partner companies, and utilizes some key functional programming abstractions that enable modeling first-class, type-safe, composable web applications and user interfaces. I will briefly outline the metaprogramming infrastructure that enables us to enlist arbitrary JavaScript libraries into the type-safe discipline of F#, and the underlying CoreJS language that is more amenable to reasoning about and applying code transformations and optimizations. 

 At the end of the talk, I will briefly touch upon our upcoming F# in the Cloud support and how that helps to seamlessly scale into the cloud desktop and mobile web applications with immense server computation needs.
