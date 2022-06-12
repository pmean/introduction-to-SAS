* 5507-01-simon-save-output-data.sas
  author: Steve Simon
  date: created 2022-06-06
  purpose: to read a small dataset
    from a separate file
  license: public domain;

libname perm "q:/introduction-to-sas/data";

ods pdf file=
    "q:/introduction-to-sas/results/5507-01-simon-save-output.pdf";

data perm.small_example;
 input x y;
 datalines;
1 2
2 4
3 6
;

proc print
    data=perm.small_example(obs=1);
title "First row of data";
run;

ods pdf close;
