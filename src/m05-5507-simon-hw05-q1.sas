*************************************************
m05-5507-simon-hw05-q1.sas
author: Steve Simon
date created: 2018-11-27
purpose: to answer module05 homework questions
*************************************************;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/m05-5507-simon-hw05-q1.pdf";

libname perm
  "&path/data";

proc import
    datafile="&path/data/housing.txt"
    out=perm.housing
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

data perm.housing;
  set perm.housing;
  label
    price = "Selling price (in dollars)"
    sqft = "Square feet of living space"
    age = "Age of home (years)"
    features = "Number out of 11 features"
    ne = "Located in northeast sector of city?"
    cust = "Custom built?"
    cor = "Corner location?";

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

*************************************************
Note that the eleven features are: dishwasher, 
refrigerator, microwave, disposer, washer, 
intercom, skylight(s), compactor, dryer, handicap
fit, cable TV access
*************************************************;

proc print
    data=perm.housing(obs=10);
  title1 "Albuquerque housing data";
  title1 "Partial listing of data";
run;

*************************************************
Q1. Do any of the variables have missing values?
How many?

Q2. Calculate the mean and standard deviation
for the two levels of CUST. How much more do
 custom built houses cost on average?

Q3. Evaluate the relationship between CUST and 
SQFT using a boxplot. Do custom built houses 
tend to be bigger?

Q4. Are custom built houses more likely to 
appear on corner lots? Calculate the percentages.
Hint: use COR as the rows, CUST as the columns, 
and display row percentages.
*************************************************;
proc means
    n nmiss
    data=perm.housing;
  title1 "There are 49 missing values for age";
  title2 "No other variables have missing values";
run;

proc sort
    data=perm.housing;
  by cust;
run;

proc means
    data=perm.housing;
  by cust;
  var price;
  title1 "Custom built houses are about $xx more expensive on average.";
run;

proc sgplot
    data=perm.housing;
  vbox sqft / category=cust;
  title1 "Custom built houses tend to be much larger.";
run;
 
proc freq
    data=perm.housing;
  tables cor*cust / nocol nopercent;
  title1 "Custom built houses are roughly equally likely";
  title2 "to be built on corner lots or side lots.";
run;

ods pdf close;
