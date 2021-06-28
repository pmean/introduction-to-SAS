* m02-5507-simon-hw02b-q4.sas
* author: Steve Simon
* creation date: 2021-06-14
* purpose: to draw and interpret histograms
* license: public domain;

%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/m02-5507-simon-hw02c-q4-output.pdf";

libname perm
    "&path/data";

proc sort 
    data=perm.cigarettes;
  by descending tar;
run;

proc sgplot
    data=perm.cigarettes;
  histogram tar;
  title1 "M02-Q4. Draw a histogram for tar, nicotine,";
  title2 "weight, and co. Do these histograms provide";
  title3 "evidence that the data follows a classic bell";
  title4 "shaped curve?";
  footnote1 "Tar has a distribution that is";
  footnote2 "reasonably close to a bell shaped curve";
run;

proc sgplot
    data=perm.cigarettes;
  histogram nicotine;
  footnote1 "Nicotine has a distribution that is";
  footnote2 "reasonably close to a bell shaped curve";
run;

proc sgplot
    data=perm.cigarettes;
  histogram weight;
  footnote1 "Weight has a distribution that is";
  footnote2 "reasonably close to a bell shaped curve";
run;

proc sgplot
    data=perm.cigarettes;
  histogram co;
  footnote1 "CO has a distribution that is";
  footnote2 "reasonably close to a bell shaped curve";
run;


ods pdf close;
