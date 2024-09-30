% HW3 : Testing an Research Hypotheses

(IMPORTANT NOTE: the experimental runs for this one can take a while– especially if you find a find a mistake and have to start again. Do not make this a last minute rush job!!!).

Three students from this class in the spring claim (Jacob, Joshua, and Rohan) claim that:

- JJR1: Nothing works better than 50 random guessed for low dimensional problems (less than 6 x attributes).
- JJR2: But such random guessing is rubbish for higher dimensional data.
Let us test that.

Use the extension from hw1 to find which data sets have less than 6 independent values

Run the following twice (once for the low dimensional data sets and once for the other). See what conclusions are found.

Now that the following is quickly written pseudo code. May have mistakes. You fix them. Have fun!

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

## Experiments,  part1: comission for one data set

First you must write an experiment function

- Best not to edit ezr.py
- Better to write an extesions, like in hw1, where you write a seperate file
  that includes my code.

That experiment file needs to loop through some options and write
to a list of SOME instances (one per option).  Note that one treatment
must be `asIs` that runs over the data and collects all the distances
to heaven. This is the baseline result against which everything
else will be compared.

```python
d = DATA().adds(csv(the.train))
b4 = [d.chebyshev(row) for row in d.rows]
somes = [stats.SOME(b4,f"asIs,{len(d.rows)}")]
```
Then you need to loop through some options to collect
some numbers into a list. 
This gets added to `SOME`
with a name that identiges the treatment. In the following ,see `some +=`: 


```python
rnd = lambda z: z
scoring_policies = [
  ('exploit', lambda B, R,: B - R),
  ('explore', lambda B, R :  (exp(B) + exp(R))/ (1E-30 + abs(exp(B) - exp(R))))]

for what,how in scoring_policies:
  for the.Last in [0,20, 30, 40]:
    for the.branch in [False, True]:
      start = time()
      result = []
      runs = 0
      for _ in range(repeats):
         tmp=d.shuffle().activeLearning(score=how)
         runs += len(tmp)
         result += [rnd(d.chebyshev(tmp[0]))]

      pre=f"{what}/b={the.branch}" if the.Last >0 else "rrp"
      tag = f"{pre},{int(runs/repeats)}"
      print(tag, f": {(time() - start) /repeats:.2f} secs")
      somes +=   [stats.SOME(result,    tag)]
```

```python
pre=f"{what}/b={the.branch}" if the.Last >0 else "rrp"
tag = f"{pre},{int(runs/repeats)}"
somes +=   [stats.SOME(result,    tag)]
```
When all the looping is done, you have to print the result:
```
stats.report(somes, 0.01)
```
(In the above, "0.01" controls the size of the smallest difference
we can print in the output.)

### Experimental Scripts Must be “Commissioned”

The scripts you write for these experiments are always quirky and complex. It is very easy to make mistakes and have to throw out days of compute. So test experimental scripts have to be commissioned.

-  If the code is nasty, don’t use it. Make it simpler.
-  If person1 writes it, person2 has to inspect it. Very carefully.

Also: add in tests to check that the expected stuff is actually happening. e.g.

-  Does chebyshevs().rows[0] return the top item in that sort?
-  Are smart and dumb lists the right length (i.e. N). if not, why not?
-  Does you code really run some experimental treatment 20 times for statistical validity?
-  Does d.shuffle() really jiggle the order of the data?

## Experiments, part2: run it over many datasets

`Makefile` has a tool for generating a todo file for running multiple experiments

Lets say your experument can be called from the command line `-e branch`.

For example:

```bash
make Act=branch actb4 # this outputs

mkdir -p .../tmp/branch
rm .../tmp/branch/*
python3 .../ezr.py  -D -t .../Apache_AllMeasurements.csv -e branch | tee .../tmp/branch/Apache_AllMeasurements.csv &
python3 .../ezr.py  -D -t .../HSMGP_num.csv -e branch              | tee .../tmp/branch/HSMGP_num.csv &
python3 .../ezr.py  -D -t ../SQL_AllMeasurements.csv -e branch     | tee .../tmp/branch/SQL_AllMeasurements.csv &
...
```

You can catch the output of `actb4` into a `todo` file:

```bash
make Act=branch actb4 > ~/tmp/branch.sh
```
See here for a full example [branch.sh](branch.sh).

You can now run all this to generate lots of output files. See [here](branch.zip) for a sample.

All those outputs can be summarizes with the [rq.sh](https://github.com/timm/ezr/blob/main/etc/rq.sh) script:


```
cd ~/tmp/branch ; bash ~/gits/timm/ezr/etc/rq.sh 

RANK                0            1            2             3            
exploi/b=True      92            4            4                         
explore/b=True     80           16            2             2          
exploi/b=False     71           24            4                       
explore/b=False    59           27           10             4        
rrp                10           16           14            37       
asIs                2            8           12            12      
#
#EVALS
RANK                      0            1            2             3 
exploi/b=True      29 (  8)     35 (  0)     20 (  0)       0 (  0)
explore/b=True     29 (  8)     29 (  0)     20 (  0)      30 (  0)   
exploi/b=False     28 (  8)     26 (  4)     20 (  0)       0 (  0)  
explore/b=False    28 (  4)     31 (  8)     30 (  0)      30 (  0) 
rrp                 4 (  0)      4 (  0)      4 (  0)       5 (  0)
asIs              3840 (  0)   6581 (  0)   12835 (  0)   16307 (  0)  
#
#DELTAS
RANK                      0            1            2             3   
exploi/b=True      73 ( 23)     48 (  0)     41 (  0)       0 (  0)  
explore/b=True     74 ( 21)     61 (  0)     24 (  0)      24 (  0)   
exploi/b=False     73 ( 26)     59 ( 19)     46 (  0)       0 (  0)  
explore/b=False    71 ( 22)     58 ( 15)     52 (  0)      54 (  0) 
rrp                61 (  0)     50 (  0)     22 (  0)      22 ( 11) 
```

RANKS: how often treatments are in rank 0,1,2,...

EVALS: is the budgets used to achieve those ranks.

DELTAS: are the `100*(asIs - now)/asIs` change.

### If rq.sh fails:


- Your experiment script does not mention an `asIs` output
- When you name your treatments, you add in more than one ","


## What to hand in

Submit a url link to moodle with a repo link that has a /hw3 subdirectory

- /hs3/README.md should include notes on how to install and run your code, all the rq.sh results, a walk thought the table results summarizing what the tables are all about and what they are saying for this experiment, and a last paragraph that is a conclusion section of the form
  - “Since we observed XXXX, we confirm/ doubt/ refine the JJR1/ JJR2 hypothesis as follows…” (and the “as follows” section is only needed if you want to refine the hypothesis).
- Include in your code tests cases that checks at least the items mentioned above (and you might want to check more).
