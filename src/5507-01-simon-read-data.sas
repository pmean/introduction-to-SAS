* 5507-01-simon-read-data.sas
  author: Steve Simon
  date: created 2022-06-09
  purpose: to read a small dataset
    from a separate file
  license: public domain;

libname perm "q:/introduction-to-sas/data";

filename rawdata
  "q:/introduction-to-sas/data/six-numbers.txt";

ods pdf file=
    "q:/introduction-to-sas/results/5507-01-simon-read-data.pdf";

data perm.small_example;
 infile rawdata;
 input x y;
run;

proc print
    data=perm.small_example(obs=1);
title "First row of data";
run;

ods pdf close;
