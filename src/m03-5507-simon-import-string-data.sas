* m03-5507-simon-import-string-data.sas
* author: Steve Simon
* creation date: 2019-07-02
* purpose: to import data that includes a string
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/m03-5507-simon-import-string-data.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/string-data.txt";

options papersize=(8in 4in) nonumber nodate;

data module01.string_data;
  infile raw_data delimiter=" ";
  input 
    name $
    x
    y;
run;

proc print
    data=module01.string_data(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
