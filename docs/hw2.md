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

After 30 minutes, do you have any large and nasty models still running? If yes, then kill those processes and do not use them in the following.
After killing, look at the tail of files in ~/tmp/_mqs. Does the last line look funny (i.e. a killed process did not complete writing that line?).
If yes, delete that file.

5. Change directories into ~/tmp/_mqs. Take a look at what you find. You should see around 49 files. Inside of one them (eg. SS-A.csv) you will see things like the following.


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

5. Summarize the results

    cd ~/tmp/_mqs
    bash ~/gits/timm/ezr/etc/rq.sh *.csv # note: change to find your own dir

(Note that this code runs on the csv files given on the command line. So you can run this script on 
5.  Based on the 
[extension](https://txt.github.io/se24fall/03code.html#try-it-for-yourself) you ran last time, there are nine groups of files
with small, medium and high dimensionality and small, medium, high number of rows. Run the summary stats function to see if different
conclusions hold for different groups. For example (and you will need to modify this example):

    cd erz/etc
    bash rq.sh ~/tmp/mqs/SS*.csv # just summarize the  results from the SS-*.csv files



- remember to use the 24Aug14 branch
- see examples [here](https://txt.github.io/se24fall/03code.html#try-it-for-yourself)
- note that data divides into small,medium, high dimensionality  (number of x columns) and 
  size (number of rows)

    make 
How many of our models do not complete

Install Python 31.3

- for [linux](https://txt.github.io/se24fall/03code.html#get-python3.13)
- for [mac](https://www.python.org/downloads/macos/)
- for windows: when you work it out, tell the class

Get the extension [extension](https://txt.github.io/se24fall/03code.html#try-it-for-yourself) going

- remember to use the 24Aug14 branch
- see examples [here](https://txt.github.io/se24fall/03code.html#try-it-for-yourself)
- note that data divides into small,medium, high dimensionality  (number of x columns) and 
  size (number of rows)

Here is a command line that runs all the current built-in examples. Please run it

    python3 -B ezr.py -D -e all -t data/optimize/misc/auto93.csv > ~/tmp/out

Run this code and answer the following questions. Write short answers for each. Submit one set of answers per team.


1. **heavens** d2h is short for "distance to heaven". How is it calculated?
2. **chebys** : how is the cheyshev distance different to d2h?
2. **likings**
   - in english, explain how loglike is calculated? and how is that calculation different for numeric and symbolic columns?
   - Diversity sampling means that the next thing we look out should be different to everything seen before. So explain: "selecting for min loglike is a synonym for diversity sampling"
3. **mean-vs-median**
   - This code recursively divides data by (a) slitting data according to everyone's distance to two far points; then (b) recursing into each half.
   - What is the difference between `half_median` and `half_mean`?
   - Referring to `~/tmp/out`a: in auto93.csv, does mean or median splits make a difference?
4. **clusters** shows the results of a tree generated via mean splits, How would this tree be different if we used median splits?
5. **clusters2** shows the results of prediction by (a) cluster the data (see **clusters**) then for each test (b) find its nearest leaf cluster; 
   then (c) using either the median value of that leaf or the 1,2,3,5 nearest neighbor. Based on these results, what approach would you recommend?

