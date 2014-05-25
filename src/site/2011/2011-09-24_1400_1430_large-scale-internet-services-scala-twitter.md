- type: talk
- title: Large-scale Internet Services in Scala at Twitter
- speakers: Wilhelm Bierbaum, Steve Jenson
- affiliations: Twitter, Twitter
- video: https://www.youtube.com/watch?v=scGFXipq8bw

## Abstract
We discuss our experiences designing, implementing, and running large-scale internet services in Scala. These services handle over 100,000 requests per second and Scala is involved in every tweet sent. 
We'll present three case studies of systems design in Scala.

- A stateless service for inspecting and routing traffic. 
- Long-lived, stateful services for caching tweets and processing  vector and graph data.
- A reliable, high throughput message queue with disk journaling.

We'll discuss features of Scala that lend themselves to building these systems. Namely, the benefits of Scala's rich type system, lazy evaluation, higher-order functions, immutability, and ease of integration with existing Java libraries and tools.

Additionally, we'll cover some challenges we've faced in adopting Scala. 
