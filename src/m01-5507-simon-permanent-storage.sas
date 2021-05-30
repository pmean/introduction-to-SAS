* m01-5507-simon-permanent-storage.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to store data set in a permanent location
* license: public domain;

libname perm "../data";

data perm.simple_example;
  input x y;
datalines;
1 2
2 4
3 6
;
proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;
