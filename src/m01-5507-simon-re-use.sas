* m01-5507-simon-re-use.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to re-use stored data
* license: public domain;

* re-use.sas 
written by Steve Simon;

libname perm "q:/Documents/results";

proc means
    data=perm.simple_example;
  title1 "Descriptive statistics";
run;
