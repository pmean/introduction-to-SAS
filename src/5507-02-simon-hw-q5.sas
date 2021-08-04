* 5507-02-simon-hw-q5.sas
* author: Steve Simon
* creation date: 2021-06-14
* purpose: to draw a scatterplot between tar and nicotine
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/5507-02-simon-hw-q5.pdf";

libname perm
    "&path/data";

proc sgplot
    data=perm.cigarettes;
  scatter x=tar y=nicotine;
  reg x=tar y=nicotine;
  title1 "M02-Q5. Draw a scatterplot showing the relationship";
  title2 "between tar and nicotine (tar on the x-axis, nicotine";
  title3 "on the y-axis). Include a linear trend line. Is there";
  title4 "a positive or negative relationship between these two"; 
  title5 "variables?";
  footnote1 "There is a positive relationship between tar and nicotine.";
run;

ods pdf close;
