- type: talk
- title: Interfacing OCaml and Rust: picking the right tool for the job
- speakers: Joris Giovannangeli
- affiliations: Ahrefs

## Abstract 

At Ahrefs, we store a huge amount of data. With nearly 200B web-pages in index, our database contains a copy of the Web graph. Given the constant stream of updates, the size of our dataset imposes some challenging constraints on the implementation of data processing algorithms. When a complete processing pass can take several days to complete, it is critical to split the work into smaller tasks and order them by priority in order to minimize the number of out of date data-points. 

Due to the dynamic nature of the web, storing in memory as much information as possible offers several advantages. First, keeping state inside the program makes performance predictable and program states easier to reason by reducing interactions with the outside world. Second, in-memory immutable priority queues have good amortized complexity and simplified error handling. Third, through the option to access any previous state (and backtrack to it), a task scheduler interacting with other services in the network can reset to any combination of the previous state and keep in memory storage consistent. However, these features do not come without a cost. In addition to the already sizable amount of memory used by path duplication, the implementations of persistent queues make a heavy use of pointers, which account for an even larger amount of memory at scale, and the GC pressure induced by the high allocation rate increases the proportion of unreachable objects to be collected on the heap. 

Moreover, OCaml makes it hard to implement mutable space efficient data structures, with both value boxing and complexity in writing optimized low-level code. Rust, on the other hand, is designed for such a use case. Values are packed by default, the programmer is given thorough control of memory allocations and it comes with a powerful optimizing compiler. But there is a complexity price to pay for this power. 

Instead of dropping OCaml altogether, it is possible to combine the two in order to get the best of both world while minimizing friction via code generation and separation of concerns. In this talk, I will discuss our experience implementing a fast and space-efficient priority queue in Rust, and accessing it from OCaml. By wrapping states under an OCaml functional interface, we can keep the advantages of easily composable immutable queues, and try to retain some of the benefits we lost in error handling by recording state changes in a monadic interface for transparent commit/rollback semantics. 

This solution can be tedious, as binding two high level languages is not well supported and it is for now required to go through the C API, breaking all abstractions and type safety and making polymorphism hard. However,  careful separation can help to work around the pros and cons of each language while containing this problem's complexity.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/joris-giovannangeli.jpg" alt="Joris Giovannangeli"></img>
</div>
</div>

</div>
