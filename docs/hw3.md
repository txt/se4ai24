% HW3 : Testing an Research Hypotheses

(IMPORTANT NOTE: the experimental runs for this one can take a while– especially if you find a find a mistake and have to start again. Do not make this a last minute rush job!!!).

Three students from this class in the spring claim (Jacob, Joshua, and Rohan) claim that:

- JJR1: Nothing works better than 50 random guessed for low dimensional problems (less than 6 x attributes).
- JJR2: But such random guessing is rubbish for higher dimensional data.
Let us test that.

Use the extension from hw1 to find which data sets have less than 6 independent values

Run the following twice (once for the low dimensional data sets and once for the other). See what conclusions are found.

Noe that the following is quickly written pseudo code. May have mistakes. You fix them. Have fun!

- for N in (20,30,40,50)
  - d = DATA.new().csv(data)
  - dumb = [guess(N,d) for _ in range(20)]
  - dumb = [d.chebyshev( lst[0] ) for lst in dumb]
  - the.Last = N
  - smart = [d.shuffle().activeLearning() for _ in range(20)]
  - smart = [d.chebyshev( lst[0] ) for lst in smart]
  - add dumb and smart a list of SOME with the appropriate labeling
    - see clusters2 in ezr.py for an example on how to do that
  - print the usual files, one file per data set (so the results should have
    - dumb,20
    - dumb,30
    - dumb.40
    - dumb,50
    - smart,20
    - smart,30
    - smart.40
    - smart,50

- function guess(N,d)
  - pick N rows at random
    - hint some = random.choices(d.rows,k=N)
  - sort them on chebyshev
    - hint: d.clone().adds(some).chebyshevs().rows
  - return the rows of some, sorted on chebyshev.

## Experimental Scripts Must be “Commissioned”

The scripts you write for these experiments are always quirky and complex. It is very easy to make mistakes and have to throw out days of compute. So test experimental scripts have to be commissioned.

-  If the code is nasty, don’t use it. Make it simpler.
-  If person1 writes it, person2 has to inspect it. Very carefully.

Also: add in tests to check that the expected stuff is actually happening. e.g.

-  Does chebyshevs().rows[0] return the top item in that sort?
-  Are smart and dumb lists the right length (i.e. N). if not, why not?
-  Does you code really run some experimental treatment 20 times for statistical validity?
-  Does d.shuffle() really jiggle the order of the data?

## How to run a long experiment

## How to summarize a long experiments

## What to hand in

Submit a url link to moodle with a repo link that has a /hw3 subdirectory

- /hs3/README.md should include notes on how to install and run your code, all the rq.sh results, a walk thought the table results summarizing what the tables are all about and what they are saying for this experiment, and a last paragraph that is a conclusion section of the form
  - “Since we observed XXXX, we confirm/ doubt/ refine the JJR1/ JJR2 hypothesis as follows…” (and the “as follows” section is only needed if you want to refine the hypothesis).
- Include in your code tests cases that checks at least the items mentioned above (and you might want to check more).
