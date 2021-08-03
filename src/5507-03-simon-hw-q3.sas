* m03-5507-hw03-q2.sas
* author: Steve Simon
* date: created 2021-06-28
* purpose: to read a fixed width file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/energy03.txt";

ods pdf file="&path/results/m03-5507-simon-hw03-q3.pdf";

data perm.energy03;
  infile rawdata;
  input
    subject 1
    running 2-4
    walking 5-7
    cycling 8-10;
run;

proc print
    data=perm.energy03(obs=3);
  title1 "First three rows";
run;

ods pdf close;
