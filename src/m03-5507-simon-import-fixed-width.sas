* m03-5507-simon-import-fixed-width.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import data in a fixed width format
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/m03-5507-simon-import-fixed-width.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/string-data.txt";

options papersize=(8in 4in) nonumber nodate;

data module01.fixed_width;
  infile raw_data delimiter=",";
  input 
    x 1-2
    y 3-4
    z 5-7;
run;

proc print
    data=module01.fixed_width(obs=2);
  title1 "First two rows of data";
run;

ods pdf close;
