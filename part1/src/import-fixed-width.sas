* import-fixed-width.sas
  written by Steve Simon
  2019-07-01;

********* ********* ********* ********* *********;
* A simple program to import a fixed width
  file into SAS;

ods pdf file="../results/import-fixed-width.pdf";
filename raw_data
  "../data/fixed-width.txt";
libname module01
  "../data";
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
