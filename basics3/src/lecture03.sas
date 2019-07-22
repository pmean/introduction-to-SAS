options papersize=(8in 4in) nodate;
proc printto log="lecture03.log" new; run;

* lecture03.sas
  written by Steve Simon
  November 27, 2018;

********* ********* ********* *********
1. Introduction

Today, you will analyze some data sets
that have a mix of categorical and 
continuous variables. The first data 
set looks at pumonary function in a
group of children.

You can find a description of this data set at

  http://jse.amstat.org/datasets/fev.txt
********* ********* ********* *********;

********* ********* ********* *********
2. Data and output locations

Here are the standard commands to tell
SAS where to find the data, where to
place its own data files and where to
store the output.
********* ********* ********* *********;

filename raw_data
  "../data/fev.txt";

libname intro
  "../data";

ods pdf
  file="lecture03.pdf";

********* ********* ********* *********
3. Labels for categorical data

There are several categorical variables
in this data set with number codes, so
you should define labels for those 
codes.
********* ********* ********* *********;

proc format;
  value fsex
    0 = "Female"
    1 = "Male"
  ;
  value fsmoke
    0 = "Nonsmoker"
    1 = "Smoker"
  ;
run;

********* ********* ********* *********
4. Reading the data using a data step

The data file is comma delimited and
the first row includes variable names.

Normally, this means that you can save
a bit of time by using proc import,
but I chose to read in the data using
a data step. The number of variables
was so small that this didn't matter
that much. It also allowed me to define
variable labels in the initial data
step rather than later.
********* ********* ********* *********;

data intro.fev;
  infile raw_data delimiter="," firstobs=2;
  input age fev ht sex smoke;
  label
    age=Age in years
    fev=Forced Expiratory Volume (liters)
    ht=Height in inches
    sex=Sex
    smoke=Smoking status
  ;
run;

********* ********* ********* *********
5. Print the first ten rows of data

It's alsways a good idea to peek at
the first few rows of data.
********* ********* ********* *********;


title1 "Pulmonary function study";
title2 "Partial listing of fev data";
proc print
    data=intro.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
run;

********* ********* ********* *********
6. Proc freq and proc means

There is a mix of categorical and 
continuous variables in this data set.
Recall that you use proc freq for 
categorical variables and proc means
for continuous variables.

Always get in the habit of checking for
missing values.
********* ********* ********* *********;

title2 "Frequency counts";
proc freq
    data=intro.fev;
  tables sex smoke / missing;
  format 
    sex fsex. 
    smoke fsmoke.
  ;
run;

title2 "Descriptive statistics";
proc means
    n nmiss mean std min max
    data=intro.fev;
  var age fev ht;
run;

********* ********* ********* *********
7. Pearson correlation, proc corr

The Pearson correlation coefficient 
gives you a numeric measure of the 
strength of association between two
continuous variables.
********* ********* ********* *********;

title2 "Correlations";
proc corr
    nosimple noprob
    data=intro.fev;
  var age fev ht;
run;

********* ********* ********* *********
8. Scatterplot, proc sgplot

You should also examine the association
between continuous variables using a 
scatterplot.

I am only showing the plot of ht
versus fev, but you should also
examine the plot of age versus
fev.
********* ********* ********* *********;

title2 "Scatterplots";
proc sgplot
    data=intro.fev;
  scatter x=ht y=fev;
run;

********* ********* ********* *********
9. Scatterplot, smoothing curve

Sometimes a trend line can help. You
should consider a smoothing method
like loess or pbspline, as this will
help you visualize any potential
nonlinear relationships.
********* ********* ********* *********;

title3 "with loess, smooth=0.1";
proc sgplot
    data=intro.fev;
  scatter x=ht y=fev;
  loess x=ht y=fev / 
    nomarkers 
    smooth=0.1
    lineattrs=(color=Red);
run;

********* ********* ********* *********
10. Boxplot, proc sgplot

When you want to look at a relationship
between a categorical variable and a
continuous variable, you should use a
boxplot.

Notice that you use proc sgplot for
both a scatterplot and a boxplot. This
is a big improvement over previous
methods in SAS to produce plots
because it is easier to learn one
procedure and minor variations in that
procedure rather than having to learn
multiple procedures.
********* ********* ********* *********;

title2 "Boxplots";
proc sgplot
    data=intro.fev;
  vbox fev / category=smoke;
  format smoke fsmoke.;
run;

********* ********* ********* *********
11. Descriptive statistics, by statement

Also look at how the means and standard
deviations of your continuous variable
change for each level of your 
categorical variable.
********* ********* ********* *********;

proc sort
    data=intro.fev;
  by smoke;
run;

proc means
    data=intro.fev;
  var fev;
  by smoke;
  format smoke fsmoke.;
  title2 "Descriptive statistics by group";
run;

********* ********* ********* *********
12. Investigate unusual trend, proc sgplot and means

This is very odd. You can get a hint as
to why smokers might have higher fev 
values than non-smokers by looking at 
how age and smoking status are related.
********* ********* ********* *********;

proc sgplot
    data=intro.fev;
  vbox ht / category=smoke;
  format smoke fsmoke.;
  title2 "Boxplots";
run;

proc means
    data=intro.fev;
  var ht;
  by smoke;
  format smoke fsmoke.;
  title2 "Descriptive statistics by group";
run;

********* ********* ********* *********
13. Further investigation on your own

You should also examine the 
relationship between sex and fev. Do 
this on your own, but there is no need
to turn anything in. 
********* ********* ********* *********;


********* ********* ********* *********
Homework assignment (1/5)

Your homework assignment will use a 
data set of housing prices and factors
that influence the price.

Details for this data set can be found
on the DASL web site.
********* ********* ********* *********;

********* ********* ********* *********
Homework assignment (2/5)

+ Read in the data housing.txt. 
  
+ Convert the asterisks in the AGE and TAX
variables to missing. How many missing
values are there for AGE and for TAX?

+ Create factors for NE, CUST, and COR.
Draw bar charts for each of these factors.
********* ********* ********* *********;
     
********* ********* ********* *********
Homework assignment (3/5)

+ Find the largest house (biggest SQFT)
in the data set. Is the largest house
also the most expensive house?

+ Calculate frequency counts for FEATS.
Are there any houses with the no 
features? Are there any houses with 
every possible feature?
********* ********* ********* *********;

********* ********* ********* *********
Homework assignment (4/5)

+ Evaluate the relationship between
PRICE and SQFT using a scatterplot. 
Include a smooth curve. Do larger 
houses tend to cost more?

+ Evaluate the relationship between 
CUST and PRICE using a boxplot. 
Calculate the mean price and standard
deviation by CUST.
********* ********* ********* *********;

********* ********* ********* *********
Homework assignment (5/5)

+ What is the difference in average
prices between northeast houses and 
other houses? What is the difference in
average taxes?

+ Are custombuilt houses more likely to
appear on corner lots? Calculate the 
percentages and compute a relative risk.
********* ********* ********* *********;

proc printto; run;

ods pdf close;

********* ********* ********* *********;

