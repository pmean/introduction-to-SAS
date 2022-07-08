* 5507-03-simon-first-line-names.sas
  author: Steve Simon
  date: created 2022-07-03
  purpose: to read a text file with variabe
    names in it.
  license: public domain;

libname perm "q:/introduction-to-sas/data";

filename rawdata "q:/introduction-to-sas/data/first-line-names.csv";

ods pdf file=
    "q:/introduction-to-sas/results/5507-03-simon-first-line-names.pdf";

proc import
    datafile=rawdata
	out=perm.first_line_names
    dbms=dlm
	replace;
  delimiter=",";
run;

proc print
    data=perm.first_line_names(obs=2);
  title1 "Listing of first two lines of data";
run;

ods pdf close;
