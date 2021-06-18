* m02-5507-simon-hw02b-q2.sas
* author: Steve Simon
* creation date: 2021-06-14
* purpose: to list the cigarette brand with the highest tar
* copyright: this program is placed in the public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/m02-5507-simon-hw02b-q2-output.pdf";

libname perm
    "&path/data";

proc sort 
    data=perm.cigarettes;
  by descending tar;
run;

proc print
    data=perm.cigarettes(obs=1);
  title1 "M02-Q2. What brand has the lowest tar?";
  footnote1 "xxx has the lowest level of tar";
run;

ods pdf close;
