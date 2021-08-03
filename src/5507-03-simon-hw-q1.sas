* m03-5507-hw03-q1.sas
* author: Steve Simon
* date: created 2021-06-28
* purpose: to read a csv file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/energy01.csv";

ods pdf file="&path/results/m03-5507-simon-hw03-q1.pdf";

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
