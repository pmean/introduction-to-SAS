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



********* ********* ********* *********;
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

ods pdf close;

********* ********* ********* *********;
proc printto; run;

