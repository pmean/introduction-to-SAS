* 5507-02-simon-hw-q1.sas
* author: Steve Simon
* creation date: 2021-06-14
* purpose: to list the cigarette brand with the highest tar
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-02-simon-hw-q1.pdf";

libname perm
    "&path/data";

proc sort 
    data=perm.cigarettes;
  by descending tar;
run;

proc print
    data=perm.cigarettes(obs=1);
  title1 "M02-Q1. What brand has the highest tar?";
  footnote1 "BullDurham has the highest level of tar";
run;

ods pdf close;
