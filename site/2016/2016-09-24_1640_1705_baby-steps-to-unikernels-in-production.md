- type: talk
- title: Baby steps to unikernels in production
- speakers: Sean Grove
- affiliations: Bushido
- video: https://www.youtube.com/watch?v=i9eu9e7gN0Q

## Abstract 

Unikernels are an exciting new take on applications design and deployment. OCaml has been quietly forging ahead in the area with libraries like Mirage, whereby we can generate apps that operate at such a low level we don't even need operating systems on the backend anymore (removing 15 *million* lines of memory-unsafe code) - while at the same time, maintaining more reliable software with less effort through lightweight type-checked code sharing between server, browser clients, & native mobile apps.

While much theory and effort has been put into building the basis of Mirage, deploying unikernels into production (whether on public clouds or private servers) remains a very artisanal experience. In the talk we'll look at how the properties of Mirage unikernel enable us to rethink large sections of the app development lifecycle (apps that are MBs in size and boot in 50 milliseconds!), and also look at a case study of what it takes to move said unikernels to production with reliable testing, deployment, monitoring, and debug tooling.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/sean-grove.jpg" alt="Sean Grove"></img>
</div>
</div>

<div class="content" media:type="text/omd">
### Sean Grove 
Sean’s been convinced there are better ways to develop applications across the stack for years, and built time-traveling debuggers, interface builders, layout tools, and graphic design tools in his quest to explore the space. His company was the first to deploy ClojureScript's Om library (a functional approach to building UI's using ReactJS and immutable datastructures) to a production app in early 2014. He also helped lay the architecture for CircleCI's open-source frontend app and [https://www.precursorapp.com](https://www.precursorapp.com).
</div>
</div>
