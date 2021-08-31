* 5507-03-simon-import-multi-delimited.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import data with multiple blanks as delimiters
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-multi-delimited.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/multi-delimited.txt";

options papersize=(8in 4in) nonumber nodate;


data perm.multi_delimited;
  infile raw_data delimiter=" ";
  input x y z;
run;

proc print
    data=perm.multi_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
