* 5507-03-simon-hw-q1.sas
* author: Steve Simon
* date: created 2021-06-28
* purpose: to read a csv file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/energy01.csv";

ods pdf file="&path/results/5507-03-simon-hw-q1.pdf";

data perm.energy01;
  infile rawdata delimiter=",";
  input
    subject
    running
    walking
    cycling;
run;

proc print
    data=perm.energy01(obs=3);
  title1 "First three rows";
run;

ods pdf close;
