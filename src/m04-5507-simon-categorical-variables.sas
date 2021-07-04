/************************************************

m04-5507-simon-categorical-variables
author: Steve Simon
Date created: 2018-10-22

Purpose: To illustrate how to work with datasets
with mostly continuous variables.

License: public domain

************************************************/

* Part01. Tell SAS where to find and store things.;

options papersize=(6 in 4 in); * needed to have the output fit on PowerPoint;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/m04-5507-simon-categorical.pdf";

filename raw_data
  "&path/data/titanic_v00.txt";

libname intro
  "&path/data";

* Part02. Reading using  proc import;

proc import
    datafile=raw_data
    out=intro.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

* Part03. Pring the first ten lines.;

proc print
    data=intro.titanic(obs=10);
  title1 "The first ten rows of the Titanic dataset";
run;


* Part04. Counts, proc freq.;

proc freq
    data=intro.titanic;
  table PClass Sex Survived;
run;

* Part05. Convert string to numeric, data step.;

data intro.titanic;
  set intro.titanic;
  age_c = input(age, ?? 8.);
run;

proc means
    n nmiss mean std min max
    data=intro.titanic;
  var age_c;
run;

* Part06. Using proc format to code categorical data,;

proc format;
  value f_survived
    0 = "No"
	1 = "Yes";
run;

proc freq
    data=intro.titanic;
  tables Survived;
  format Survived f_survived.;
run;

* Part07. Bar charts, proc sgplot.;

proc sgplot
    data=intro.titanic;
  vbar Survived;
  format Survived f_survived.;
run;

* Part08. Percentages for bar chart.;

proc freq
    data=intro.titanic;
  tables Survived / noprint out=pct_survived;
run;

proc print
    data=pct_survived;
  format Survived f_survived.;
run;

proc sgplot
    data=pct_survived;
  vbar Survived / response=Percent;
  yaxis max=100;
  format Survived f_survived.;
run;

* Part09. Crosstabulation.;

proc freq
    data=intro.titanic;
  tables Sex*Survived / nocol nopercent;
  format Survived f_survived.;
run;

* Part10. Converting a continuous variable to categorical.;

data age_categories;
  set intro.titanic;
  if age_c = .
    then age_cat = "missing ";
  else if age_c < 6 
    then age_cat = "toddler ";
  else if age_c < 13
    then age_cat = "pre-teen";
  else if age_c < 21
    then age_cat = "teenager";
  else age_cat   = "adult   ";
run;

* Part11. Quality check.;

proc sort
    data=age_categories;
  by age_cat;
run;

proc means
    min max
    data=age_categories;
  by age_cat;
  var age_c;
run;

* Part12. Controlling the display order.;

data age_codes;
  set intro.titanic;
  if age_c = .
    then age_cat = 9;
  else if age_c < 6 
    then age_cat = 1;
  else if age_c < 13
    then age_cat = 2;
  else if age_c < 21
    then age_cat = 3;
  else age_cat = 4;
run;

* Part13. With number codes, use proc format.;

proc format;
  value f_age
    1 = "toddler"
  	2 = "pre-teen"
  	3 = "teenager"
  	4 = "adult"
  	9 = "unknown";
run;

* Part14. Quality check.;

proc sort
    data=age_codes;
  by age_cat;
run;

proc means
    min max
    data=age_codes;
  by age_cat;
  var age_c;
  format age_cat f_age.;
run;

* Part15. Modifying a categorical variable.;

data first_class;
  set intro.titanic;
  if PClass = "1st"
    then first_class = "Yes";
	else first_class = "No";
run;

proc freq
    data=first_class;
  table PClass*first_class / 
    norow nocol nopercent;
run;

ods pdf close;

* End of program;
