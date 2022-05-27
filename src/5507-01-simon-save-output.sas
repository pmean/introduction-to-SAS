* 5507-01-simon-save-output.sas
* author: Steve Simon and Steve Simon
* date: created 2021-06-12
* purpose: to create a permanent dataset
* license: public domain;

libname perm "../data";

ods pdf file=
   "../results/5507-01-simon-save-output.pdf";

data perm.small_example;
  input x y;
  datalines;
1 2
2 4
3 6
;

proc print
    data=perm.small_example(obs=1);
  title1 "First row of data";
run;

ods pdf close;
