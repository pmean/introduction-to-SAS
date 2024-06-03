* 5507-01-simon-documentation-header.sas
  author: Steve Simon
  date: created 2022-06-06
  purpose: to read and print a small dataset
  license: public domain;

data small_example;
 input x y;
 datalines;
1 2
2 4
3 6
;

proc print
    data=small_example(obs=1);
title "First row of data";
run;
