- type: talk
- title: The First Substantial Line of Business Application in F#
- speakers: Adam Granicz, Alex Peake
- affiliations: IntelliFactory, Veracentra
- slides: /archive/2009/slides/PeakeGranicz.pdf
- video: http://vimeo.com/6700412

## Abstract
We have developed MarketingPlatform<sup>\(tm\)</sup> a marketing automation solution delivered as Software as a Service with F# as the primary language. MarketingPlatform<sup>\(tm\)</sup> is a solution for marketers in direct marketing and in channel marketing who would like to gain a timely and deep understanding of what is working and what is not working in their marketing campaigns. Marketers are than facilitated in the execution and delivery of campaigns, using this insight to create relevant communications to each individual. It is divided into four tightly integrated campaign management steps of Measure, Analyze, Design and Execute.

**Measure:** How well are my campaigns working? Are they meeting the goals?

**Analyze:**  Why are the campaigns exceeding goals, or falling short of goals? What sub-segments are worthy of further communications with?

**Design:** Create communications that are relevant to each individual, driven by the data and insight gained from measurement and analysis.

**Execute:** Deliver the communications through the most appropriate channels, including email, print and mail, texting and purls.

Why did TFC management choose F#?

F# is a functional language with first class functions and composability, a pattern matching language and strongly typed. At the same time it as a .NET CLR language, fully interoperable with the vast libraries, and fully capable of OOP. So we believed that we would get the best of both worlds — a modern productive language and a full set of libraries to build on. The product is in the market and selling well, so we were rewarded by our decisions. Where was F# applied within the application, and where not?

Most of the business logic was implemented in F#, as was most of the data handling. C# was retained for building the ASP.NET user interface, just because the F# tool support is not there yet.

What were the development benefits?

The application was developed in less time with significantly less code — probably a quarter. The code is more readable and easier to adapt as new market requirements come in.

What were the business benefits?

We were able to get to market much sooner with more feature, and the overall cost of the development was significantly lower.

**Conclusion:** F# is an excellent language for line of business applications. It somewhat shortens the development cycle and greatly shortens the enhancement cycle.
