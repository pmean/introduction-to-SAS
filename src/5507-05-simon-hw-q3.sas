*************************************************
5507-05-simon-hw-q3.sas
author: Steve Simon
date created: 2018-11-27
purpose: to answer module05 homework questions
*************************************************;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/5507-05-simon-hw-q3.pdf";

libname perm
  "&path/data";

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
Q3. Evaluate the relationship between CUST and 
SQFT using a boxplot. Do custom built houses 
tend to be bigger?
*************************************************;
proc sgplot
    data=perm.housing;
  vbox sqft / category=cust;
  title1 "Custom built houses tend to be much larger.";
run;

ods pdf close;
