Filename housing "q:/Introduction to SAS/data/housing.txt";

libname perm
  "q:/introduction-to-sas/data";

ods pdf file=
  "q:/Introduction-to-SAS/results/5507-05-oyetunji-housing-data.pdf";

proc import
    datafile="q:/Introduction-to-SAS/data/housing.txt"
     out=perm.housing
     dbms=dlm
replace;
     delimiter="09"X;
     getnames=yes;
run;

proc format;
  value fnortheast
    0 = "No"
    1 = "Yes";
  value fcustom_build
    0 = "No"
    1 = "Yes";
  value fcorner_lot
    0 = "No"
    1 = "Yes";
run;

data perm.housing;
  set perm.housing;
  label
    price= "Selling price (in dollars)"
    sqft= "Square feet of living space"
    age= "Age of home (years")
    features= "Number out of features"
    northeast= "Located in northeast sector of city"
    custom_build= "Custom built"
    corner_lot= "Corner location"
run;

proc print
     data=perm.housing(obs=10);
  title1 "first 10 0bservations only";
  run;

  proc freq
      data=perm.housing;
  tables northeast custom_build corner_lot/missing;
  run;

proc means
    n nmiss 
    data=perm.housing;
var price sqft age features;
  title1 "Q1a: Number of missing variables";
  title2 "";
run;

proc sort
    data=perm.housing;
by custom_build;
run;

proc means
    data=perm.housing;
by custom_build;
var price;
  title3 "Q2: How much more do custom built houses cost on average";
  title4 " ";
  run;

proc sgplot
  data=perm.housing;
  vbox sqft / category=custom_build;
  title1 "Q3: Do custom built houses tend to be bigger?";
  title2 "Yes";
  run;

proc freq
   data=perm.housing;
 tables corner_lot*custom_build/nocol nopercent;
 title2 "Q4. Are custom built houses more likely to appear on corner lots";
 title3 "Yes";
 run;

ods pdf close;
