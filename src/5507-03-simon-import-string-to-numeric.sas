* 5507-03-simon-import-string-to-numeric.sas
* author: Steve Simon
* creation date: 2019-07-03
* purpose: to import data and convert a string to missing
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-03-simon-import-string-to-numeric.pdf";

libname perm
    "&path/data";

filename raw_data
  "&path/data/tab-delimited.txt";

options papersize=(8in 4in) nonumber nodate;

********* ********* ********* *********
You might be tempted to read in the data
using proc import. Normally that's what
you'd prefer for reading in data when
the variable names are the first line
of the data file. But when you do this
you lose control over designating which
variables are numeric and which are
strings. SAS will make an educated 
guess, but the NA code for missing in 
the second observation will trip SAS
up.
********* ********* ********* *********;

proc import
    datafile=raw_data dbms=dlm
    out=module01.string_to_numeric replace;
  delimiter=" ";
  getnames=yes;
run;

proc print
    data=module01.string_to_numeric(obs=3);
  title1 "First three rows of data";
run;

********* ********* ********* *********
Instead use the data step because on 
the input statement, you can designate
x as string, y and z as numeric. Since
some of the values for z may not look
numeric, warn SAS so that SAS doesn't
go bonkers with flags and warnings.

You do this with a double question mark.

Also, since the data starts with
variable names, you have to tell SAS to
skip the first line and start reading
at the second line. This is what the
firstobs=2 option does.
********* ********* ********* *********;

data module01.string_to_numeric;
  infile raw_data delimiter=" " firstobs=2;
  input
    x $
    y 
    z ??;
run;

proc print
    data=module01.string_to_numeric(obs=3);
  title1 "First three rows of data";
run;
ods pdf close;

********* ********* ********* *********;