- type: talk
- title: FMD - Functional development in Excel
- speakers: Lee Benfield
- affiliations: Barclays Capital
- slides: /archive/2009/slides/BenfieldLee.ppt
- video: http://vimeo.com/6699275

## Abstract
Barclays Capital, like many other investment banks, uses Microsoft Excel as a rapid application development environment for pricing models and other tools.  While this may sound bizarre, Excel's flexibility and convenience renders it an immensely useful tool for the Front Office, and our Traders are extremely Excel literate.

Excel combines two programming models

- a zeroth order functional language \(the spreadsheet\)
- an imperative programming language \(Visual Basic for Applications\)

The functional model allows very rapid development and great transparency, but the limitations of Excel's built-in functions drives developers to use VBA. Soon the spreadsheet dependency graph is lost and the spreadsheet layer is relegated to a GUI on top of tens/hundreds of thousands of lines of VBA. The logic is tightly tied to Excel, and a server-side implementation involves a complete rewrite in another language, which carries both operational risk and developmental cost.

FMD \(‘Functional Model Deployment’\) prevents these problems by embedding a functional language cleanly into Excel, effectively extending Excel to be a higher order functional environment.  Now complex models can be developed without leaving the pure spreadsheet domain:

**Before**

1. Limited built-in functions need to be extended with add-ins or VBA.
2. Boilerplate code needs to be written to import libraries.  
3. Systems need to be rewritten to run outside Excel. \(typically ported to C++ / C\# back end\)

**After**

1. Functions can be defined on-the-fly without leaving the pure spreadsheet side.
2. Dynamic and data-driven wrappers make external libraries directly visible.
3. Spreadsheet 'programs' can be exported and run outside of Excel.

The business have fully supported this approach, and are enthusiastic about using FMD \- as Simon Peyton Jones identified elsewhere, “Excel is the world's most popular functional language”. From their point of view, functional programming in Excel is just an extension of what they've been doing for years!
