* hw13.sas
  written by Steve Simon
  December 6, 2018;

%let xpath=/folders/myfolders/introduction-to-sas;
%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

ods pdf
  file="&path/module13/hw13.pdf";

libname intro
  "&path/data03";

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
;

proc print
    data=intro.housing(obs=10);
  title1 "Albuquerque housing data";
  title2 "Partial listing of data";
run;

* 1. Fit a linear regression model predicting
  the sales price (dependent variable) using
  custom build (independent variable). Is there
  a statistically significant difference in the
  average sales price between custom build and 
  regular houses?
;

proc glm
    data=intro.housing;
  class cust;
  model price=cust;
  title2 "Predicting price from custom build"; 
run;

* 2. Fit a logistic regression model predicting
  custom build (dependent variable) using the 
  square footage of the house (independent
  variable). How do the odds of a custom build 
  change as the size of the house increases?
;

proc genmod
    data=intro.housing;
  model cust=sqft / dist=binomial;
  title2 "Logistic regression";
run;

* 3. Fit a linear regression model predicting
  the sales price (dependent variable) using
  custom build and square footage (independent
  variables). Does the sales price for custom
  builds differ when you control for the size
  of the house?
;

proc glm
    data=intro.housing;
  class cust;
  model price=cust sqft;
  title2 "Predicting price from custom build and size"; 
run;


ods pdf close;

