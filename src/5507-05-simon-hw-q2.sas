*************************************************
5507-05-simon-hw-q2.sas
author: Steve Simon
date created: 2018-11-27
purpose: to answer module05 homework questions
*************************************************;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/5507-05-simon-hw-q2.pdf";

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
Q2. Calculate the mean and standard deviation
for the two levels of CUST. How much more do
 custom built houses cost on average?
*************************************************;
proc sort
    data=perm.housing;
  by cust;
run;

proc means
    data=perm.housing;
  by cust;
  var price;
  title1 "Custom built houses are about $50,000 more expensive on average.";
run;
ods pdf close;
