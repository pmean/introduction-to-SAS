* 5507-01-simon-re-use.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to re-use stored data
* license: public domain;

libname perm "../data";

proc means
    data=perm.simple_example;
  title1 "Descriptive statistics";
run;
