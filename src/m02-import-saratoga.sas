* import-saratoga.sas
  written by Steve Simon
  2019-07-02;

* Import the Saratoga housing data set;

********* ********* ********* ********* *********
This is the first few lines of code,
showing where to store the output,
where to find the input and where
to store the SAS binary data set
the program creates.

Notice that the filename statement
points directly to the website.
********* ********* ********* ********* *********;

ods pdf file="../results/import-saratoga.pdf";
filename raw_data
  "https://dasl.datadescription.com/download/data/3437";
libname module01
  "../data";

********* ********* ********* ********* *********
This is a tab delimited file with
variable names on the first row. So
use proc import with the getnames=yes.
The delimiter for tab is denoted by
"09"x.
********* ********* ********* ********* *********;

proc import
    datafile=raw_data dbms=dlm
    out=module01.saratoga replace;
  delimiter="09"x;
  getnames=yes;
run;

********* ********* ********* ********* *********
If the import is successful, you will 
see a small part of the data: the first
ten rows and the first five variables.
********* ********* ********* ********* *********;

proc print
    data=module01.saratoga(obs=10);
  title1 "First two rows of data";
run;
ods pdf close;

********* ********* ********* ********* *********;
