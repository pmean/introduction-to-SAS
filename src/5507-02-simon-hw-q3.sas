* 5507-02-simon-hw-q3.sas
* author: Steve Simon
* creation date: 2021-06-20
* purpose: to compute a correlation coefficient
* copyright: this program is placed in the public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-02-simon-hw-q3.pdf";

libname perm
    "&path/data";

proc sort 
    data=perm.cigarettes;
  by descending tar;
run;

proc corr
    data=perm.cigarettes
    noprob nosimple;
  var tar nicotine;
  title1 "M02-Q3. What is the correlation";
  title2 "between tar and nicotine?";
  title3 "Interpret this correlation.";
  footnote1 "There is a strong positive association";
  footnote2 "between tar and nicotine.";
run;

ods pdf close;
