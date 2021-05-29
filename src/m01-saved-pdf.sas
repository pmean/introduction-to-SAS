* saved-pdf.sas 
written by Steve Simon;

libname perm "q:/Documents/results";

ods pdf file="q:/Documents/results/saved-pdf.pdf";

data perm.simple_example;
  input x y;
cards;
1 2
2 4
3 6
run;
proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;

ods pdf close;
