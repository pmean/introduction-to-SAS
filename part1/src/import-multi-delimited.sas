* import-multi-delimited.sas
  written by Steve Simon
  2019-07-01;

********* ********* ********* ********* *********;
* A simple program to import a multiple space
  delimited file into SAS;

ods pdf file="../results/import-multi-delimited.pdf";
filename raw_data "../data/multi-delimited.txt";
libname module01 "../data";

data module01.multi_delimited;
  infile raw_data delimiter=" ";
  input x y z;
run;

proc print
    data=module01.multi_delimited(obs=2);
  title1 "First two rows of data";
run;
ods pdf close;
