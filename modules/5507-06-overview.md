---
title: "MEDB 5507, Introduction to SAS, Module06, Overview"
authors: Steve Simon
date: Created 2022-07-10
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

You should develop good programming habits early in your programming career so those habits become almost instinctive. These habits will make it easier for you when you have to review your work months or years into the future. They will also help anyone who has to take over your work. Finally, they will help simplify the division of labor in team projects.

### Learning objectives

In this module, you will learn about

+ data management
+ collaboration tools
+ standard directory structure
+ version control
+ Markdown and LaTeX for document preparation
+ program documentation
+ data dictionaries

### Reading and Resources

Handouts associated with videos

+ Slides and speaker notes
  + [pdf format][slides.pdf] or
  + [powerpoint format][slides.pptx].
  + [The R program used to create these slides][slides.Rmd]
  
[git1]: https://github.com/pmean/classes/blob/master/software-engineering/results/good-documentation.pdf
[git2]: https://github.com/pmean/classes/blob/master/software-engineering/results/good-documentation.pptx
[git5]: https://github.com/pmean/classes/blob/master/software-engineering/results/data-dictonary.pdf
[git6]: https://github.com/pmean/classes/blob/master/software-engineering/results/data-dictonary.pptx

Here are the homework solutions (code and output) from the previous module. Compare your code to ours, but only after submitting your work.

+ [5507-04-simon-hw-q1.pdf][q1.pdf].
+ [5507-04-simon-hw-q1.sas][q1.sas].
+ [5507-04-simon-hw-q2.pdf][q2.pdf].
+ [5507-04-simon-hw-q2.sas][q2.sas].
+ [5507-04-simon-hw-q3.pdf][q3.pdf].
+ [5507-04-simon-hw-q3.sas][q3.sas].
+ [5507-04-simon-hw-q4.pdf][q4.pdf].
+ [5507-04-simon-hw-q4.sas][q4.sas].
+ [5507-04-simon-hw-q5.pdf][q5.pdf].
+ [5507-04-simon-hw-q5.sas][q5.sas].

[q1.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q1.pdf
[q2.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q2.pdf
[q3.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q3.pdf
[q4.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q4.pdf
[q5.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-hw-q5.pdf

[q1.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q1.sas
[q2.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q2.sas
[q3.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q3.sas
[q4.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q4.sas
[q5.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-hw-q5.sas

### Recommended readings

+ To be added.

### Videos

Total video time, 122 minutes. All videos are in Panopto format.

Good computing practices

+ [Part 1][p1]. (23 minutes)
+ [Part 2][p2]. (11 minutes)
+ [Part 3][p3]. ( 8 minutes)
+ [Part 4][p4]. ( 8 minutes)
+ [Part 5][p5]. (11 minutes)
+ [Part 6][p6]. (20 minutes)
+ [Part 7][p7]. (14 minutes)

Other videos

+ [Documentation][p8] ( 20 minutes)
+ [Data dictionary][p9] ( 7 minutes)

[p1]: 
[gcp1]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=55cf0d09-3647-4135-8354-ab1901530b60
[gcp2]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=c4813050-49b8-4ff3-a649-ab190159a79c
[gcp3]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=88c130ee-7317-490f-b6af-ab19015daa71
[gcp4]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=4fb06e69-fb02-429b-bb08-ab1901610c71
[gcp5]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=ddc5da52-8300-4f12-996e-ab1901641800
[gcp6]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=681ca99d-55bf-4c7c-a1e4-ab190167c797
[gcp7]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=31ad3ca7-2db7-4d1d-a5a8-ab19016db1c6
[gcp8]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=7d2c7fa4-8d74-45d2-a5ce-aa920149c1cb
[gcp9]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1aea13b5-e635-42df-9227-aa92015cdc9b


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

