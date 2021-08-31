* 5507-03-simon-import-tab-delimited.sas
* author: Steve Simon
* creation date: 2019-07-01
* purpose: to import a comma delimited file into SAS
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-tab-delimited.pdf";

libname perm
    "&path/data";

filename raw_data
  "&path/data/tab-delimited.txt";


data perm.tab_delimited;
  infile raw_data delimiter="09"X;
  input x y z;
run;

proc print
    data=perm.tab_delimited(obs=2);
  title1 "First two rows of data";
run;

ods pdf close;
