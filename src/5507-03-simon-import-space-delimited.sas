* 5507-03-simon-import-space-delimited.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import data with spaces as delimiters
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-space-delimited.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/space-delimited.txt";


data perm.space_delimited;
  infile raw_data;
  input x y z;
run;

proc print
    data=perm.space_delimited(obs=2);
  title1 "First two rows of data";
run;

ods pdf close;
