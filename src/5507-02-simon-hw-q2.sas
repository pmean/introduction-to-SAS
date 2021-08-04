* 5507-02-simon-hw-q2.sas
* author: Steve Simon
* creation date: 2021-06-14
* purpose: to list the cigarette brand with the highest tar
* copyright: this program is placed in the public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-02-simon-hw-q2.pdf";

libname perm
    "&path/data";

proc sort 
    data=perm.cigarettes;
  by tar;
run;

proc print
    data=perm.cigarettes(obs=1);
  title1 "M02-Q2. What brand has the lowest tar?";
  footnote1 "Now has the lowest level of tar";
run;

ods pdf close;
