% Howework2

<br clear=all>

(Note: the following works for LINUX and Mac. Windows users, please join in a discussion at
[windows](https://discord.com/channels/1274561111420702720/1276992727761817611]. Or, don't use windows and use codespaces on Github.

(If using codespaces on Github, carefully monitor your monthly costs using [this link])https://docs.github.com/en/billing/managing-billing-for-github-codespaces/viewing-your-github-codespaces-usage)
- Students in prior years report that codespaces costs just a few dollars per months. 
- That said, it is possible to design a nasty experiment that consumes much more $$$. Caveat Emptor.

1. Update your code from http://github.com/timm/ezr. Remember to use the 24Aug14 branch

```sh
git clone https://github.com/timm/ezr/
git checkout 24Aug14
```

2. Install the htop monitor so you can track executions (Windows users many have an equivalent tool).

3. Run all our models. The following code auto-generated a file $(Tmp)/acts.sh. Note that by editing this file and running "sh acts.sh" you
can rerun all the experiments.

    make acts

4. Monitor with "htop -F Python" or some equivalent.

<img src="img/htop.png" width=500>

less than .35 sd

XXX exit file. using "#", comment out antyhing that is not an SS-* file

After 30 minutes, do you have any large and nasty models still running? If yes, then kill those processes and do not use them in the following.
After killing, look at the tail of files in ~/tmp/_mqs. Does the last line look funny (i.e. a killed process did not complete writing that line?).
If yes, delete that file.

5. Change directories into ~/tmp/_mqs. Take a look at what you find. You should see around 49 files. 
Inside of one them (eg. SS-A.csv) you will see things like the following.

```
/Users/timm/gits/timm/ezr/data/optimize/config/SS-A.csv
asIs	: 0.285
div	: 0.747
dull	: 0.261
least	: 0.001
rows	: 1343
xcols	: 3
ycols	: 2

pool.15: 0.05 secs
mqs1K.15: 0.03 secs
	feature,220,	18.601893939393925,	22.612,	Spout_wait
	feature,220,	13.049999999999997,	3.178,	Counters
	feature,220,	4.140909090909089,	1.008,	Spliters
mqs4.15: 0.08 secs
pool.20: 0.09 secs
mqs1K.20: 0.05 secs
	feature,320,	3.9809895833333337,	0.803,	Spliters
	feature,320,	11.949218750000002,	11.828,	Spout_wait
	feature,320,	12.26015625,	2.898,	Counters
mqs4.20: 0.06 secs
pool.25: 0.11 secs
mqs1K.25: 0.08 secs
	feature,420,	15.087301587301582,	13.899,	Spout_wait
	feature,420,	4.026944444444446,	1.212,	Spliters
	feature,420,	13.259325396825396,	3.302,	Counters
mqs4.25: 0.09 secs
pool.30: 0.17 secs
mqs1K.30: 0.09 secs
	feature,520,	13.359006410256407,	3.634,	Counters
	feature,520,	12.705544871794874,	11.209,	Spout_wait
	feature,520,	3.8385576923076923,	0.875,	Spliters
mqs4.30: 0.11 secs
pool.50: 0.29 secs
mqs1K.50: 0.20 secs
	feature,920,	4.437404244306422,	1.215,	Spliters
	feature,920,	12.395095755693584,	2.649,	Counters
	feature,920,	17.38697204968948,	14.335,	Spout_wait
mqs4.50: 0.22 secs
pool.100: 0.82 secs
mqs1K.100: 0.69 secs
	feature,1920,	14.44530113260581,	2.704,	Counters
	feature,1920,	12.23316447585979,	8.525,	Spout_wait
	feature,1920,	3.972374751984126,	1.040,	Spliters
mqs4.100: 0.57 secs
#
 0,             pool,100,  0.00,  0.00, *--------           |
#
 1,              pool,50,  0.01,  0.03,  * -------          |
#
 2,             mqs4,100,  0.03,  0.01,  --*--------        |
 2,          mqs1000,100,  0.03,  0.02,  --* ---------      |
 2,              pool,25,  0.04,  0.05, --- *    -----      |
 2,           random,100,  0.04,  0.03, --- * ---           |
 2,              pool,30,  0.04,  0.04, ---  *  ------------|------
#
 3,            random,30,  0.05,  0.04,       * -----       |
 3,            random,50,  0.06,  0.03,    -  * ---         |
 3,              pool,15,  0.06,  0.05, ----   *   ----     |
 3,              pool,20,  0.07,  0.04,    --   * -----     |
 3,            random,25,  0.07,  0.03,    ---  *--         |
#
 4,           mqs1000,50,  0.08,  0.06,    --    *  --------|-----
 4,            random,20,  0.09,  0.06,    --     * -       |
 4,           mqs1000,30,  0.09,  0.05,      ---- *    -----|-
 4,              mqs4,50,  0.09,  0.01,      ----  *--      |
 4,              mqs4,30,  0.09,  0.08,    --      *  ------|-------
 4,              mqs4,15,  0.10,  0.03,      ----- *  ------|
 4,           mqs1000,20,  0.10,  0.04,     ------  *  -----|----
 4,              mqs4,25,  0.10,  0.04,    ------   * ------|------
 4,            random,15,  0.10,  0.04,      ----   * -     |
#
 5,           mqs1000,25,  0.12,  0.07,  ------      *  --- |
 5,              mqs4,20,  0.12,  0.03,           -   *---- |
#
 6,           mqs1000,15,  0.13,  0.05,     --------   *  --|----------
#
 7,            asIs,1343,  0.16,  0.05,          ------   * |-----
tmp/_mqs:692 ▶
```

What really matters is the stuff at the bottom (with six cells).

6. Summarize the results

    cd ~/tmp/_mqs
    bash ~/gits/timm/ezr/etc/rq.sh *.csv # note: change to find your own dir

(Note that this code runs on the csv files given on the command line. So you can run this script on  any subset of 
the data.)

7.  Based on the 
[extension](https://txt.github.io/se24fall/03code.html#try-it-for-yourself) you ran last time, there are nine groups of files
with small, medium and high dimensionality and small, medium, high number of rows. Run the summary script on those nine
subsets to see if different
conclusions hold for different groups. For example (and you will need to modify this example):

    cd erz/etc
    bash rq.sh ~/tmp/mqs/SS*.csv # just summarize the  results from the SS-*.csv files

## Questions (to hand in)

6. **regression, classification:** 
   - in terms of tabular data and inputs and outputs, how is regression and classification same/different?
   - Given an alagorithm that can find (say) five nearest neighbors to a test case, how could you implement regression and classification
     (usually basically the same code)?
7. **multi-objective:**
   - list three SE problems with 3 competing goals (each);
8. **normalization:** look at the code `def chebyshev`. Whey do we normalize the goal values?
9. **entropy:** 
   - write down for formula for entropy. Explain all terms.
   - show the calculation  of the entropy of a set of eight apples and four oranges (show all working). 
10. **standard deviation:** 
   - Draw two gaussian curves, where curve one has twice the mean and half the standard deviation of the other.
   - Write down the formula for standard deviation. Explain all terms.
   - Show the calualtion of standard eviation for the set {1,1,2}. You can leave the answers in a fraction form.
11. **distance:** define and distinquish Eucilidean from the Chebyshev distance.
12. **Bayes Classifier**: Ignoring any low frequency factors (like m or k), compute the following. Show all working:
    - prior(no)
    - prior(yes)
    - Given outlook=sunday and just looking at outlook and the priors, report 
      - like(outlook=sunday|no)
      - like(humidity=normal|yes)
    
```
outlook   ,temperate   ,humidity   ,windy   ,play!
sunny     ,hot         ,high       ,FALSE   ,no
sunny     ,hot         ,high       ,TRUE    ,no
rainy     ,cool        ,normal     ,TRUE    ,no
sunny     ,mild        ,high       ,FALSE   ,no
rainy     ,mild        ,high       ,TRUE    ,no
overcast  ,hot         ,high       ,FALSE   ,yes
rainy     ,mild        ,high       ,FALSE   ,yes
rainy     ,cool        ,normal     ,FALSE   ,yes
overcast  ,cool        ,normal     ,TRUE    ,yes
sunny     ,cool        ,normal     ,FALSE   ,yes
rainy     ,mild        ,normal     ,FALSE   ,yes
sunny     ,mild        ,normal     ,TRUE    ,yes
overcast  ,mild        ,high       ,TRUE    ,yes
overcast  ,hot         ,normal     ,FALSE   ,yes
```
