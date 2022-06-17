---
title: "MEDB 5507, Introduction to SAS, Module02, Overview"
authors: Steve Simon
date: Created 2022-06-10
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

Continuous variables are those variables that can take on a large number of possible values, potentially any number in an interval. You will see how to look for extremes in these variables. These extremes are, at times, cause for concern if they fall outside a range of plausible values. You will also see how to compute correlations, histograms, and scatterplots.

There are several parts to your homework assignment. You should start out slowly. Copy a program you already have that you know will run. Make small changes and store it under a new name. Now add the pieces to the program one at a time. Don't try to do too much in a single step.

If you get stuck, of course, send me your code, as well as the log window and the output. I might be able to fix things quickly, but would be happy to schedule a face-to-face or Zoom session.

### Learning objectives

In this module, you will learn  about:

+ Rules for variable names
+ Descriptive statistics
+ Missing values
+ Histograms
+ Scatterplots

You will also see the following SAS keywords and procedurues

+ binstart
+ binwidth
+ by
+ descending
+ drop
+ if
+ histogram
+ label
+ outp
+ pbspline
+ proc corr
+ proc sgplot
+ proc sort
+ reg
+ round
+ set
+ scatter
+ where
+ with


### Reading and Resources

Handouts associated with videos

+ Slides and speaker notes
  + [pdf format][v02-pdf] or
  + [powerpoint format][v02-pptx].

[v02-pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-slides-and-speaker-notes.pdf
[v02-pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-02-simon-sildes-and-speaker-notes.pptx?raw=true

Datasets used in this module

+ Fat
  + [Text file][git1]
  + [Data dictionary][git2]
  
[git1]: https://github.com/pmean/introduction-to-SAS/blob/master/data/fat.txt
[git2]: https://github.com/pmean/classes/blob/master/introduction-to-r/data/fat-data-dictionary.yaml

Programs used in this module

+ [5507-02-simon-continuous-variables.sas][git3]

[git3]: https://github.com/pmean/introduction-to-SAS/blob/master/src/5507-02-simon-continuous-variables.sas

Recommended readings

+ SAS. Available in [html format][workspace].

### Videos

Total video time, xx minutes. All videos are in Panopto format.

+ V01-01. Introducing your instructor, 5 minutes, available in [Panopto format][2022b-5507-v01-01].

[2022b-5507-v01-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=427181d2-3d15-49ad-be3e-aeaa0125d864

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion02. 

Graded: 3 points, one point deduction if submitted after the deadline.

I'd like some brief feedback to the videos you just watched. Keep it short. One or two sentences per question is fine. You can also say something briefer like "I agree with [other student]". If you found everything confusing or nothing confusing, just respond with the word "everything" or "nothing." Please don't spend more than a minute on this assignment. I just want a quick reaction.

1. What was the most important thing you learned in these videos?

2. What was the one thing that you found confusing?

3. What would you like to see covered next?

#### Hw02a

Graded: 20 points, one point deducted if submitted late.

Take the program, [m02-5507-simon-cigarettes.sas][git1], and modify it so that

+ it has a documentation header,
+ it stores your dataset as a permanent file,
+ your output is stored as a pdf file, and
+ your data is in a file separate from the program

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git2].

#### Hw02b

Graded: 20 points, one point deducted if submitted late.

Use the dataset from the previous homework assignment and answer the following questions:

Q1. What brand has the highest tar?

Q2. What brand has the lowest tar?

Q3. What is the correlation between tar and nicotine? Interpret this correlation.

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git2].

#### Hw02c

Graded: 20 points, one point deducted if submitted late.

Use the dataset from the previous homework assignment and answer the following questions:

Q4. Draw a histogram for tar, nicotine, weight, and co. Do these histograms provide evidence that the data follows a classic bell shaped curve?

Q5. Draw a scatterplot showing the relationship between tar and nicotine (tar on the x-axis, nicotine on the y-axis). Include a linear trend line. Is there a positive or negative relationship between these two variables?

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git2].

#### Quiz02

Graded: 3 points, one point deducted if submitted late.

Not yet available.



[grading-rubric]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

[v02-01]: 
