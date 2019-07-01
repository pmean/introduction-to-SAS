* import-tilde-delimited.sas
  written by Steve Simon
  2019-07-01;

********* ********* ********* ********* *********;
* A simple program to import a comma delimited
  file into SAS;

ods pdf file="../results/import-tilde-delimited.pdf";
filename raw_data
  "../data/tilde-delimited.txt";
libname module01
  "../data";
data module01.tilde_delimited;
  infile raw_data delimiter="~";
  input x y z;
run;

proc print
    data=module01.tilde_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
