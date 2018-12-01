* hw03.sas
  written by Steve Simon
  November 27, 2018;

%let path=/folders/myfolders/introduction-to-sas;
%let xpath=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

ods pdf
  file="&path/module03/lecture03.pdf";

libname intro
  "&path/data03";

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

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
  
  1. Convert the asterisks in the AGE and TAX
     variables to missing. How many missing
     values are there for AGE and for TAX?

  2. Create factors for NE, CUST, and COR.
     Draw bar charts for each of these factors.

  3. Find the largest house (biggest SQFT) in the
     data set. Is the largest house also the most
     expensive house?

  4. Calculate frequency counts for FEATS. Are
     there any houses with the no features? Are
     there any houses with every possible feature?

  5. Evaluate the relationship between PRICE and
     SQFT using a scatterplot. Include a smooth 
     curve. Do larger houses tend to cost more?

  6. Evaluate the relationship between CUST and
     PRICE using a boxplot. Calculate the mean
     price and standard deviation by CUST.

  7. What is the difference in average prices
     between northeast houses and other houses?
     What is the difference in average taxes?

  8. Are custombuilt houses more likely to appear
     on corner lots? Calculate the percentages and
     compute a relative risk.
;

ods pdf close;

