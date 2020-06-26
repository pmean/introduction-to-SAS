* import-abalone.sas
  written by Steve Simon
  2019-07-02;

********* ********* ********* ********* *********
Import the Abalone age prediction file.

Tell SAS where to find the data. Notice that
the filename statement includes a directl link
to the website that has this data.
********* ********* ********* ********* *********;

ods pdf file="../results/import-abalone.pdf";
filename raw_data
  "https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data";
libname module01
  "../data";

********* ********* ********* ********* *********
Use the data step because the names of
the variables are not on the first line
of the file.

This file uses commas for delimiters.
Specify this on the infile statement.

There are nine variables in this data
set. Sex is a string, a single character 
with values F for female, I for infant,
and M for male. The other variables are
numeric.
********* ********* ********* ********* *********;

data module01.abalone;
  infile raw_data delimiter=",";
  input
    Sex $
    Length
    Diameter
    Height
    Whole_weight
    Shucked_weight
    Viscera_weight
    Shell_weight
    Rings;
run;

********* ********* ********* ********* *********
If the import is successful, you will 
see a small part of the data: the first
ten rows and the first five variables.
********* ********* ********* ********* *********;

proc print
    data=module01.abalone(obs=10);
  var Sex Length Diameter Height Whole_weight;
  title1 "First ten rows of data";
run;
ods pdf close;

********* ********* ********* ********* *********;

