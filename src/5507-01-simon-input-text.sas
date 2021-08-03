* 5507-01-simon-input-text.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to read data from a separate file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/six-numbers.txt";

ods pdf file="&path/results/5507-01-simon-input-text.pdf";

data perm.simple_example;
  infile rawdata;
  input x y;
run;

proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;

ods pdf close;
