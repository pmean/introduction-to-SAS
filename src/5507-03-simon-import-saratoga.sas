* m03-5507-simon-import-saratoga.sas
* author: Steve Simon
* creation date: 2019-07-02
* purpose: to import the Saratoga dataset
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/m03-5507-simon-import-saratoga.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/string-data.txt";

options papersize=(8in 4in) nonumber nodate;


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
  title1 "First ten rows of data";
run;
ods pdf close;

********* ********* ********* ********* *********;
