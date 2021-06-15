* import-first-line-names.sas
  written by Steve Simon
  2019-07-02;

********* ********* ********* ********* *********;
* A simple program to import a file with variable
  names on the first line;

ods pdf file="../results/import-first-line-names.pdf";
filename raw_data
  "../data/first-line-names.txt";
libname module01
  "../data";
proc import
    datafile=raw_data dbms=dlm
    out=module01.first_line_names replace;
  delimiter=" ";
  getnames=yes;
run;

proc print
    data=module01.first_line_names(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
