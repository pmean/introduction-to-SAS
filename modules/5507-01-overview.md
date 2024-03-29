---
title: "MEDB 5507, Introduction to SAS, Module01, Overview"
authors: Steve Simon
date: Created 2022-05-23
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../results", output_format = "all") }) 
---

### Synopsis

I recommend that you run SAS using a free product called [SAS OnDemand for Academics][sas-ondemand]. More details about this are on the Canvas site for this class.

You can also run SAS directly on your computer if you are fortunate enough to have it. It can be installed on computers that are hard-wired into the UMKC network, but usually cannot be installed on laptops or home computers. See [this page][direct-install] for more details. 

You can run SAS at the [student computing lab][student-labs] in Royall Hall 303, Lab #17 and #38.

You can also run SAS using the [UMKC Remote Labs][remote-labs]. If you use the student computing lab or the remote labs, you need to store your work on a network folder, often assigned as the Q drive. If you have trouble access in the Q drive, here is a [handout][q-drive] that can help.

You may have heard about a system called SAS University that ran inside a virtual machine; this approach is being phased out. 

There are also ways to run SAS in a Jupyter notebook or as part of a Markdown document. These are options best reserved for the advanced SAS user. See the recommended readings if you are curious.

Choose whatever way is easiest for you to run SAS.

You can also find all the datasets and programs on [my github site][github].

You should start out slowly. There is a very small SAS program that I show. See if you can copy the program (changing my name to your name) and get it to run. If it runs, try adding a documentation header. Then see if you can store the data in a permanent location. See if you can store the output as a PDF file. Finally, see if you can move the data to a separate location.

Although I am giving you a lot of time, please don't delay on this first homework assignment. Getting a program to run--any program can be the hardest part of this class. Everything is new and there are a lot of subtle details that are easy to overlook. Try your best, but if you can't get the basic program to work, set up an appointment to talk to me.

### Learning objectives

In this module, you will learn

+ to understand the historical roots of the SAS program.
+ to identify an access method for SAS that works for you.

You will also see the following SAS keywords and procedures

+ data
+ datalines
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

+ Slides and speaker notes, available in [pdf format][v01-pdf] or [powerpoint format][v01-pptx].

Datasets used in this module

+ [six-numbers.txt][git1]

Programs used in this module

+ [5507-01-simon-basic-program.sas][basic-program]
+ [5507-01-simon-documentation-header.sas][documentation-header]
+ [5507-01-simon-permanent-storage.sas][permanent-storage]
+ [5507-01-simon-re-use.sas][re-use]
+ [5507-01-simon-read-data.sas][read-data]
+ [5507-01-simon-save-output.sas][save-output]

Recommended readings

+ SAS Institute. Explore the SAS workspace (1 of 8). Available in [html format][workspace].
+ Hemedinger, Chris. How to run SAS programs in Jupyter Notebook, The SAS Dummy blog, 2016-04-24. Available in [html format][jupyter].
+ Hemken, Doug. SAS Using R Markdown (Windows). Available in [html format][markdown].

### Videos

Total video time, 199 minutes. All videos are in Panopto format.

There are two types of videos in this class. The most common is a PowerPoint video. In these videos, I display PowerPoint slides and talk. My comments are captured, more or less, in the speaker's notes. Every PowerPoint video should have an associated pdf file with the slides and speaker notes. For a few of these videos, I have abandoned PowerPoint for a live demonstration on my computer. This will show me typing into SAS or possibly other application software. There are no pdf files for the live demonstrations.

+ [V01-01][2022b-5507-v01-01] ( 5 minutes). Introducing your instructor.
+ [V01-02][2022b-5507-v01-02] (13 minutes). Where you can get SAS.
+ [V01-03][2022b-5507-v01-03] ( 7 minutes). Your first SAS program.
+ [V01-04][2022b-5507-v01-04] (11 minutes). SAS live demonstration (SODA).
+ [V01-05][2022b-5507-v01-05] (14 minutes). SAS live demonstration (Remote labs).
+ [V01-06][2022b-5507-v01-06] ( 5 minutes). SAS live demonstration (SAS on UMKC computers).
+ [V01-07][2022b-5507-v01-07] (10 minutes). History of SAS.
+ [V01-08][2022b-5507-v01-08] ( 5 minutes). Documentation header.
+ [V01-09][2022b-5507-v01-09] ( 9 minutes). SAS live demonstration (SODA).
+ [V01-10][2022b-5507-v01-10] (14 minutes). SAS live demonstration (Remote labs).
+ [V01-11][2022b-5507-v01-11] ( 7 minutes). Storing SAS datasets using libname.
+ [V01-12][2022b-5507-v01-12] (11 minutes). SAS live demonstration (SODA).
+ [V01-13][2022b-5507-v01-13] ( 8 minutes). SAS live demonstration (SODA).
+ [V01-14][2022b-5507-v01-14] (16 minutes). SAS live demonstration (Remote labs).
+ [V01-15][2022b-5507-v01-15] ( 8 minutes). Storing SAS output using ODS.
+ [V01-16][2022b-5507-v01-16] (16 minutes). SAS live demonstration (SODA).
+ [V01-16][2022b-5507-v01-17] (16 minutes). SAS live demonstration (Remote labs).
+ [V01-18][2022b-5507-v01-18] ( 5 minutes). Reading external data using infile and filename.
+ [V01-19][2022b-5507-v01-19] (12 minutes). SAS live demonstration (SODA).
+ [V01-20][2022b-5507-v01-20] (13 minutes). SAS live demonstration (Remote labs).

