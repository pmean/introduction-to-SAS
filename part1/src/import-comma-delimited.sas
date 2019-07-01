* import-comma-delimited.sas
  written by Steve Simon
  2019-07-01;

********* ********* ********* ********* *********;
* A simple program to import a comma delimited
  file into SAS;

ods pdf file="../results/import-comma-delimited.pdf";
filename raw_data
  "../data/comma-delimited.csv";
libname module01
  "../data";
data module01.comma_delimited;
  infile raw_data delimiter=",";
  input x y z;
run;

proc print
    data=module01.comma_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
