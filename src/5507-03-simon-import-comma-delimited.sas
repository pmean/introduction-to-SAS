* 5507-03-simon-import-comma-delimited.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import comma delimited files
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-comma-delimited.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/comma-delimited.csv";

options papersize=(8in 4in) nonumber nodate;


data perm.comma_delimited;
  infile raw_data delimiter=",";
  input x y z;
run;

proc print
    data=perm.comma_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
