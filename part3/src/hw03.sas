options papersize=(8in 4in) nodate;
proc printto log="hw03.log" new; run;

* hw03.sas
  written by Steve Simon
  November 27, 2018;

********* ********* ********* *********
1. Homework 03 (1 / 4)

Read in the data housing.txt. 
  
Q1. Convert the asterisks in the AGE 
and TAX variables to missing. How many 
missing values are there for AGE and
for TAX?

Q2. Create factors for NE, CUST, and 
COR. Draw bar charts for each of these
factors. 
********* ********* ********* *********;



********* ********* ********* *********
2. Homework 03 (2 / 4)

Q3. Find the largest house (biggest
SQFT) in the data set. Is the largest
house also the most expensive house?

Q4. Calculate frequency counts for 
FEATS. Are there any houses with the 
no features? Are there any houses 
with every possible feature?
********* ********* ********* *********;



********* ********* ********* *********
3. Homework 03 (3 / 4)

Q5. Evaluate the relationship between
PRICE and SQFT using a scatterplot. 
Include a smooth curve. Do larger 
houses tend to cost more?

Q6. Evaluate the relationship between
CUST and PRICE using a boxplot. 
Calculate the mean price and standard
deviation by CUST.
********* ********* ********* *********;



********* ********* ********* *********
4. Homework 03 (4 / 4)

Q7. What is the difference in average 
prices between northeast houses and 
other houses? What is the difference 
in average taxes?

Q8. Are custombuilt houses more likely
to appear on corner lots? Calculate 
the percentages and compute a relative risk.
********* ********* ********* *********;



********* ********* ********* *********
5. Standard preliminaries

These are the standard lines at the
beginning of your SAS code.
********* ********* ********* *********;

ods pdf
  file="hw03.pdf";

filename rawdata
  "../data/housing.txt"

libname intro
  "../data";

********* ********* ********* *********
5. Importing the data

This is a tab delimited file with the
names of the variables in the first line
of data.
********* ********* ********* *********;

proc import
    datafile=rawdata
    out=intro.housing
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

proc print
    data=intro.housing(obs=10);
  title1 "Albuquerque housing data";
  title1 "Partial listing of data";
run;

********* ********* ********* *********
Q1. Convert the asterisks in the AGE 
and TAX variables to missing. 

How many missing values are there for AGE and
for TAX?
********* ********* ********* *********;

data intro.housing;
  set intro.housing;
  age_c = input(age, ?? 8.);
  tax_c = input(tax, ?? 8.);
run;

proc means
    n nmiss
    data=intro.housing;
  var age_c tax_c;
  title2 "Missing value count for age and tax";
run;

********* ********* ********* *********
Q2. Create formats for NE, CUST, and 
COR.

Draw bar charts for each of these
factors.
********* ********* ********* *********;

proc format;
  value f_ne
    0 = "Rest of Albuquerque"
	1 = "Northeast Albuquerque";
  value f_cust
    0 = "Standard home"
    1 = "Custom build";
  value f_cor
    0 = "Side lot"
    1 = "Corner lot";
run;

proc sgplot
    data=intro.housing;
  vbar ne / response=Percent;
  format ne f_ne.;
  yaxis max=100;
run;    

********* ********* ********* *********
Q3. Find the largest house (biggest
SQFT) in the data set. 

Is the largest house also the most 
expensive house?
********* ********* ********* *********;


********* ********* ********* *********
Q4. Calculate frequency counts for 
FEATS.

Are there any houses with the 
no features? Are there any houses 
with every possible feature?
********* ********* ********* *********;



********* ********* ********* *********
Q5. Evaluate the relationship between
PRICE and SQFT using a scatterplot.
 
Include a smooth curve. Do larger 
houses tend to cost more?
********* ********* ********* *********;



********* ********* ********* *********
Q6. Evaluate the relationship between
CUST and PRICE using a boxplot.
 
Calculate the mean price and standard
deviation by CUST.
********* ********* ********* *********;



********* ********* ********* *********
Q7. What is the difference in average 
prices between northeast houses and 
other houses? 

What is the difference in average 
taxes?
********* ********* ********* *********;



********* ********* ********* *********
Q8. Are custombuilt houses more likely
to appear on corner lots?

Calculate the percentages and compute a 
relative risk.
********* ********* ********* *********;


ods pdf close;

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

