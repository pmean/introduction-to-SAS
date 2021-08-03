*************************************************
5507-04-simon-hw-q3.sas
author: Steve Simon
date created: 2019-10-30
purpose: To answer homework questions for module04
license: public domain
*************************************************;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

ods pdf file="&path/results/5507-04-simon-hw-q3.pdf";

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
Q3. Draw a bar chart showing the number of 
patients at each of the four locations.  Which
location has" the fewest patients?
*************************************************;
proc sgplot
    data=perm.gardasil;
  vbar Location;
  format Location f_location.;
  title1 "Johns Hopkins Outpatient Center has the fewest patients.";
run;

ods pdf close;
