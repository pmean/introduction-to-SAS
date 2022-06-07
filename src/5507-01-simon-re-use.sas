* 5507-01-simon-re-use.sas
  author: Steve Simon
  date: created 2022-06-06
  purpose: calculate descriptive statistics 
    for strored data
  license: public domain;

libname perm "q:/introduction-to-sas/data";

proc means
    data=perm.simple_example;
  title1 "Descriptive statistics";
run;
