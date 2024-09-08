% Lit Review

The "lit review" is really the first 3-4 pages of a research paper. I'll be reading it to see if you have insights into the material from class and/or a vision of the future.

Note that better papers (that score higher marks) will find from the literature some baseline statements and/or algorithms and/or tools that they
can extend. This means that you will be assessing prior work not just on its words but also on the algorithms/tools/ data they
provide. Warning: many so-called reproduction packages from research papers are not very good (will not compile, cannot get
to the data, takes too long to run, etc). So there will be much backwards and forwards and you find something praising,
find you cannot use it, then go hunt for something else.

## What to Hand in

A pdf 
written in the [IEEE Access latex style](Access_LaTeX_template.zip) (rename the file access.tex to main.tex).
Upload all this into an Overleaf project. Do you work. Generate the pdf. Submit that to Moodle.
For help notes, see the file [access.pdf](access.pdf) or the excellent on-line
help files of Overleaf..

## Structure

Please use the following structure (or lose marks).

Please take the following lengths as approximate. Feel free to add/subtract half a  page for each.

## Page1

- **COOL TILE**: have fun with this. take your abstract, give it to chatgpt and ask it for a provocative and eye-catching,
    yet professional
  title for a software engineering research paper.
- **ABSTRACT** (300 words max)
- An eight para **INTRODUCTION**
  - Para1: everyone does something
  - Para2: there is something wrong with that
  - Para3: you have an insight into how that might be fixed
  - Para4: so this is what you did
  - Para5: caveats. No paper solves all problems. What are the limits of this analysis.
  - Para6: "To help structure this investigation, Figure 1 shows the workflow we will use to explore the 
      data of Table 1 to answer the following research questions" (followed by two or more RQs)
    - This will give me some insight into your research approach.
    - Use the hw1 extension to populate Table~1. Or use complete different data. But tell me you have some case study data.
  - Para7: "Overall, the contribution of this paper is..."  (followed by a list of two to three main things; just make something up here)
  - Para8: "The rest of this paper is structured as follows. 
    - Para8 ends with. "This is followed by our conclusion:    `\begin{quote}{\em elevator pitch}\end{quote}` where 
      "elevator pitch" 
      is 2-3 lines that summarize the take away of the paper. For example:
      - <em>To fix bias, it might suffice to apply mutators to the training data in order to (A) remove biased labels; and (B) rebalance internal distributions such that they are equal based on class and sensitive attributes. </em>

## Page2

- A  top-of-page figure describing the problem and your solution
- Table 1
- **LIT REVIEW**
  - 1 - 2  pages that respects and disrespects the past. 
  - It respectfully details what was done. 
  - It disrespects prior results, just enough to say why you are not just using all the old methods., 
  - Lit review should include a table of categorized main cited papers and a venn diagram showing the overlap of what other people have done
    - e.g. see section 2.4  and table4 of https://arxiv.org/pdf/1705.03697.
  - Lit review should end with something like:a
    - In summary, prior work suffered from
      -  Some issue1
      -  Some issue2
    - Hence,  for the rest of this paper, we explore a solution that finds these issues by XXX, which will result in YYY

## And the Rest
Note that you will be revising the following in Oct and Nov so don't worry about getting it 100%
right. Just show me what you understand, so far.

- **METHODS** 
  - For Sept and Oct and Nov.
  - Algorithms
  - Data
  - Experimental rig
  - Statistical methods

- **RESULTS**
  - For Oct. Nov

- **DISCUSSION**
  - For Oct. Nov
  - Threats to validity
  - Implications
  - Future work

- **CONCLUSION**
  - For Oct. Nov
  - Summarize what you have accomplished, this time with supporting detail from your results.

- **REFERENCES**
  - For Sept and Oct and Nov.

## Hints and Tips

Writing a lit review is not a linear process.
At any stage, your understanding of things may breakthrough into another layer of superior comprehension. 
This means you have to back and start again. Hey, its called "research" since you search again and again and again and...

Ideally, all your papers are recent, highly cited, and from top-ranked venues.

- Pragmatically, you do what you can. But if you include something with four citataions from the Eastern Tasmanian workshop
  on small blue things, I will be asking you "why, oh why"
- For a list of top ranked venues, see (e.g. [Google Scholar Metrics](https://scholar.google.com/citations?view_op=top_venues&hl=en&vq=eng_softwaresystems)).


Steps for a lit review:

- REFLECT: find terms of interesting. 3-5 terms.
  - Note you will initially get this wrong. e.g. I was looking for "software engineering" "active leaning" initialization
    and got very little back. Then after some reading, I realized that "warm start" was the more standard term for "initialization".
    Which got me to some very cool stuff indeed.
- SEARCH: search google scholar , find the 100 most recent (eg. since 2020[^when])  most cited paperas
- SORT the 100, find "knee" where the counts even out. Usually these selects 20 to 60 papers
- SKIM those above knee, discarding the irrelevant ones (now you should be down to 10 to 30)
- SNOWBALL: using your own domain knowledge, add in important papers; e.g. papers that everyone cites from 20 years ago,
  or a paper that really interests you, etc. So 20 papers might contain,say, five snowballs.
- DISCUSS: if you find a cool paper, talk about it with other people in the class (feel free to use the #papers channel of Discourse).
  Maybe others can point you to some really cool stuff.
- READ the 12 to 36 paper selected by SKIMing and SNOWBALLings DISCUSSing.  See how they fit into you terms
- DRAW a venn diagram showing how papers overlap on your terms
- FIND THE GAPS (regions of the venn with low counts)
- WRITE the lit review.

For an example of this, see section 2.4  and table4 of https://arxiv.org/pdf/1705.03697.

[^when]: How far back should you go? For LLM stuff, you definitely want to latest. For other ideas, you might consider past ten years
(but see "snowballing"-- which might take you to some classic, much older, papers).
