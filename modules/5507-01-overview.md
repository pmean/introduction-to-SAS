---
title: "MEDB 5507, Introduction to SAS, Module01, Overview"
authors: Steve Simon
date: Created 2022-05-23
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

I recommend that you run SAS using a free product called [SAS OnDemand for Academics][sas1]. More details about this are on the Canvas site for this class.

You can also run SAS directly on your computer if you are fortunate enough to have it. It can be installed on computers that are hard-wired into the UMKC network, but usually cannot be installed on laptops or home computers. See [this page][umkc2] for more details. 

You can run SAS at the student computing lab in Royall Hall 3003, Lab #17 and #38.

You can also run SAS using the [UMKC Remote Labs][umkc1].

Choose whatever way is easiest for you to run SAS.

You can also find all the datasets and programs on [my github site][sim01].

You should start out slowly. There is a very small SAS program that I show. See if you can copy the program (changing my name to your name) and get it to run. If it runs, try adding a documentation header. Then see if you can store the data in a permanent location. See if you can store the output as a PDF file. Finally, see if you can move the data to a separate location.

Although I am giving you a lot of time, please don't delay on this first homework assignment. Getting a program to run--any program can be the hardest part of this class. Everything is new and there are a lot of subtle details that are easy to overlook. Try your best, but if you can't get the basic program to work, set up an appointment to talk to me.

### Learning objectives

In this module, you will learn

+ to understand the historical roots of the SAS program.
+ to identify an access method for SAS that works for you.

You will also see the following SAS keywords and procedures

+ cards
+ data
+ delimiter
+ filename
+ infile
+ input
+ ods
+ proc print
+ run
+ title

### Reading and Resources

Handouts associated with videos

+ Slides and speaker notes, available in [pdf format][sim4] or [powerpoint format][sim5].

Programs used in this module

+ [5507-01-simon-basic-program.sas][sim02]
+ [5507-01-simon-documentation-header.sas][sim03]
+ [5507-01-simon-input-text.sas][sim04]
+ [5507-01-simon-permanent-storage.sas][sim05]
+ [5507-01-simon-re-use.sas][sim06]
+ [5507-01-simon-read-data.sas][sim07]
+ [5507-01-simon-save-output.sas][sim08]

Recommended readings

+ Hemedinger, Chris. How to run SAS programs in Jupyter Notebook, The SAS Dummy blog, 2016-04-24. Available in [html format][r01].
+ Hemken, Doug. SAS Using R Markdown (Windows). Available in [html format][r02].
+ SAS Institute. Explore the SAS workspace (1 of 8). Available in [html format][r03].
+ SAS Institute. SAS University Edition. Available in [html format][r04].
+ Simon, Stephen. Help! My Q: drive disappeared! Available in [pdf format][r05].
+ UMKC. Site-Licensed Software, SAS for Windows. Available in [html format][r06].

[r01]: https://blogs.sas.com/content/sasdummy/2016/04/24/how-to-run-sas-programs-in-jupyter-notebook/
[r02]: https://www.ssc.wisc.edu/~hemken/SASworkshops/Markdown/SASmarkdown.html
[r03]: http://support.sas.com/training/sas94/m3_1.htm
[r04]: https://www.sas.com/en_us/software/university-edition.html
[r05]: https://github.com/pmean/introduction-to-sql/blob/master/results/m01-lost-drive.pdf
[r06]: https://www.umkc.edu/is/support/services/software/siteLicensed/SAS/Index.asp

### Videos

Total video time, xx minutes

There are two types of videos in this class. The most common is a PowerPoint video. In these videos, I display PowerPoint slides and talk. My comments are captured, more or less, in the speaker's notes. Every PowerPoint video should have an associated pdf file with the slides and speaker notes. For a few of these videos, I have abandoned PowerPoint for a live demonstration on my computer. This will show me typing into SAS or possibly other application software. There are no pdf files for the live demonstrations.

+ V01-01. Introducing your instructor, 3 minutes, available in [Panopto format][2021b-5507-v01-01].
+ V01-02. Where you can get SAS, xx minutes, available soon in Panopto format.
+ V01-03. Your first SAS program, xx minutes, available soon in Panopto format.
+ V01-04. SAS live demonstration (1 of 5), xx minutes, available soon in Panopto format.
+ V01-05. History of SAS, xx minutes, available soon in Panopto format.
+ V01-06. Documentation header, xx minutes, available soon in Panopto format.
+ V01-07. SAS live demonstration (2 of 5), xx minutes, available soon in Panopto format.
+ V01-08. Storing SAS datasets using libname, xx minutes, available soon in Panopto format.
+ V01-09. SAS live demonstration (3 of 5), xx minutes, available soon in Panopto format.
+ V01-10. Storing SAS output using ODS, xx minutes, available soon in Panopto format.
+ V01-11. SAS live demonstration (4 of 5), xx minutes, available soon in Panopto format.
+ V01-12. Reading external data using infile and filename, xx minutes, available soon in Panopto format. 
+ V01-13. SAS live demonstration (5 of 5), xx minutes, available soon in Panopto format.

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion01. Introduce yourself

Please briefly introduce yourself. Tell us a bit about yourself professionally, and optionally tell us one thing that is not related to your work or your career. Let us know what your preferred pronouns are. Also optional, but greatly appreciated, would be a picture of yourself.

#### HW01. Run a basic SAS program

Graded: 20 points, one point deducted if submitted late.

Take the code in [5507-01-simon-basic.sas][sim02] and run it on your system. Be sure to change "simon" to your name. Optionally, and only if you can, include a documentation header, store the dataset in a permanent location, save your output in a pdf file, and/or read the data from a separate file.

If you get an error message that you can't fix, submit your code and document that error message in the text box. You will get full credit for any reasonable attempt to get the program to run. Future assignments will use [this grading rubric][sim3]. If your program ran successfully, describe your difficulties (if any) in getting the program to run in the text box.

[umkc1]: https://www.umkc.edu/is/support/services/software/sitelicensed/SAS/Index.asp
[umkc2]: https://www.umkc.edu/is/remotelabs/

[sas1]: https://www.sas.com/en_us/software/on-demand-for-academics.html

[sim01]: https://github.com/pmean/introduction-to-SAS
[sim02]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-basic-program.sas
[sim03]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-documentation-header.sas
[sim04]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-input-text.sas
[sim05]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-permanent-storage.sas
[sim06]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-re-use.sas
[sim07]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-read-data.sas
[sim08]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-save-output.sas



[sim3]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md
[sim4]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-01-simon-slides-and-speaker-notes.pdf
[sim5]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-01-simon-sildes-and-speaker-notes.pptx?raw=true

[2021b-5507-v01-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=700eeac6-121e-46d6-a080-ad4500e4c370