* Part00. Documentation header

m04-5507-simon-categorical-variables
author: Steve Simon
Date created: 2018-10-22

Purpose: To illustrate how to work with datasets
with mostly continuous variables.

License: public domain

;

* Notes00. This is the standard documentation header;

* Part01. Tell SAS where to find and store things;

options papersize=(6 in 4 in); * needed to have the output fit on PowerPoint;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/m04-5507-simon-categorical.pdf";

filename raw_data
  "&path/data/titanic_v00.txt";

libname perm
  "&path/data";

* Notes01. The filename statement tells you where
the raw data is stored. The libname statement
tells you where SAS will store any permanent 
datsets. The ods statement tells you that SAS is 
going to store the results with a particular 
filename and in pdf format.;

* Part02. Reading using  proc import;

proc import
    datafile=raw_data
    out=perm.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

* Notes02. As a general rule, proc import works 
best for simple delimited files where the first
row contains the variable names. With complicated 
text files (such as files where the data for an 
individual extends across more than one line) or 
files without variable names in the first row are 
usually better handled by a data step.;

* Part03. Pring the first ten lines;

proc print
    data=perm.titanic(obs=10);
  title1 "The first ten rows of the Titanic dataset";
run;

* Notes03. It's always a good idea to peek at the 
first few rows of data.

If you look at the first few rows of data, you 
will see that the import went reasonably well. It 
is not always this easy. Do take notice that age 
is left justified. It is caused by a number of 
"NA" codes for missing values. You don't see it 
here, but if you print a few more observations, 
you can see the "NA" values. It would have been 
easier to anticipate these ahead of time, but 
we'll fix things up after the fact.;

* Part04. Counts, proc freq;

proc freq
    data=perm.titanic;
  table PClass Sex Survived;
  title1 "Frequency counts for categorical variables";
run;

* Notes04. For any categorical variables, your 
first step is to get frequency counts.

There is a mix of three passenger classes, with a 
lot more in third class. There are also a lot 
more men than women.

The survived variable is a number code. You 
should look at the data dictionary to find out 
that 1=survived and 2=died. Only about a third of 
the passengers survived.;

* Part05. Convert string to numeric, data step;

data perm.titanic;
  set perm.titanic;
  age_c = input(age, ?? 8.);
run;

proc means
    n nmiss mean std min max
    data=perm.titanic;
  var age_c;
  title1 "Descriptive statistics for age";
run;

* Notes05. For the one continuous variable (age) 
you need to convert the code "NA" to the SAS 
missing value code, which is a dot. The easiest 
way to do this is to force the data to numeric 
with a simple arithmetic equation like adding a 
zero. But you get a warning message for each 
occurence of NA, which can get tedious. The input 
function with two question marks avoids this 
issue.

The numeric variable, age_c, can now be analyzed using proc means. The average age is about 30, and there are a large number of missing values.;

* Part06. Using proc format to code categorical data;

proc format;
  value f_survived
    0 = "No"
  	1 = "Yes";
run;

proc freq
    data=perm.titanic;
  tables Survived;
  format Survived f_survived.;
  title1 "Frequency counts for survived using labels";
run;

* Notes06. For variables like Survived which are 
numbers, but the numbers represent a particular 
category, you can document this using a format 
statement.

It is almost always a good idea to attach labels 
to any categorical variable using number codes. 
It makes your output more readable and avoids any 
confusion or mixing up the codes.;

* Part07. Bar charts, proc sgplot;

proc sgplot
    data=perm.titanic;
  vbar Survived;
  format Survived f_survived.;
  title1 "Bar chart for number surviving";
run;

* Notes07. ;

* Part08. Percentages for bar chart;

proc freq
    data=perm.titanic;
  tables Survived / noprint out=pct_survived;
run;

proc sgplot
    data=pct_survived;
  vbar Survived / response=Percent;
  yaxis max=100;
  format Survived f_survived.;
  title1 "Bar chart for percent surviving";
run;

* Notes08. ;

* Part09. Crosstabulation;

proc freq
    data=perm.titanic;
  tables Sex*Survived / nocol nopercent;
  format Survived f_survived.;
  title1 "Crosstabulation with row percentages";
run;

* Notes09. ;

* Part10. Converting a continuous variable to categorical;

data age_categories;
  set perm.titanic;
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

* Notes10. ;

* Part11. Quality check;

proc sort
    data=age_categories;
  by age_cat;
run;

proc means
    min max
    data=age_categories;
  by age_cat;
  var age_c;
  title1 "Quality check for conversion";
run;

* Notes11. ;

* Part12. Controlling the display order;

data age_codes;
  set perm.titanic;
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

* Notes12. ;

* Part13. With number codes, use proc format;

proc format;
  value f_age
    1 = "toddler"
  	2 = "pre-teen"
  	3 = "teenager"
  	4 = "adult"
  	9 = "unknown";
run;

* Notes13. ;

* Part14. Quality check;

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

* Notes14. ;

* Part15. Modifying a categorical variable;

data first_class;
  set perm.titanic;
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

* Notes15. ;

* Part16. End of program;
