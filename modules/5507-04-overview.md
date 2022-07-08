---
title: "MEDB 5507, Introduction to SAS, Module04, Overview"
authors: Steve Simon
date: Created 2022-07-02
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

Categorical variables require extra documentation and use different methods for graphics and statistical summaries. This module will show you how to add descriptive labels for variables with number codes, how to recode categorical data, and how to display crosstabulations of two categorical variables.

### Learning objectives

In this module, you will learn

+ Formats for categorical data
+ Frequency counts and percentages
+ Creating categories for a continuous variable
+ Bar charts

You will also see the following SAS keywords and procedures

+ format
+ if - then - else
+ input
+ nocol
+ nopercent
+ noprint
+ norow
+ out
+ proc freq
+ proc format
+ table / tables
+ value
+ vbar
+ yaxis
+ ??

### Reading and Resources



Handouts associated with videos

+ Slides and speaker notes
  + [pdf format][slides.pdf] or
  + [powerpoint format][slides.pptx].
  + [The R program used to create these slides][slides.Rmd]

[slides.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-slides-and-speaker-notes.pdf
[slides.pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-04-simon-slides-and-speaker-notes.pptx
[slides.rmd]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-slides-and-speaker-notes.Rmd

Here are the SAS programs used in the videos.

+ [5507-04-simon-categorical-variables.sas][categorical-variables.sas].

[categorical-variables.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-categorical-variables.sas

Datasets used in this module 

+ Gardasil
  + [Comma delimited text file][gardasil.csv]
  + [Data dictionary][gardasil.yaml]
+ Titanic
  + [Tab delimited text file][titanic.txt]
  + [Data dictionary][titanic.yaml]

[gardasil.csv]: https://github.com/pmean/introduction-to-SAS/blob/master/data/gardasil.csv
[gardasil.yaml]: https://github.com/pmean/introduction-to-SAS/blob/master/data/gardasil-data-dictionary.yaml

[titanic.csv]: https://github.com/pmean/introduction-to-SAS/blob/master/data/titanic.txt
[titanic.yaml]: https://github.com/pmean/introduction-to-SAS/blob/master/data/titanic-data-dictionary.yaml

### Recommended readings

+ To be added.

#### Homework answers for Module03 

Here are the homework solutions (code and output) from the previous module. Compare your code to ours, but only after submitting your work.

+ [5507-03-simon-hw-q1.pdf][hw-q1.pdf].
+ [5507-03-simon-hw-q1.sas][hw-q1.sas].
+ [5507-03-simon-hw-q2.pdf][hw-q2.pdf].
+ [5507-03-simon-hw-q2.sas][hw-q2.sas].
+ [5507-03-simon-hw-q3.pdf][hw-q3.pdf].
+ [5507-03-simon-hw-q3.sas][hw-q3.sas].
+ [5507-03-simon-hw-q4.pdf][hw-q4.pdf].
+ [5507-03-simon-hw-q4.sas][hw-q4.sas].

[hw-q1.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-03-simon-hw-q1.pdf
[hw-q2.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-03-simon-hw-q2.pdf
[hw-q3.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-03-simon-hw-q3.pdf
[hw-q4.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-03-simon-hw-q4.pdf

[hw-q1.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-03-simon-hw-q1.sas
[hw-q2.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-03-simon-hw-q2.sas
[hw-q3.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-03-simon-hw-q3.sas
[hw-q4.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-03-simon-hw-q4.sas

### Videos

Total video time, ?? minutes. All videos are in Panopto format. If you are using SODA (SAS On Demand for Academics), you do not need to view the Remote Labs live demo (though it doesn't hurt). If you are using SAS on Remote Labs, you do not need to view the SODA live demo.

+ [V04-01][2021b-5507-v04-01], ( 5 minutes). Frequency counts
+ [V04-02][2021b-5507-v04-02], ( 5 minutes). Convert string to numeric
+ [V04-03][2021b-5507-v04-03], ( 4 minutes). Labels for number codes
+ [V04-04][2021b-5507-v04-04], ( 7 minutes). Drawing bar charts
+ [V04-05][2021b-5507-v04-05], (11 minutes). Converting continuous to categorical
+ [V04-06][2021b-5507-v04-06], ( 4 minutes). Modifying categorical variables
+ [V04-07][2021b-5507-v04-07], (13 minutes). Crosstabulations
+ V04-07, (xx minutes). Live demo SODA
+ V04-08, (xx minutes). Live demo Remote labs SAS
+ V04-10, (xx minutes). Your homework

[2021b-5507-v04-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=746cc8d9-c4f9-42ea-a043-ad640159e272
[2021b-5507-v04-02]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=3877b83b-33ec-4550-8e62-ad64015b9b0b
[2021b-5507-v04-03]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=86f5eee5-87ae-4ad4-95ee-ad64015dbf0a
[2021b-5507-v04-04]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=894ff2ca-2cbe-49a2-a5fa-ad64015f1396
[2021b-5507-v04-05]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=51ae4c86-ca1b-4964-b5bb-ad6401617818  
[2021b-5507-v04-06]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=639a8277-6177-4fc5-84ec-ad640164d171
[2021b-5507-v04-07]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=60c17371-49ee-41f0-ba40-ad64016679e1

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion04. 

Graded: 3 points, one point deduction if submitted after the deadline.

I'd like some brief feedback to the videos you just watched. Keep it short. One or two sentences per question is fine. You can also say something briefer like "I agree with [other student]". If you found everything confusing or nothing confusing, just respond with the word "everything" or "nothing." Please don't spend more than a minute on this assignment. I just want a quick reaction.

1. What was the most important thing you learned in these videos?

2. What was the one thing that you found confusing?

3. What topic not covered in the videos would you like to learn about?

#### Hw04

Graded: 20 points, one point deducted if submitted late.

The Gardasil vaccine requires three shots in order to be effective. A study conducted at Johns Hopkins looked at how often patients failed to get all three shots. They wanted to see if insurance status, age, and other factors could predict who was at greatest risk for failing to get all three shots.

The data set is available as a comma separated file with variable names in the first row. It is available on [my github site][git1]. You can also find a data dictionary on [my github site][git2]. You can find details about the dataset on the [data repository for the Journal of Statistics Education][jse1].

Q1. Display frequency counts for AgeGroup, Race, Completed, Location. Be sure to use proc format to display your frequencies using short text descriptors rather than number codes. Which category occurs most frequently for each variable?

Q2. Report which variables have missing data and how many of these values are missing.

Q3. Draw a bar chart showing the number of patients at each of the four locations. Which location has the fewest patients?

Q4. Use a crosstabulation to compare Age to AgeGroup. Hint: use Age as the rows and do not display row, column, or cell percents. Are the recodings into AgeGroup done consistently?

Q5. Create a new variable that combines the race categories into white, and non-white. Calculate the proportion of white patients at each of the four locations. What location had the greatest proportion of non-white patients? Hint: use the new white/non-white variable as the columns and compute row percents.

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git5].

[git1]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/gardasil.csv
[git2]: https://github.com/pmean/introduction-to-SAS/blob/master/data/gardasil-data-dictionary.yaml

[git5]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

#### Quiz03

Graded: 3 points, one point deducted if submitted late.

Not yet available.

