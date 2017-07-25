- type: talk
- title: Using Functional Programming to Accelerate Translational Research at Pfizer
- speakers: Austin Huang
- affiliations: Pfizer

## Abstract

Biopharmaceutical research is an incredibly resource-intensive endeavor. The task of pharmaceutical R&D organizations is to perform translational research, specifically, to integrate data and knowledge of human biology in order to create new treatments for disease.

This requires iterating from an initial, broad category of biological hypotheses towards an increasingly narrower set of high-confidence biological mechanisms and associated treatments. These iterations require combining many sources of information to design and interpret experiments while making decisions as to which biological mechanisms are most likely to be efficacious. Progressing a treatment through the development pipeline spans a multi-year development cycle and culminates in clinical studies that determine the success or failure of a proposed treatment.

One key challenge for translational research is that it draws upon disparate sources of information, including genomics, experiments from animal models, public data repositories, high throughput experiments, and high dimensional measurements of biomarkers. Data sources are in many locations and in a variety of formats and adhoc schemas, making mere acquisition and integration of this data often a rate-limiting step of research. Contextualizing heterogeneous data into persisted datasets requires a large amount of upfront work. Analyses are often one-off, resulting in having to consider two suboptimal choices – delaying time-sensitive analyses due to over-engineering or failing to aggregate persisted data resources that offer potential institutional value in the longer term.

We used functional programming technologies to accelerate the core computational workflows involved in the many data integration needs of translational research. Our goal was to build a platform that automates many steps of the process for scientists who are domain experts but have little training in data management tools. The key to success was the idea of declarative programming at all stages of the workflow. The first stage is data acquisition, where we dynamically infer a declarative specification of the shape of the incoming data (schemas) that is streamed in, with little to no annotations from the scientist. These inferred schemas are then useful for scientists to make sense of the data and build effective queries. We further automate access to this data by dynamically generating REST endpoints that can be queried conveniently from any of the many programming languages in use by scientists today (R, Python, and Ruby). The content of data sources is versioned and the metadata curated via programmatic ontological annotations. Scientists are then able to reason about a priori unknown relationships between disparate data sources. Finally, we built a browser-based interface for identifying and curating datasets.

While biopharma is an unusual setting for this, we used functional programming technologies at all levels of the stack, from Haskell for efficiently streaming data into our platform, to GHCJS to rapidly iterate on a web interface that our users find effective, as well as reusing functional data query DSL's in R (dplyr) and other languages. We developed technologies inspired by functional programming itself, such as type inference, immutability, and logical relationship inference from the data we acquire. Overall we found functional programming methodologies were a good fit for the data analysis needs and rapid iteration requirements of translational research.

<div class="author media" media:type="text/omd">

<div class="image">
<div class="avatar">
<img src="img/austin-huang.jpg" alt="Austin Huang"></img>
</div>
</div>

</div>
