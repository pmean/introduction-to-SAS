* lecture02.sas
  written by Steve Simon
  October 22, 2018;

%let xpath=/folders/myfolders/introduction-to-sas;
%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

ods pdf
  file="&path/module02/lecture02.pdf";

filename titanic
  "&path/data02/titanic_v00.txt";

libname intro
  "&path/data02";

* As a general rule, proc import works best for
  simple delimited files where the first row
  contains the variable names. With complicated
  text files (such as files where the data for 
  an individual extends across more than one
  line) or files without variable names in the
  first row are usually better handled by a 
  data step.
;

proc import
    datafile="&path/data02/titanic_v00.txt"
    out=intro.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

* If you look at the first few rows of data,
  you will see that the import went well. It
  is not always this easy. Do take notice
  that age includes a value "NA" instead
  of a number for certain passengers. This
  represents a missing value.
;

proc print
    data=intro.titanic(obs=20);
  title1 " ";
run;

* For any categorical variables, your first step
  is to get frequency counts.
;

proc freq
    data=intro.titanic;
  tables PClass Sex Survived;
run;

* For the one continuous variable (age) you need
  to convert the code "NA" to the SAS missing
  value code, which is a dot. The easiest way
  to do this is to force the data to numeric
  with a simple arithmetic equation like adding
  a zero. But you get a warning message for each
  occurence of NA, which can get tedious. The
  input function with two question marks avoids
  this issue.
;

data intro.titanic;
  set intro.titanic;
  age_c = input(age, ?? 8.);
run;

proc means
    data=intro.titanic;
  var age_c;
run;

* For variables like Survived which are numbers,
  but the numbers represent a particular 
  category, you can document this using a
  format statement.
;

proc format;
  value f_survived
    0 = "Alive"
	1 = "Died";
run;

proc freq
    data=intro.titanic;
  tables Survived;
  format Survived f_survived.;
run;

* I don't normally like bar charts, but they do
  have their uses.
;

proc sgplot
    data=intro.titanic;
  vbar Survived;
  format Survived f_survived.;
run;

* Getting percentages is a bit tricky
;

proc freq
    data=intro.titanic;
  tables Survived / noprint out=pct_survived;
run;

proc print
    data=pct_survived;
run;

proc sgplot
    data=pct_survived;
  vbar Survived / response=Percent;
  yaxis max=100;
run;

* To examine relationships among categorical
  variables use a two dimensional crosstabulation
;

proc freq
    data=intro.titanic;
  tables Survived*Sex / nocol nopercent;
run;

* If you want to create categories from a
  continuous variable, use a series of
  if - then - else statements;

data age_categories;
  set intro.titanic;
  if age_c = .
    then age_cat = "unknown";
  else if age_c < 6 
    then age_cat = "toddler";
  else if age_c < 12
    then age_cat = "pre-teen";
  else if age_c < 21
    then age_cat = "teenager";
  else age_cat = "adult";
run;

* Always cross check your results against the
  original variable.
;

proc freq
    data=age_categories;
  tables age_c*age_cat / 
    norow nocol nopercent missing;
run;

* You can also use the if - then - else
  statements to change a categorical variable.
;

* Notice that the order for age_cat is 
  alphabetical, which is probably not
  what you want. You can control the
  order by using number codes and formats.
;

data age_categories;
  set intro.titanic;
  if age_c = .
    then age_cat = 9;
  else if age_c < 6 
    then age_cat = 1;
  else if age_c < 12
    then age_cat = 2;
  else if age_c < 21
    then age_cat = 3;
  else age_cat = 4;
run;

proc format;
  value f_age
    1 = "toddler"
	2 = "pre-teen"
	3 = "teenager"
	4 = "adult"
	9 = "unknown";
run;

proc freq
    data=age_categories;
  tables age_c*age_cat / 
    norow nocol nopercent missing;
  format age_cat f_age.;
run;

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

* The Gardasil vaccine requires three shots in 
  order to be effective. A study conducted at 
  Johns Hopkins looked at how often patients 
  failed to get all three shots. They wanted 
  to see if insurance status, age, and other
  factors could predict who was at greatest
  risk for failing to get all three shots.

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

ods pdf close;

