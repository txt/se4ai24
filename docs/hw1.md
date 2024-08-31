% Howework1

<br clear=all>


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
   - Referring to [this output](https://discord.com/channels/1274561111420702720/1275424775723941911/1279074151981776986) from <br>
       `python3 ezr.py -e mean_vs_median -t data/optimize/misc/auto93.csv` <br>
       does mean or median splits make a difference?
4. **python3 ezr.py -e clusters -t data/optimize/misc/auto93.csv** generates  a tree generated via mean splits
   - reproduce the same output 
   - How would this tree be different if we used median splits?
5. **python3 ezr.py -e clusters2 -t data/optimize/misc/auto93.csv** shows the results of prediction by (a) cluster the data (see **clusters**) then for each test (b) find its nearest leaf cluster; 
   then (c) using either the median value of that leaf or the 1,2,3,5 nearest neighbor. 
   - generate  that output and show it in the homeworks response. t 
   - Based on these results, what approach would you recommend?