[2022b-5507-v01-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=427181d2-3d15-49ad-be3e-aeaa0125d864
[2022b-5507-v01-02]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=81b1ffc7-5f95-4bbc-8382-aeaa0133a34e
[2022b-5507-v01-03]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=0b6f7a9b-73b4-4616-85b1-aeaa0138229d 
[2022b-5507-v01-04]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=09759e48-1dd9-4f93-8676-aeaa01750cd8
[2022b-5507-v01-05]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=5e712ad5-ca5f-4f02-a25f-aeaa016f69fe
[2022b-5507-v01-06]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=80595ffc-4395-4850-a226-aeaa017399b0
[2022b-5507-v01-07]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=5be9d52d-cf63-45ef-becf-aeac011c2989
[2022b-5507-v01-08]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=4101600e-be64-41a2-8e54-aeac011fc0f8
[2022b-5507-v01-09]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=21061974-310b-4854-b90d-aeac0124049d
[2022b-5507-v01-10]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=95c2d24c-3041-4241-a6c4-aeac01278eae
[2022b-5507-v01-11]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=fe24206d-e3d9-4ed6-85a4-aeac012c69c5
[2022b-5507-v01-12]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=edf65720-3825-4548-be15-aeac0134cceb
[2022b-5507-v01-13]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=3ab9c592-0319-4338-9233-aeac013849e2
[2022b-5507-v01-14]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=a21cc5fd-c77b-4c6d-9605-aeac013badb5
[2022b-5507-v01-15]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=30a6ba36-b15e-4645-9e4e-aead01567d74
[2022b-5507-v01-16]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=9cee357a-45fb-4040-8ae5-aead015902c6
[2022b-5507-v01-17]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=2a15ad1d-5098-423c-8846-aead015e7e45
[2022b-5507-v01-18]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=041b68df-3be6-4b14-878c-aeaf0158e579
[2022b-5507-v01-19]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1a0249ed-3d51-4a4a-9fe8-aeaf015abc6b
[2022b-5507-v01-20]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=b480957f-b059-47f2-b89f-aeaf015e9479

### Active learning

There is

+ a discussion board,
+ a homework assignment, and
+ a short quiz.

#### Discussion01. Introduce yourself

Please briefly introduce yourself. Tell us a bit about yourself professionally, and optionally tell us one thing that is not related to your work or your career. Let us know what your preferred pronouns are. Also optional, but greatly appreciated, would be a picture of yourself.

#### HW01. Run a basic SAS program

Graded: 20 points, one point deducted if submitted late.

Take the code in [5507-01-simon-basic-program.sas][basic-program] and run it on your system. Be sure to change "simon" to your name. Optionally, and only if you can, include a documentation header, store the dataset in a permanent location, save your output in a pdf file, and/or read the data from a separate file.

If you get an error message that you can't fix, submit your code and document that error message in the text box. You will get full credit for any reasonable attempt to get the program to run. Future assignments will use [this grading rubric][grading-rubric]. If your program ran successfully, describe your difficulties (if any) in getting the program to run in the text box.

[basic-program]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-basic-program.sas

[direct-install]: https://www.umkc.edu/is/support/services/software/sitelicensed/SAS/Index.asp
[documentation-header]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-documentation-header.sas

[github]: https://github.com/pmean/introduction-to-SAS
[git1]: https://github.com/pmean/introduction-to-SAS/blob/master/data/six-numbers.txt
[grading-rubric]: https://github.com/pmean/classes/blob/master/software-engineering/src/grading-rubric.md

[jupyter]: https://blogs.sas.com/content/sasdummy/2016/04/24/how-to-run-sas-programs-in-jupyter-notebook/

[markdown]: https://www.ssc.wisc.edu/~hemken/SASworkshops/Markdown/SASmarkdown.html

[permanent-storage]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-permanent-storage.sas

[q-drive]: https://github.com/pmean/introduction-to-sql/blob/master/results/m01-lost-drive.pdf

[re-use]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-re-use.sas
[read-data]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-read-data.sas
[remote-labs]: https://www.umkc.edu/is/remotelabs/

[sas-ondemand]: https://www.sas.com/en_us/software/on-demand-for-academics.html
[save-output]: https://github.com/pmean/introduction-to-sas/blob/master/src/5507-01-simon-save-output.sas

[student-labs]: https://www.umkc.edu/is/labs/software/

[v01-01]: https://umsystem.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=700eeac6-121e-46d6-a080-ad4500e4c370
[v01-pdf]: https://github.com/pmean/introduction-to-sas/blob/master/results/5507-01-simon-slides-and-speaker-notes.pdf
[v01-pptx]: https://github.com/pmean/introduction-to-SAS/blob/master/results/5507-01-simon-sildes-and-speaker-notes.pptx?raw=true

[workspace]: http://support.sas.com/training/sas94/m3_1.htm
