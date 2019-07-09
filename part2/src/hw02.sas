options papersize=(8in 4in) nodate;
proc printto log="hw02.log" new; run;

* hw02.sas
  written by Steve Simon
  2019-07-08;

********* ********* ********* *********
1. Homework 02 (1 / 4)

The Gardasil vaccine requires three 
shots in order to be effective. A study 
conducted at Johns Hopkins looked at 
how often patients failed to get all 
three shots. They wanted to see if 
insurance status, age, and other 
factors could predict who was at 
greatest risk for failing to get all
three shots.
********* ********* ********* *********;



********* ********* ********* *********
2. Homework 02 (2 / 4)

The data set is available as an Excel
spreadsheet at

  http://www.amstat.org/publications/jse/v19n1/gardasil.xls

and a description of the file is available at

  http://www.amstat.org/publications/jse/v19n1/gardasil.txt
********* ********* ********* *********;


********* ********* ********* *********
3. Homework 02 (3 / 4)

Q1. Create factors for AgeGroup, Race, 
Completed, Location.

Q2. Report which variables have missing data and
how many of these values are missing.

Q3. What proportion of patients completed all 
three shots?
********* ********* ********* *********;



********* ********* ********* *********
4. Homework 02 (4 / 4)

Q4. Draw a bar chart showing the percentage of
patients at each of the four locations.

Q5. Use a crosstabulation to compare Age to 
AgeGroup, and Location to LocationType. Are 
the recodings into AgeGroup and LocationType 
done properly?

Q6. Create a new variable that combines the race
categories into white, and non-white. Calculate
the proportion of white patients at each of the
four locations.
********* ********* ********* *********;



********* ********* ********* *********
5. Output and data locations

This is the first few lines of SAS 
code, showing where to store the 
output, where to find the input and
where to store the SAS binary data set
the program creates.
********* ********* ********* *********;

ods pdf
  file="hw02.pdf";

filename raw_data
  "../data/gardasil.csv";

libname intro
  "../data";

********* ********* ********* *********
6. Reading, proc import

You should think about proc import here
because the names of the variables are
in the first row of data and there is
nothing too unusual going on.
********* ********* ********* *********;

proc import
    datafile=raw_data
    out=intro.gardasil
    dbms=dlm
    replace;
  delimiter=',';
  getnames=yes;
run;

********* ********* ********* *********
7. First ten lines, proc print

If you look at the first few rows of
data, you will see that the import went
reasonably well.
********* ********* ********* *********;

proc print
    data=intro.gardasil(obs=10);
  title1 " ";
run;


********* ********* ********* *********
Q1. Create factors for AgeGroup, Race, 
Completed, Location.

If you go to the website, you'll find 
the following information:

AgeGroup = the age group in which the 
patient falls (0 = 11-17 years, 1 = 
18-26 years)

Race = the patient's race (0 = white, 
1 = black, 2 = Hispanic, 3 = 
other/unknown)

Completed = did the patient complete 
the three-shot regimen within the 
recommended period of 12 months 
(0 = no, 1 = yes)

Location = the clinic that the patient
attended (1 = Odenton, 2 = White Marsh,
3 = Johns Hopkins Outpatient Center, 
4 = Bayview)
********* ********* ********* *********;

proc format;
  value f_age
    0 = "11-17 years"
	1 = "18-26 years";
  value f_race
    0 = "White"
	1 = "Black"
	2 = "Hispanic"
	3 = "Other/unknown";
  value f_completed
    0 = "No"
	1 = "Yes";
  value f_location
    1 = "Odenton"
	2 = "White Marsh"
	3 = "Johns Hopkins Outpatient Center"
	4 = "Bayview";
run;

********* ********* ********* *********
Display the formatted variables

There are several ways you can 
demonstrate that you coded the 
variables properly. Getting frequency
counts with proc freq is about as easy
as anything.
********* ********* ********* *********;

proc freq
    data=intro.gardasil;
  tables AgeGroup Race Completed Location;
  format
    AgeGroup f_age.
	Race f_race.
	Completed f_completed.
	Location f_location.;
run;

********* ********* ********* *********
Q2. Report which variables have missing data and
how many of these values are missing.

To get the missing value count for a
continuous variable, include the nmiss
option in proc means or the missing
option in proc freq.
********* ********* ********* *********;

proc means
    n nmiss
    data=intro.gardasil;
  var Age--PracticeType;
run;

proc freq
    data=intro.gardasil;
  tables AgeGroup--PracticeType / missing;
run;

********* ********* ********* *********
Q3. What proportion of patients completed all 
three shots?

You've already run this table, but let's
run it again anyway.
********* ********* ********* *********;

proc freq
    data=intro.gardasil;
  tables Completed;
  format Completed f_completed.;
run;

********* ********* ********* *********
Q4. Draw a bar chart showing the percentage of
patients at each of the four locations.

You need to create a new data set
through the output= option on the
tables statement in proc freq.
********* ********* ********* *********;

proc freq
    data=intro.gardasil;
  tables location / 
    noprint out=location_percentages;
run;

proc print
    data=location_percentages;
run;

proc sgplot
    data=intro.gardasil;
  vbar location / response=percentage;
run; 

********* ********* ********* *********
Q5. Use a crosstabulation to compare Age to 
AgeGroup, and Location to LocationType. Are 
the recodings into AgeGroup and LocationType 
done properly?

For these tables, you can use counts 
alone. You don't need row percents,
column percents, or cell percents.
********* ********* ********* *********;

proc freq
    data=intro.gardasil;
  tables
    Age*AgeGroup
	Location*LocationType /
	  norow nocol nopercent;
run;

********* ********* ********* *********
Q6. Create a new variable that combines the race
categories into white, and non-white. Calculate
the proportion of white patients at each of the
four locations.
********* ********* ********* *********;

data recode;
  set intro.gardasil;
  if Race=0 
    then white="Yes";
	else white="No ";
run;

proc freq
    data=recode;
  tables Location*white / 
    nocol nopercent;
run;

********* ********* ********* *********;

ods pdf close;


proc printto; run;

