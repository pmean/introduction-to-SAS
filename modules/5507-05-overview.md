---
title: "MEDB 5507, Introduction to SAS, Module05, Overview"
authors: Steve Simon
date: Created 2022-07-02
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

Most datasets will have a mix of categorical and continuous variables. In this module, you will review how to summarize continuous variables, how to summarize categorical variables, and how to examine the relationship between variables when one is categorical and the other is continuous.

### Learning objectives

In this module, you will learn about

+ boxplots for a relationship between a continuous and a categorical variable,
+ the by statement to produce group means and standard deviations.
 
You will also see the following SAS keywords:

+ by
+ category
+ format
+ proc format
+ proc freq
+ vbox

### Reading and Resources

Handouts associated with videos

+ Slides and speaker notes
  + [pdf format][slides.pdf] or
  + [powerpoint format][slides.pptx].
  + [The R program used to create these slides][slides.Rmd]

[slides.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-05-simon-slides-and-speaker-notes.pdf
[slides.pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-05-simon-slides-and-speaker-notes.pptx
[slides.rmd]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-05-simon-slides-and-speaker-notes.Rmd

Here are the SAS programs used in the videos.

+ [5507-05-simon-working-with-a-mix-of-variables.sas][working-with-a-mix.sas].

[working-with-a-mix.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-05-simon-working-with-a-mix-of-variables.sas

Datasets used in this module 

+ FEV
  + [Comma delimited text file][fev.txt]
  + [Data dictionary][fev.yaml]
+ Housing
  + [Tab delimited text file][housing.txt]
  + [Data dictionary][housing.yaml]

[fev.csv]: https://github.com/pmean/introduction-to-SAS/blob/master/data/fev.txt
[fev.yaml]: https://github.com/pmean/introduction-to-SAS/blob/master/data/fev-data-dictionary.yaml

[housing.txt]: https://github.com/pmean/introduction-to-SAS/blob/master/data/titanic.txt
[titanic.yaml]: https://github.com/pmean/introduction-to-SAS/blob/master/data/titanic-data-dictionary.yaml

### Recommended readings

+ To be added.

#### Homework answers for Module04 

Here are the homework solutions (code and output) from the previous module. Compare your code to ours, but only after submitting your work.

+ [5507-04-simon-hw-q1.pdf][hw-q1.pdf].
+ [5507-04-simon-hw-q1.sas][hw-q1.sas].
+ [5507-04-simon-hw-q2.pdf][hw-q2.pdf].
+ [5507-04-simon-hw-q2.sas][hw-q2.sas].
+ [5507-04-simon-hw-q3.pdf][hw-q3.pdf].
+ [5507-04-simon-hw-q3.sas][hw-q3.sas].
+ [5507-04-simon-hw-q4.pdf][hw-q4.pdf].
+ [5507-04-simon-hw-q4.sas][hw-q4.sas].
+ [5507-04-simon-hw-q5.pdf][hw-q5.pdf].
+ [5507-04-simon-hw-q5.sas][hw-q5.sas].

[hw-q1.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q1.pdf
[hw-q2.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q2.pdf
[hw-q3.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q3.pdf
[hw-q4.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q4.pdf
[hw-q5.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q5.pdf

[hw-q1.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q1.sas
[hw-q2.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q2.sas
[hw-q3.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q3.sas
[hw-q4.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q4.sas
[hw-q5.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q5.sas

### Videos

Total video time, ?? minutes. All videos are in Panopto format. If you are using SODA (SAS On Demand for Academics), you do not need to view the Remote Labs live demo (though it doesn't hurt). If you are using SAS on Remote Labs, you do not need to view the SODA live demo.

+ [V05-01][2021b-5507-v05-01], ( 4 minutes). Means and frequency counts
+ [V05-02][2021b-5507-v05-02], ( 3 minutes). Correlations and scatterplots
+ [V05-03][2021b-5507-v05-03], ( 3 minutes). Boxplots
+ [V05-04][2021b-5507-v05-04], ( 4 minutes). Means by group
+ [V05-05][2021b-5507-v05-05], ( 4 minutes). Investigating an odd association
+ V05-06, (xx minutes). Live demo SODA
+ V05-07, (xx minutes). Live demo Remote labs SAS
+ V05-09, (xx minutes). Your homework

[2021b-5507-v05-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=73345cc2-e7cc-440b-82d8-ad6a01069061
[2021b-5507-v05-02]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=0f22f408-d33e-4740-a1d1-ad6a01081402
[2021b-5507-v05-03]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=7810282b-2c05-49fc-9698-ad6a0109183a
[2021b-5507-v05-04]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=d0d3880e-a5e6-44be-a177-ad6a010a3149
[2021b-5507-v05-05]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=8f885403-a527-4ebe-891b-ad6a010aeb37

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion05. 

Graded: 3 points, one point deduction if submitted after the deadline.

I'd like some brief feedback to the videos you just watched. Keep it short. One or two sentences per question is fine. You can also say something briefer like "I agree with [other student]". If you found everything confusing or nothing confusing, just respond with the word "everything" or "nothing." Please don't spend more than a minute on this assignment. I just want a quick reaction.

1. What was the most important thing you learned in these videos?

2. What was the one thing that you found confusing?

3. What topic not covered in the videos would you like to learn about?

#### Hw05

Graded: 20 points, one point deducted if submitted late.

Your homework assignment will use a [data set][git1] of housing prices and factors that influence the price. I originally found this data set on the DASL web site, but it has disappeared on me. Please refer to the [data dictionary][git2] for this file. A nice description of this file is on [my own website][sim1], but please note that the names of the variables are different for this description. Create value labels for the categorical variables.

Q1. Do any of the variables have missing values? How many?

Q2. Calculate the mean and standard deviation for the custom-built versus normal houses. Use formats to label the number codes. How much more do custom built houses cost on average?

Q3. Evaluate the relationship between custom_build and sqft using a boxplot. Use formats again. Do custom built houses tend to be bigger?

Q4. Are custom built houses more likely to appear on corner lots? Calculate the percentages. Hint: place the corner lot variable as the rows and display row percentages. Use formats for both variables.

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git5].

[git1]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/housing.txt
[git2]: https://github.com/pmean/introduction-to-SAS/blob/master/data/housing-data-dictionary.yaml

[git5]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

#### Quiz03

Graded: 3 points, one point deducted if submitted late.

Not yet available.

