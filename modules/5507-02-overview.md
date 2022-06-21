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

You will also see the following SAS keywords and procedures

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

[v02-pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-02-simon-slides-and-speaker-notes.pptx



Datasets used in this module

+ Cigarettes
  + [Text file][git1]
  + [Data dictionary][git2]

+ Fat
  + [Text file][git3]
  + [Data dictionary][git4]
  
[git1]: https://github.com/pmean/introduction-to-SAS/blob/master/data/cigarettes.txt
[git2]: https://github.com/pmean/introduction-to-sql/blob/master/data/cigarettes-data-dictionary.txt
[git3]: https://github.com/pmean/introduction-to-SAS/blob/master/data/fat.txt
[git4]: https://github.com/pmean/classes/blob/master/introduction-to-r/data/fat-data-dictionary.yaml

Programs used in this module

+ [5507-02-simon-cigarettes.sas][git5]
+ [5507-02-simon-continuous-variables.sas][git6]

[git5]: https://github.com/pmean/introduction-to-SAS/blob/master/src/5507-02-simon-cigarettes.sas
[git6]: https://github.com/pmean/introduction-to-SAS/blob/master/src/5507-02-simon-continuous-variables.sas

Recommended readings

+ SAS. Available in [html format][workspace].

### Videos

Total video time, 141 minutes. All videos are in Panopto format. If you are using SODA (SAS On Demand for Academics), you do not need to view the Remote Labs live demo (though it doesn't hurt). If you are using SAS on Remote Labs, you do not need to view the SODA live demo.

+ [V02-01][2022b-5507-v02-01], (13 minutes). Using variable labels.
+ [V02-02][2022b-5507-v02-02], (15 minutes). SAS code
+ [V02-03][2022b-5507-v02-03], (18 minutes). Descriptive statistics
+ [V02-04][2022b-5507-v02-04], ( 6 minutes). Transformations and histograms
+ [V02-05][2022b-5507-v02-05], (13 minutes). Correlations and scatterplots
+ [V02-06][2022b-5507-v02-06], (38 minutes). Live demo (SODA)
+ [V02-07][2022b-5507-v02-07], (28 minutes). Live demo (Remote labs)
+ [V02-08][2022b-5507-v02-08], (10 minutes). Your homework

[2022b-5507-v02-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1f8f548c-da23-4f2d-a3f0-aeb701624038
[2022b-5507-v02-02]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=f7a9c5e2-cdc5-4734-8191-aeb70165daf6
[2022b-5507-v02-03]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=dc8e3faf-b8e1-4ffa-8f7f-aeb7016a4dad
[2022b-5507-v02-04]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=e601c3dd-43f9-451f-8a14-aeb7016f6c33
[2022b-5507-v02-05]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1b7d8391-997d-46c5-be89-aeb7017120f9
[2022b-5507-v02-06]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=2dbefe95-c028-42c2-aeec-aeb80110b12b
[2022b-5507-v02-07]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=34aa6a30-2363-41ff-9e35-aeba0183ffd5
[2022b-5507-v02-08]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=9c0a0a48-5212-4eec-98b1-aebb015d75a8

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
