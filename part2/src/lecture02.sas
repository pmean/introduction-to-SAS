options papersize=(8in 4in) nodate;
proc printto log="lecture02.log" new; run;

* lecture02.sas
  written by Steve Simon
  October 22, 2018;

********* ********* ********* *********
1. Output and data locations

This is the first few lines of SAS 
code, showing where to store the 
output, where to find the input and
where to store the SAS binary data set
the program creates.
********* ********* ********* *********;

ods pdf
  file="lecture02.pdf";

filename raw_data
  "../data/titanic_v00.txt";

libname intro
  "../data";

********* ********* ********* *********
2. Reading, proc import

As a general rule, proc import works 
best for simple delimited files where
the first row contains the variable 
names. With complicated text files 
(such as files where the data for an 
individual extends across more than one
line) or files without variable names
in the first row are usually better 
handled by a data step.
********* ********* ********* *********;

proc import
    datafile=raw_data
    out=intro.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

********* ********* ********* *********
3. First ten lines, proc print

If you look at the first few rows of
data, you will see that the import went
reasonably well. It is not always this
easy. Do take notice that age is left
justified. It is caused by a number of
"NA" codes for missing values. You 
don't see it here, but if you print a
few more observations, you can see the
"NA" values. It would have been easier
to anticipate these ahead of time, but
We'll fix things up after the fact.
********* ********* ********* *********;

proc print
    data=intro.titanic(obs=10);
  title1 " ";
run;

********* ********* ********* *********
4. Counts, proc freq

For any categorical variables, your 
first step is to get frequency counts.
********* ********* ********* *********;

proc freq
    data=intro.titanic;
  tables PClass Sex Survived;
run;

********* ********* ********* *********
5. Convert string to numeric, data step

For the one continuous variable (age)
you need to convert the code "NA" to 
the SAS missing value code, which is a
dot. The easiest way to do this is to
force the data to numeric with a simple
arithmetic equation like adding a zero.
But you get a warning message for each
occurence of NA, which can get tedious.
The input function with two question
marks avoids this issue.
********* ********* ********* *********;

data intro.titanic;
  set intro.titanic;
  age_c = input(age, ?? 8.);
run;

proc means
    n nmiss mean std min max
    data=intro.titanic;
  var age_c;
run;

********* ********* ********* *********
6. Using proc format to code categorical data

For variables like Survived which are
numbers, but the numbers represent a
particular category, you can document
this using a format statement.
********* ********* ********* *********;

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

********* ********* ********* *********
7. Bar charts, proc sgplot

I don't normally like bar charts, but
they do have their uses.
********* ********* ********* *********;

proc sgplot
    data=intro.titanic;
  vbar Survived;
  format Survived f_survived.;
run;

********* ********* ********* *********
8. Percentages for bar chart

Getting percentages is a bit tricky. You
have to run proc freq and output the 
results to a new data file, pct_survived.
I am using the noprint option, because
I only want the percentages for internal
use. It wouldn't have hurt anything to 
print out a bit extra, but I want to 
encourage you to limit the amount of
output that you present to a consulting
client.

Note the yaxis maxx=100 statement which
expands the upper limit of the y axis 
to 100%.
********* ********* ********* *********;

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

********* ********* ********* *********
9. Crosstabulation

To examine relationships among 
categorical variables use a two 
dimensional crosstabulation.
********* ********* ********* *********;

proc freq
    data=intro.titanic;
  tables Sex*Survived / nocol nopercent;
  format Survived f_survived.;
run;

********* ********* ********* *********
10. Converting a continuous variable to categorical

If you want to create categories from a
continuous variable, use a series of

  if - then - else
  
statements
********* ********* ********* *********;

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

********* ********* ********* *********
11. Quality check

Always cross check your results against
the original variable.
********* ********* ********* *********;

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

********* ********* ********* *********
12. Controlling the display order

Notice that the order for age_cat is 
alphabetical, which is probably not
what you want. You can control the 
order by using number codes and 
formats.
********* ********* ********* *********;

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

********* ********* ********* *********
13. With number codes, use proc format

Once  you have the number codes, assign
an interpretable label using proc 
format.
********* ********* ********* *********;

proc format;
  value f_age
    1 = "toddler"
  	2 = "pre-teen"
  	3 = "teenager"
  	4 = "adult"
  	9 = "unknown";
run;

********* ********* ********* *********
14. Quality check

Here's the quality check again.
********* ********* ********* *********;

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

********* ********* ********* *********
15. Modifying a categorical variable

Here's another example where you 
compare First Class passengers to
Second and Third class passengers 
combined.
********* ********* ********* *********;

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

********* ********* ********* *********
The Gardasil vaccine requires three 
shots in order to be effective. A study 
conducted at Johns Hopkins looked at 
how often patients failed to get all 
three shots. They wanted to see if 
insurance status, age, and other 
factors could predict who was at 
greatest risk for failing to get all
three shots.

The data set is available as an Excel
spreadsheet at

  http://www.amstat.org/publications/jse/v19n1/gardasil.xls

and a description of the file is available at

  http://www.amstat.org/publications/jse/v19n1/gardasil.txt

  1. Create factors for AgeGroup, Race, 
  Completed, Location.

  2. Report which variables have missing data and
  how many of these values are missing.

  3. What proportion of patients completed all 
  three shots?

  4. Draw a bar chart showing the percentage of
  patients at each of the four locations.

  5. Use a crosstabulation to compare Age to 
  AgeGroup, and Location to LocationType. Are 
  the recodings into AgeGroup and LocationType 
  done properly?

  6. Create a new variable that combines the race
  categories into white, and non-white. Calculate
  the proportion of white patients at each of the
  four locations.
;
********* ********* ********* *********;

ods pdf close;

********* ********* ********* *********;
proc printto; run;

