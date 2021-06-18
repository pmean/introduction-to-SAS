* m01-5507-simon-read-data.sas
* author: Steve Simon and Steve Simon
* date: created 2021-06-12
* purpose: to read data from a separate file
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata
    "&path/data/six-numbers.txt";

ods pdf file=
   "&path/results/m01-5507-simon.pdf";

data perm.small_example;
  infile rawdata;
  input x y;
run;

proc print
    data=perm.small_example(obs=1);
  title1 "First row of data";
run;

ods pdf close;
