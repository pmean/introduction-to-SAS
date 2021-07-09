* Part00. Documentation header

m04-5507-simon-categorical-variables
author: Steve Simon
Date created: 2018-10-22

Purpose: To illustrate how to work with datasets
with mostly continuous variables.

License: public domain;

* Notes00. This is the standard documentation header;

* Part01. Tell SAS where to find and store things;

options papersize=(6in 4in); 
* This needed to have the output fit on PowerPoint;

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

* Part03. Print the first ten lines;

proc print
    data=perm.titanic(obs=10);
  title1 "The first ten rows of the Titanic dataset";
run;

* Notes03. It's always a good idea to peek at the 
first few rows of data.

Output, page 1. If you look at the first few 
rows of data, you will see that the import went 
reasonably well. It is not always this easy. Do 
take notice that age is left justified. It is 
caused by a number of "NA" codes for missing 
values. You don't see it here, but if you print a 
few more observations, you can see the "NA" 
values. It would have been easier to anticipate 
these ahead of time, but we'll fix things up 
after the fact.;

* Part04. Counts, proc freq;

proc freq
    data=perm.titanic;
  table PClass Sex Survived;
  title1 "Frequency counts for categorical variables";
run;

* Notes04. For any categorical variables, your 
first step is to get frequency counts.

Output, page 2. There is a mix of three passenger 
classes, with a lot more in third class. There 
are also a lot more men than women.

Output, page 3. The survived variable is a number 
code. You should look at the data dictionary to 
find out that 1=survived and 2=died. Only about a 
third of the passengers survived.;

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

Output, page 4. The numeric variable, age_c, can 
now be analyzed using proc means. The average age 
is about 30, and there are a large number of 
missing values.;

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

Output, page 5. Notice that the format statement 
replaces the cryptic 0-1 code with the words no 
and yes. It is almost always a good idea to 
attach labels to any categorical variable using 
number codes. It makes your output more readable 
and avoids any confusion or mixing up the codes.;

* Part07. Bar charts, proc sgplot;

proc sgplot
    data=perm.titanic;
  vbar Survived;
  format Survived f_survived.;
  title1 "Bar chart for number surviving";
run;

* Notes07. I don't normally like bar charts, but
they do have their uses.

Output, page 6. This is a basic bar chart.;

* Part08. Percentages for bar chart;

proc freq
    noprint 
    data=perm.titanic;
  tables Survived / out=pct_survived;
run;

proc sgplot
    data=pct_survived;
  vbar Survived / response=Percent;
  yaxis max=100;
  format Survived f_survived.;
  title1 "Bar chart for percent surviving";
run;

* Notes08. Getting percentages is a bit tricky. 
You have to run proc freq and output the results 
to a new data file, pct_survived. I am using the 
noprint option, because I only want the 
percentages for internal use. It wouldn't have 
hurt anything to print out a bit extra, but I 
want to encourage you to limit the amount of 
output that you present to a consulting client.

Output, page 7. Note that the yaxis max=100 
statement expands the upper limit of the y axis  
to 100%.;

* Part09. Converting a continuous variable to categorical;

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

* Notes09. If you want to create categories from a
continuous variable, use a series of

if - then - else
  
statements;

* Part10. Quality check;

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

* Notes10. Always cross check your results against the original variable.

Output, page 8. These results look good. Notice, 
however, that the order for age_cat is 
alphabetical, which is probably not what you want.

Output, page 9. 

Output, page 10. 

* Part11. Controlling the display order;

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

* Notes11. You can control the order by using 
number codes and formats.; 

* Part12. With number codes, use proc format;

proc format;
  value f_age
    1 = "toddler"
  	2 = "pre-teen"
  	3 = "teenager"
  	4 = "adult"
  	9 = "unknown";
run;

* Notes12. The format statement attaches a label 
to each number code.;

* Part13. Quality check;

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
  title1 "Quality check for conversion";
  title2 "Revision to control ordering";
run;

* Notes13. Again, a quality check is important.

Output, page 11. The tables are ordered from 
toddler to pre-teen, 

Output, page 12. to teenager to adult,

Output, page 13. then missing.;

* Part14. Modifying a categorical variable;

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

* Notes14. Here's another example where you 
compare First Class passengers to
Second and Third class passengers 
combined.

Output, page 14. You could have done these 
calcuations by hand, of course, but this helps 
others who are not as patient as you are.;

* Part15. Crosstabulation, default option;

proc freq
    data=perm.titanic;
  tables Sex*Survived;
  format Survived f_survived.;
  title1 "Crosstabulation with row percentages";
run;

* Notes15. To examine relationships among 
categorical variables use a two dimensional 
crosstabulation.

Output, page 15. Notice that SAS provides three
different percentages. I do NOT recommend that you
show every percentage.;

* Part16. Crosstabulation, row percents;

proc freq
    data=perm.titanic;
  tables Sex*Survived / nocol nopercent;
  format Survived f_survived.;
  title1 "Crosstabulation with row percentages";
run;

* Notes16. Row percentages add up to 100% within
each row

Output, page 15. Notice that among the men, 17% 
survived and 83% died. 17% and 83% adds up to 100%
within that row. Among the women 67% survived and
33% died. 67% and 33% addes up to 100% within that
row.;

* Part17. Crosstabulation, column percents;

proc freq
    data=perm.titanic;
  tables Sex*Survived / norow nopercent;
  format Survived f_survived.;
  title1 "Crosstabulation with column percentages";
run;

* Notes17. Column percentages add up to 100%
within each column

Output, page 16. Notice that among the survivors,
xx% were women and xx% were men. Among those who died,
xx% were women and xx percent were men.;

* Part18. Crosstabulation, row percents;

proc freq
    data=perm.titanic;
  tables Sex*Survived / norow nocol;
  format Survived f_survived.;
  title1 "Crosstabulation with cell percentages";
run;

ods pdf close;

* Notes18. Cell percentages add up to 100% across
the entire table

Output, page 17.  There were xx% female survivors
among all the passengers, xx% male survivors, xx%
female deaths, and xx% male deaths. These four 
percentages all add up to 100%. Which is best: row,
column, or cell percents. The answer is "it depends."
I have a handout that talks about these issues.;

* Part19. End of program;
