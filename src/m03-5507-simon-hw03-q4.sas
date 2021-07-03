* m03-5507-hw03-q4.sas
* author: Steve Simon
* date: created 2021-06-28
* purpose: to read first line variable names
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/energy04.csv";

ods pdf file="&path/results/m03-5507-simon-hw03-q4.pdf";

proc import
    datafile=rawdata dbms=dlm
    out=perm.energy04 replace;
  delimiter=",";
  getnames=yes;
run;

proc print
    data=perm.energy04(obs=3);
  title1 "First three rows";
run;

ods pdf close;
