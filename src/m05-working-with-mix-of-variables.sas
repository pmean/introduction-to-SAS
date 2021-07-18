* Part00. Documentation header

m05-working-with-a-mix-of-variables.sas
author: Steve Simon
date created: 2018-11-27

purpose: to illustrate how to work with
data that has a mix of categorical and
continuous variables.

license: public domain;

* Notes00 This is the standard documentation header.;

* Part01. Tell SAS where to find and store things.;

options papersize=(6in 4in); 
* This needed to have the output fit on PowerPoint;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/m05-5507-simon-mix.pdf";

filename raw_data
  "&path/data/fev.txt";

libname perm
  "&path/data";

* Notes01. You should already be familiar with 
this. The filename statement tells you where
the raw data is stored. The libname statement
tells you where SAS will store any permanent 
datsets. The ods statement tells you that SAS is 
going to store the results with a particular 
filename and in pdf format.

Today, you will analyze some data sets
that have a mix of categorical and 
continuous variables. The first data 
set looks at pulmonary function in a
group of children.

You can find a description of this data set at

  http://jse.amstat.org/datasets/fev.txt

;

* Part02. Label your categorical variables;

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

* Notes02. There are several categorical
variables in this data set with number codes,
so you should define labels for those codes.;

* Part03. Reading the data using a data step;

data perm.fev;
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

* Notes03. The data file is comma delimited and
the first row includes variable names.

Normally, this means that you can save a bit of
time by using proc import, but I chose to read
in the data using a data step. The number of 
variables was so small that this didn't matter
that much. It also allowed me to define 
variable labels in the initial data step rather
than later.;

* Part04. Print the first ten rows of data;

proc print
    data=perm.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title1 "Pulmonary function study";
  title2 "Partial listing of fev data";
run;

* Notes04. It's always a good idea to peek at
the first few rows of data.

Output, page 1. There is no obvious problems 
with this dataset.;

* Part05. Proc freq and proc means;

proc freq
    data=perm.fev;
  tables sex smoke / missing;
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title2 "Frequency counts";
run;

proc means
    n nmiss mean std min max
    data=perm.fev;
  var age fev ht;
  title2 "Descriptive statistics";
run;

* Notes05. There is a mix of categorical and 
continuous variables in this data set. Recall
that you use proc freq for categorical
variables and proc means for continuous 
variables. Always get in the habit of checking for
missing values.

Output, page 2. Look for problems. This could mean
a lot more categories than you expected, a 
particular category level that is unexpectedly
small, or multiple categories caused by 
misspelling or inconsistent capitalization. There
are no problems here.

Output, page 3. Look for minimum or maximum values 
that are unusual. Also make sure that you don't have
a continuous variable that is constant (zero
variation).;

* Part06. Pearson correlation, proc corr;

title2 "Correlations";
proc corr
    nosimple noprob
    data=perm.fev;
  var age fev ht;
run;

* Notes06. The Pearson correlation coefficient 
gives you a numeric measure of the 
strength of association between two
continuous variables.

* Output, page 4. Remember the cut-offs. A
correlation between +0.7 and 1.0 implies a
strong positive association. A correlation 
between +0.3 and +0.7 implies a weak positive
association. A correlation between -0.3 and
+0.3 implies little or no association. A
correlation between -0.3 and -0.7 implies a
weak negative association. A correlation
between -0.7 and -1.0 implies a strong
negative association.;

* Part07. Scatterplot, proc sgplot

title2 "Scatterplots";
proc sgplot
    data=perm.fev;
  scatter x=ht y=fev;
run;

* Notes07. You should also examine the association
between continuous variables using a scatterplot.

Output, page 5. I am only showing the plot of ht
versus fev, but you should also examine the plot
of age versus fev.;

* Part08. Scatterplot, smoothing curve

title3 "with loess, smooth=0.1";
proc sgplot
    data=perm.fev;
  scatter x=ht y=fev;
  loess x=ht y=fev / 
    nomarkers 
    smooth=0.1
    lineattrs=(color=Red);
run;

* Notes08. Sometimes a trend line can help. You
should consider a smoothing method like loess or 
pbspline, as this will help you visualize any
potential nonlinear relationships.

Output, page 6. The relationship looks reasonably
close to linear.;

* Part09. Boxplot, proc sgplot

title2 "Boxplots";
proc sgplot
    data=perm.fev;
  vbox fev / category=smoke;
  format smoke fsmoke.;
run;

* Notes09. When you want to look at a relationship
between a categorical variable and a continuous
variable, you should use a boxplot. Notice that
you use proc sgplot for both a scatterplot and a 
boxplot. This is a big improvement over previous
methods in SAS to produce plots because it is 
easier to learn one procedure and minor variations
in that procedure rather than having to learn
multiple procedures.

Output, page 7. The bottom and top of the boxplot
represents the 25th and 75th percentiles,
respectively. A thin line, or whisker, is drawn
down to the minimum value and up to the maximum
value. Extreme values are shown as individual
data points. Notice the discrepancy in fev.
Smokers seem to have a much higher FEV than
non-smokers. This is quite surprising.;

* Part10. Descriptive statistics, by statement;

proc sort
    data=perm.fev;
  by smoke;
run;

proc means
    data=perm.fev;
  var fev;
  by smoke;
  format smoke fsmoke.;
  title2 "Descriptive statistics by group";
run;

* Notes10. Also look at how the means and standard
deviations of your continuous variable change for
each level of your categorical variable.

Output, page 8. Notice again the discrepancy in 
fev by smoking status. This is quite surprising.;


* Part11. Investigate unusual trend, proc sgplot and means;

proc sgplot
    data=perm.fev;
  vbox ht / category=smoke;
  format smoke fsmoke.;
  title2 "Boxplots";
run;

proc sort
    data=perm.fev;
  by smoke;
run;

proc means
    data=perm.fev;
  var ht;
  by smoke;
  format smoke fsmoke.;
  title2 "Descriptive statistics by group";
run;

ods pdf close;

* Notes11. This is very odd. You can get a hint as 
to why smokers might have higher fev values than
non-smokers by looking at how height and smoking
status are related.

Output, page 9. Smokers are taller than 
non-smokers, and by quite a bit.

Output, page 10. These statistics show the same
trend. It is obvious that smoking is confined to
mostly older children. And since the older
children are bigger, that may explain the odd
relationship we saw earlier. You should also
examine the relationship between sex and fev.
Do this on your own, but there is no need to 
turn anything in. ;

* Part12. End of program.;

