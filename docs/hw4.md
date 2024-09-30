% HW4 : Concepts


1. What is the standard line on “how much data is enough?”
     * From Peter Norvig
     * From regression theory
     * From semi-supervised learning
2. Describe each of the following. What are their implications for human decision making
     * Streaming over zero-diversity data
     * STM, LTM
     * Shrikanth’s early bird effect
     * two results (Valerdi’s work; repertory grids) commenting on the rate at which we can extract considered opinions from humans
3. In English, describe the following math results and their implications for data mining
   * chessboard model
   * probable correctness theory.
4. Few-shot learning (FSL):
     - describe it (use this as a guide: https://www.promptingguide.ai/techniques/fewshot)
     - In what sense does FSL mean we can look at fewer examples?
     - In what sense does FSL require many, many examples
5. Describe an active learning cycle. include the  words acquisition function, exploit, explore, warm/code start
6. Acquisition functions. Distinguish and define the following terms.  diversity, perversity, (population|surrogate|pool|stream)-based
7. What is PCA? (Us this as a guide: https://en.wikipedia.org/wiki/Principal_component_analysis)
     - How is ezr’s recursive use of “twoFar” an analog of PCA?
     - Recursive twoFar generates a tree of clusters. What does ezr’s leaf function do? Assuming balances  cluster tree are already built, in “big O” notation, what is leaf’s runtime?
     - The ezr functions half and  cluster sort the sort flag. What is the impact on #evalautions oil sortp=True
     - (HARD): Currently, in 24Aug12, ezr’s half (called from brach) requires two evals per depth of tree.  Can you reduce that to one (for all levels except the top one)
8. Describe, in Engkish, the k-means algorithm (hint: see "kmeans" in https://github.com/timm/noml/blob/main/src/mink.py)
    - How is the same/different as recursive twoFar clustering?
9. What is "discretization?" (hint: see https://www.blog.trainindata.com/data-discretization-in-machine-learning/)
    -  What is gaussian discretization? Hint: unsuper, the "bin" function in https://github.com/timm/noml/blob/main/src/unsuper.py
    -  How should the gaussian discretizer  handle symbolic columns (hint:trick question).
    -  How does unsuper divide numeric columns (hint: see COLS'bins function and
       its use of i.bin)
    -  Why does unsuper need to merge (some) of the bins it generated ?
    -  How does unsuper's  merges function combine tow adjacent bins?
  