* 5507-03-simon-import-first-line-names.sas
* author: Steve Simon
* creation date: 2019-07-02
* purpose: to import data with variable names on the first line
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-first-line-names.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/first-line-names.csv";


proc import
    datafile=raw_data dbms=dlm
    out=perm.first_line_names replace;
  delimiter=",";
  getnames=yes;
run;

proc print
    data=perm.first_line_names(obs=2);
  title1 "First two rows of data";
run;

ods pdf close;
