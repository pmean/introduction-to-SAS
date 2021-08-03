*************************************************
5507-04-simon-hw-q2.sas
author: Steve Simon
date created: 2019-10-30
purpose: To answer homework questions for module04
license: public domain
*************************************************;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

ods pdf file="&path/results/5507-04-simon-hw-q2.pdf";

proc format;
  value f_agegroup
    0="11-17 years"
    1="18-26 years";
  value f_race
    0="White"
    1="Black"
    2="Hispanic"
    3="Other/unknown";  
  value f_yesno
    0="No"
    1="Yes";
  value f_location
    1="Odenton"
    2="White Marsh"
    3="Johns Hopkins Outpatient Center"
    4="Bayview";
run;    

*************************************************
Q2. Report which variables have missing data and
how many of these values are missing.
*************************************************;
proc means
    n nmiss
    data=perm.gardasil;
  title1 "None of the variables have missing values.";
run;

ods pdf close;
