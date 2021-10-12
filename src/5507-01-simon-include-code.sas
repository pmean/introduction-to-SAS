* 5507-01-simon-include-code.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to include the original code in the output
* license: public domain;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/six-numbers.txt";

ods pdf file="&path/results/5507-01-simon-include-code.pdf";

data perm.simple_example;
  infile rawdata;
  input x y;
run;

proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;

ods pdf close;

ods pdf file="&path/results/5507-01-simon-include-code.pdf";

proc document
    name=import(write);
  import textfile=
    "&path/src/5507-01-simon-include-code.sas"
    to ^;
	replay;
  title1 "Listing of code";
quit;

ods pdf close;
