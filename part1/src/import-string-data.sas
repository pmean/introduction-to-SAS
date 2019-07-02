* import-string-data.sas
  written by Steve Simon
  2019-07-02;

********* ********* ********* ********* *********;
* A simple program to import a file with string
  data into SAS;

ods pdf file="../results/import-string-data.pdf";
filename raw_data
  "../data/string-data.txt";
libname module01
  "../data";
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
