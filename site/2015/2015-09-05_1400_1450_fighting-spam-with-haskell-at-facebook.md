- type: talk
- title: Fighting spam with Haskell at Facebook
- speakers: Simon Marlow
- affiliations: Facebook 
- video: https://www.youtube.com/watch?v=IOEGfnjh92o

## Abstract 

One of Facebook's most important weapons in the fight against spam, malware, and other abuse is a system called Sigma. Sigma's job is to answer the question, for every action taken on Facebook, "is this action malicious?", where "malicious" includes spam, phishing attacks, posting URLs to malware, and so on. All of the bad content detected by Sigma is removed automatically so it doesn't show up in your newsfeed. Sigma is one of the largest services inside Facebook: it runs on thousands of machines and serves over a million requests per second.

Over the last two years we have been working on a major redesign of Sigma, which involved replacing the in-house FXL language previously used to program Sigma with Haskell. We recently completed the migration, and the Haskell-powered Sigma is now running in production; we believe this is the largest Haskell deployment in existence. Our codebase includes hundreds of thousands of lines of Haskell, and the spam-fighting team at Facebook, which runs to dozens of engineers, is now using Haskell day-to-day.

This was a long and complex migration, with many ups and downs. In the talk I'd like to explain what led us to choose Haskell, and share some of the experiences and lessons we've learned along the way.

## Simon Marlow 
<div class="row" media:type="text/omd">

<div class="medium-4 columns">
<img src="img/simon-marlow.jpg" alt="Simon Marlow"></img>
</div>

<div class="medium-8 columns" media:type="text/omd">
Simon Marlow is a Software Engineer on Facebook's Site Integrity Infrastructure team in London. He is working on Haxl, a Haskell-based domain-specific language that is used by the teams fighting spam and malware. Simon is a co-author of the Glasgow Haskell Compiler, author of the book "Parallel and Concurrent Programming in Haskell", and has a string of research publications in functional programming, language design, compilers, and language implementation.
</div>
</div>
