*************************************************
5507-05-simon-hw-q4.sas
author: Steve Simon
date created: 2018-11-27
purpose: to answer module05 homework questions
*************************************************;

%let path=q:/introduction-to-sas;

ods pdf
  file="&path/results/5507-05-simon-hw-q4.pdf";

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
Q4. Are custom built houses more likely to 
appear on corner lots? Calculate the percentages.
Hint: use COR as the rows, CUST as the columns, 
and display row percentages.
*************************************************;

proc freq
    data=perm.housing;
  tables cor*cust / nocol nopercent;
  title1 "Custom built houses are roughly equally likely";
  title2 "to be built on corner lots or side lots (23%).";
run;

ods pdf close;
