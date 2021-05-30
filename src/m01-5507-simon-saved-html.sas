* m01-5507-simon-saved-html.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to save your output in html format
* license: public domain;

libname perm "../data";

ods html body=
  "../results/m01-5507-simon-saved-html.html";

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

ods html close;
