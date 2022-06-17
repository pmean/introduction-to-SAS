
* Speaker notes: This is the standard documentation header.;


* Part02. Tell SAS where to find and store things.;


libname intro
  "q:/introduction-to-sas/data";

options papersize=(6in 4in); 

ods pdf file=
  "q:/introduction-to-sas/results/tmp2.pdf";

proc datasets
    nolist
    library=intro;
  contents data=fat;
run;

ods pdf close;


