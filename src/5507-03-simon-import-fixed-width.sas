* 5507-03-simon-import-fixed-width.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import data in a fixed width format
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-fixed-width.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/fixed-width.txt";

options papersize=(8in 4in) nonumber nodate;


data perm.fixed_width;
  infile raw_data delimiter=",";
  input 
    x 1-2
    y 3-4
    z 5-7;
run;

proc print
    data=perm.fixed_width(obs=2);
  title1 "First two rows of data";
run;

ods pdf close;
