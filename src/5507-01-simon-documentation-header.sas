* 5507-01-[put your name here]-documentation-header.sas
* author: Steve Simon and [put your name here]
* date: created 2021-06-12
* purpose: to read and print a small dataset
* license: public domain;

data small_example;
  input x y;
  datalines;
1 2
2 4
3 6
;

proc print
    data=small_example(obs=1);
  title1 "First row of data";
run;
