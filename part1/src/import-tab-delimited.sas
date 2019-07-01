* import-tab-delimited.sas
  written by Steve Simon
  2019-07-01;

********* ********* ********* ********* *********;
* A simple program to import a comma delimited
  file into SAS;

ods pdf file="../results/import-tab-delimited.pdf";
filename raw_data
  "../data/tab-delimited.txt";
libname module01
  "../data";
data module01.tab_delimited;
  infile raw_data delimiter="09"X;
  input x y z;
run;

proc print
    data=module01.tab_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
