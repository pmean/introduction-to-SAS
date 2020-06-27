* input-text.sas 
written by Steve Simon;

libname perm "q:/Documents/results";

filename rawdata "q:/Documents/data/six-numbers.txt";

ods pdf file="q:/Documents/results/input-text.pdf";

data perm.simple_example;
  infile rawdata delimiter=" ";
  input x y;
run;

proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;

ods pdf close;
