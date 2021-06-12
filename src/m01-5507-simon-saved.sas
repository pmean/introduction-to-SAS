* m01-5507-simon-saved-pdf.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to save your output in pdf format
* license: public domain;

* saved-pdf.sas 
written by Steve Simon;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

ods pdf file=
  "&path/results/m01-5507-simon.pdf";

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

ods pdf close;
