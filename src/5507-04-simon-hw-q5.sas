*************************************************
5507-04-simon-hw-q5.sas
author: Steve Simon
date created: 2019-10-30
purpose: To answer homework questions for module04
license: public domain
*************************************************;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

ods pdf file="&path/results/5507-04-simon-hw-q5.pdf";

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
Q5. Create a new variable that combines the race 
categories into white, and non-white. Calculate
the proportion of white patients at each of the
four locations. What location had the greatest
proportion of non-white patients? Hint: use the
new white/non-white variable as the columns and
compute row percents.
*************************************************;
data binary;
  set perm.gardasil;
  if (race=.)
    then binary_race="Blank";
  else if (race=0)
    then binary_race="White";
  else binary_race="Other";
  label binary_race="Binary race category";
run;

proc freq
    data=binary;
  table race*binary_race / 
    norow nocol nopercent;
  title1 "Optional quality check";
run;

proc freq
    data=binary;
  tables Location*binary_race / nocol nopercent;
  format Location f_location.;
  title1 "Johns Hopkins Outpatient Center has the greatest proportion of non-white patients.";
run;

ods pdf close;
