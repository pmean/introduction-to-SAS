* import-string-to-numeric.sas
  written by Steve Simon
  2019-07-03;

* Import data and convert a string to missing;
options papersize=(8in 4in) nonumber nodate;

********* ********* ********* *********
Here are the standard headers. Tell SAS
where to store the output, where to
find the data set and where to place
any data files it creates.
********* ********* ********* *********;

ods pdf file="../src/import-string-to-numeric.pdf";
filename raw_data 
  "../data/string-to-numeric.txt";
libname module01 "../data";

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