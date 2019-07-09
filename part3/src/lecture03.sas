options papersize=(8in 4in) nodate;
proc printto log="lecture03.log" new; run;

* lecture03.sas
  written by Steve Simon
  November 27, 2018;

********* ********* ********* *********
1. Overview of this week's lecture

Today, you will analyze some data sets that
have a mix of categorical and continuous
variables. The first data set looks at 
pumonary function in a group of children.
You can find a description of this data set at

http://jse.amstat.org/datasets/fev.txt
********* ********* ********* *********;


********* ********* ********* *********
2. Location of outputs and data sets

You've seen this code before. It tells
SAS where to place the output, where
to find the raw data and where to store
any of its own data sets.
********* ********* ********* *********;

ods pdf
  file="lecture03.pdf";

filename rawdata
  "../data/fev.txt";

libname intro
  "../data";

********* ********* ********* *********
3. Import the data

Since the variables are listed in the
first line of code, you could use
proc import. But with a small number
of variables, using a data step is
almost as easy.
********* ********* ********* *********;

data intro.fev;
  infile fev delimiter="," firstobs=2;
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
4. Add formats

Use formats for the two categorical
variables and then print the first ten
rows.
********* ********* ********* *********;

proc format;
  value fsex
    0 = "Female"
    1 = "Male";
  value fsmoke
    0 = "Nonsmoker"
    1 = "Smoker";
run;

proc print
    data=intro.fev(obs=10);
  format sex fsex. smoke fsmoke.;
  title1 "Pulmonary function study";
  title2 "Partial listing of fev data";
run;

********* ********* ********* *********
5. Descriptive statistics

There is a mix of categorical and 
continuous variables in this data set. 
Recall that you use proc freq for 
categorical variables and proc means 
for continuous variables.
********* ********* ********* *********;

proc freq
    data=intro.fev;
  tables sex smoke / missing;
  title2 "Frquency counts";
run;

proc means
    n nmiss mean std min max
    data=intro.fev;
  var age fev ht;
  title2 "Descriptive statistics";
run;

********* ********* ********* *********
6. Correlation, proc corr

The Pearson correlation coefficient 
gives you a numeric measure of the 
strength of association between two
continuous variables.
********* ********* ********* *********;

proc corr
    data=intro.fev;
  var age fev ht;
run;

********* ********* ********* *********
7. Scatterplot, proc sgplot

You should also examine the association
between continuous variables using a 
scatterplot.
********* ********* ********* *********;
   
proc sgplot
    data=intro.fev;
  scatter x=age y=fev;
  title2 "Scatterplots";
run;

proc sgplot
    data=intro.fev;
  scatter x=ht y=fev;
run;

********* ********* ********* *********
8. Boxplot, proc sgplot

When you want to look at a relationship
between a categorical variable and a 
continuous variable, you should use a 
boxplot.
********* ********* ********* *********;

proc sgplot
    data=intro.fev;
  vbox fev / category=smoke;
  title2 "Boxplots";
run;

********* ********* ********* *********
9. Means by group

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
  title2 "Descriptive statistics by group";
run;

********* ********* ********* *********
10. Investigate unusual association

This is very odd. You can get a hint as
to why smokers might have higher fev 
values than non-smokers by looking at 
how age and smoking status are related.

You should also examine the relationship
between sex and fev. Do this on your own, but
there is no need to turn anything in. 
********* ********* ********* *********;

proc sgplot
    data=intro.fev;
  vbox age / category=smoke;
  title2 "Boxplots";
run;

proc means
    data=intro.fev;
  var age;
  by smoke;
  title2 "Descriptive statistics by group";
run;

ods pdf close;

********* ********* ********* *********;

proc printto; run;
