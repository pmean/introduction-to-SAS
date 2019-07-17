options papersize=(8in 4in) nodate;
proc printto log="lecture02.log" new; run;

* lecture03.sas
  written by Steve Simon
  November 27, 2018;

ods pdf
  file="lecture03.pdf";

filename fev
  "../data/fev.txt";

libname intro
  "../data";

********* ********* ********* *********
Today, you will analyze some data sets
that have a mix of categorical and 
continuous variables. The first data 
set looks at pumonary function in a
group of children.

You can find a description of this data set at

  http://jse.amstat.org/datasets/fev.txt
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

proc print
    data=intro.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title1 "Pulmonary function study";
  title2 "Partial listing of fev data";
run;

* There is a mix of categorical and continuous 
  variables in this data set. Recall that you 
  use proc freq for categorical variables and
  proc means for continuous variables.
;

proc freq
    data=intro.fev;
  tables sex smoke / missing;
  title2 "Frquency counts";
run;

proc means
    data=intro.fev;
  var age fev ht;
  title2 "Descriptive statistics";
run;

* The Pearson correlation coefficient gives you 
  a numeric measure of the strength of association
  between two continuous variables.
;

proc corr
    data=intro.fev;
  var age fev ht;
run;

* You should also examine the association between
  continuous variables using a scatterplot
;
   
proc sgplot
    data=intro.fev;
  scatter x=age y=fev;
  title2 "Scatterplots";
run;

proc sgplot
    data=intro.fev;
  scatter x=ht y=fev;
run;

* When you want to look at a relationship between 
  a categorical variable and a continuous 
  variable, you should use a boxplot.
;

proc sgplot
    data=intro.fev;
  vbox fev / category=smoke;
  title2 "Boxplots";
run;

* Also look at how the means and standard
  deviations of your continuous variable change
  for each level of your categorical variable.
;

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

* This is very odd. You can get a hint as to why 
  smokers might have higher fev values than 
  non-smokers by looking at how age and smoking
  status are related.
;

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

* You should also examine the relationship
  between sex and fev. Do this on your own, but
  there is no need to torn anything in. 
;

* Your homework assignment will use a data set of
  housing prices and factors that influence the
  price.
;

proc import
    datafile="&path/data03/housing.txt"
    out=intro.housing
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

proc print
    data=intro.housing(obs=10);
  title1 "Partial listing of housing data";
run;

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
  
  1. Convert the asterisks in the AGE and TAX
     variables to missing. How many missing
     values are there for AGE and for TAX?

  2. Create factors for NE, CUST, and COR.
     Draw bar charts for each of these factors.

  3. Find the largest house (biggest SQFT) in the
     data set. Is the largest house also the most
     expensive house?

  4. Calculate frequency counts for FEATS. Are
     there any houses with the no features? Are
     there any houses with every possible feature?

  5. Evaluate the relationship between PRICE and
     SQFT using a scatterplot. Include a smooth 
     curve. Do larger houses tend to cost more?

  6. Evaluate the relationship between CUST and
     PRICE using a boxplot. Calculate the mean
     price and standard deviation by CUST.

  7. What is the difference in average prices
     between northeast houses and other houses?
     What is the difference in average taxes?

  8. Are custombuilt houses more likely to appear
     on corner lots? Calculate the percentages and
     compute a relative risk.
;

ods pdf close;

