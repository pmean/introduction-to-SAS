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
  + [The R program used to create these slides][slide.Rmd]

[slides.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-04-simon-slides-and-speaker-notes.pdf
[slides.pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-04-simon-slides-and-speaker-notes.pptx
[slides.rmd]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-slides-and-speaker-notes.Rmd

Here are the SAS programs used in the videos.

+ [5507-04-simon-categorical-variables.sas][categorical-variables.sas].

[categorical-variables.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-04-simon-categorical-variables.sas

Datasets used in this module 

+ [tilde-delimited.txt][tilde-delimited.txt]

[tilde-delimited.txt]: https://github.com/pmean/introduction-to-SAS/blob/master/data/tilde-delimited.txt

### Recommended readings

+ To be added.

#### Homework answers for Module03 

Here are the homework solutions (code and output) from the previous module. Compare your code to ours, but only after submitting your work.

+ [5507-02-simon-hw-q1.pdf][hw-q1.pdf].
+ [5507-02-simon-hw-q1.sas][hw-q1.sas].
+ [5507-02-simon-hw-q2.pdf][hw-q2.pdf].
+ [5507-02-simon-hw-q2.sas][hw-q2.sas].
+ [5507-02-simon-hw-q3.pdf][hw-q3.pdf].
+ [5507-02-simon-hw-q3.sas][hw-q3.sas].
+ [5507-02-simon-hw-q4.pdf][hw-q4.pdf].
+ [5507-02-simon-hw-q4.sas][hw-q4.sas].
+ [5507-02-simon-hw-q5.pdf][hw-q5.pdf].
+ [5507-02-simon-hw-q5.sas][hw-q5.sas].

[hw-q1.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-hw-q1.pdf
[hw-q2.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-hw-q2.pdf
[hw-q3.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-hw-q3.pdf
[hw-q4.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-hw-q4.pdf
[hw-q5.pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-02-simon-hw-q5.pdf

[hw-q1.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-02-simon-hw-q1.sas
[hw-q2.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-02-simon-hw-q2.sas
[hw-q3.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-02-simon-hw-q3.sas
[hw-q4.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-02-simon-hw-q4.sas
[hw-q5.sas]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-02-simon-hw-q5.sas


### Videos

Total video time, 141 minutes. All videos are in Panopto format. If you are using SODA (SAS On Demand for Academics), you do not need to view the Remote Labs live demo (though it doesn't hurt). If you are using SAS on Remote Labs, you do not need to view the SODA live demo.

+ [V03-01][2021b-5507-v03-01], ( 5 minutes). Space delimited files.
+ [V03-02][2021b-5507-v03-02], ( 2 minutes). Comma delimited files
+ [V03-03][2021b-5507-v03-03], ( 4 minutes). Tab delimited files
+ [V03-04][2021b-5507-v03-04], ( 2 minutes). Tilde delimited files
+ [V03-05][2021b-5507-v03-05], ( 5 minutes). Fixed width files
+ [V03-06][2021b-5507-v03-06], ( 7 minutes). String data
+ [V03-07][2021b-5507-v03-07], ( 6 minutes). First line names
+ [V03-08][2021b-5507-v03-08], ( x minutes). Live demo SODA
+ [V03-09][2021b-5507-v03-09], ( x minutes). Live demo Remote Labs SAS
+ [V03-10][2021b-5507-v03-10], ( x minutes). Your homework
+ [V03-99][2021b-5507-v03-99], (12 minutes). Evil tab character

Note: This last recording was from an earlier class, and refers to a homework assignment that I ditched because it was too complicated. The video explains that a large part of the reason the assignment was confusing was because of the evil tab character. It explains very clearly why the tab character is evil. It is well worth watching, even though it references an obsolete homework assignment.

[2021b-5507-v03-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=f257dafa-1f47-40a4-a16a-ad5601435c74
[2021b-5507-v03-02]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=6099f2b8-848f-4140-b185-ad560145001b
[2021b-5507-v03-03]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=b95a5be9-e282-41e0-aacc-ad5601461018
[2021b-5507-v03-04]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=47317047-c929-4377-a0ba-ad560147984f
[2021b-5507-v03-05]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=8081cdf5-d018-4fca-bd6a-ad5601484ad7
[2021b-5507-v03-06]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=dc031106-04cd-4ad3-a856-ad560149e53a
[2021b-5507-v03-07]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=35ec8b62-2396-43d3-804c-ad56014c04ee

[2021b-5507-v03-10]:  https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=c5df8783-9221-4ff1-8b57-ad56015faa80
[2021b-5507-v03-99]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=0ce9339f-f3c9-4bb3-908e-aa790131a2a9

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion03. 

Graded: 3 points, one point deduction if submitted after the deadline.

I'd like some brief feedback to the videos you just watched. Keep it short. One or two sentences per question is fine. You can also say something briefer like "I agree with [other student]". If you found everything confusing or nothing confusing, just respond with the word "everything" or "nothing." Please don't spend more than a minute on this assignment. I just want a quick reaction.

1. What was the most important thing you learned in these videos?

2. What was the one thing that you found confusing?

3. What topic not covered in the videos would you like to learn about?

#### Hw03

Graded: 20 points, one point deducted if submitted late.

Q1. The file [energy01.csv][git1a] is a comma delimited file. Details about this file are in its [data dictionary][git1b]. Read this file into SAS and print the first three rows of data. 

Q2. The file [energy02.tsv][git2a] is the same data, but replaces the commas with tabs as delimiters. Details about this file are in its [data dictionary][git2b]. Read this file into SAS and print the first three rows of data. 

Q3. The file [energy03.txt][git3a] is the same data but uses a fixed width format. Details about this file are in its [data dictionary][git3b]. Read this file into SAS and print the first three rows of data. 

Q4. The file [energy04.csv][git4a] is a comma delimited file, like above, but the variables names are included in the first row of data. Details about this file are in its [data dictionary][git4b]. Read this file into SAS and print the first three rows of data. 

Include your code and your output in a single PDF file. This assignment will use [this grading rubric][git5].

[git1a]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/energy01.csv
[git2a]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/energy02.tsv
[git3a]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/energy03.txt
[git4a]: https://raw.githubusercontent.com/pmean/introduction-to-SAS/master/data/energy04.csv

[git1b]: https://github.com/pmean/introduction-to-SAS/blob/master/data/energy01-data-dictionary.yaml
[git2b]: https://github.com/pmean/introduction-to-SAS/blob/master/data/energy02-data-dictionary.yaml
[git3b]: https://github.com/pmean/introduction-to-SAS/blob/master/data/energy03-data-dictionary.yaml
[git4b]: https://github.com/pmean/introduction-to-SAS/blob/master/data/energy04-data-dictionary.yaml

[git5]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

#### Quiz03

Graded: 3 points, one point deducted if submitted late.

Not yet available.

