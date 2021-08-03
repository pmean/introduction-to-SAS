* 5507-03-simon-hw-q2.sas
* author: Steve Simon
* date: created 2021-06-28
* purpose: to read a tab delimited file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/energy02.tsv";

ods pdf file="&path/results/5507-03-simon-hw-q2.pdf";

data perm.energy02;
  infile rawdata delimiter="09"X;
  input
    subject
    running
    walking
    cycling;
run;

proc print
    data=perm.energy02(obs=3);
  title1 "First three rows";
run;

ods pdf close;
