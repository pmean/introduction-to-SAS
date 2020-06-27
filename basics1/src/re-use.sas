* re-use.sas 
written by Steve Simon;

libname perm "q:/Documents/results";

proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;
