* m02-5507-simon-continuous-variables.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to work with continuous variables
* license: public domain;

options papersize=(6 4); * needed to have the output fit on PowerPoint;

%let p=q:/introduction-to-sas;

filename fat
  "&p/data/fat.txt";

libname intro
  "&p/data";

ods pdf file=
  "&p/results/m02-5507-simon.pdf";

* Part01. Read in the data;

data intro.fat;
  infile fat;
  input 
    case
    fat_brozek
    fat_siri
    dens
    age
    wt
    ht
    bmi
    ffw
    neck
    chest
    abdomen
    hip
    thigh
    knee
    ankle
    biceps
    forearm
    wrist;

* Part02. Add variable labels;

  label
    case="Case number"
    fat_brozek="Percentage body fat using Brozek's equation, 457/Density - 414.2"
    fat_siri="Percent body fat using Siri's equation, 495/Density - 450"
    dens="Density"
    age="Age (yrs)"
    wt="Weight (lbs)"
    ht="Height (inches)"
    bmi="Adiposity index = Weight/Height^2 (kg/m^2)"
    ffw="Fat Free Weight = (1 - fraction of body fat) * Weight using Brozek's formula (lbs)"
    neck="Neck circumference (cm)"
    chest="Chest circumference (cm)"
    abdomen="Abdomen circumference (cm) at the umbilicus and level with the iliac crest"
    hip="Hip circumference (cm)"
    thigh="Thigh circumference (cm)"
    knee="Knee circumference (cm)"
    ankle="Ankle circumference (cm)"
    biceps="Extended biceps circumference (cm)"
    forearm="Forearm circumference (cm)"
    wrist="Wrist circumference (cm) distal to the styloid processes"  
  ;
run;

* Part03. Print a small piece of the data;

proc print
    data=intro.fat(obs=10);
  var case fat_brozek fat_siri dens age;
  title1 "The first ten rows and five columns";
  title2 "of the fat data set";
run;

* Part04. Calculate simple statistics for ht;

proc means
    n mean std min max
    data=intro.fat;
  var ht;
  title1 "Simple descriptive statistics for ht";
  title2 "Notice the unusual minimum value";
run;

* Part05. Look at smallest value;

proc sort
    data=intro.fat;
  by ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the smallest ht";
  title2 "Note the inconsistency with wt";
run;

* Part06. Look at the largest value;

proc sort
    data=intro.fat;
  by descending ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the largest ht";
  title2 "This seems quite normal to me";
run;

* Part07. Removing the entire row;

data intro.fat1;
  set intro.fat;
  if ht > 29.5;
run;

* Part08. Converting the outlier to a missing value;

data intro.fat2;
  set intro.fat;
  if ht=29.5 then ht=.;
run;

* Part09. Faulty approach for filtering out negative values;

proc print
    data=intro.fat2;
  where ht < 0;
  title1 "ht < 0 will include ht = .";
run;

* Part10. Counting missing values;

proc means
    n nmiss mean std min max
    data=intro.fat2;
  var ht;
  title "Using the nmiss statistic";
run;

* Part11. Simple transformations;

data converted_units;
  set intro.fat2;
  ht_cm = ht * 2.54;
  wt_kg = wt / 2.2; 
run;

proc print 
    data=converted_units(obs=10);
  var ht ht_cm wt wt_kg;
  title1 "Original and converted units";
run;

* Part12. Display a histogram;

proc sgplot
    data=intro.fat2;
  histogram ht;
  title "Histogram with default bins";
run;

* Part13. Revised histogram with narrow bins;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=1;
  title "Histogram with narrow bins";
run;

* Part14. Revised histogram with wide bins;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  title "Histogram with wide bins";
run;

* Part15. Calculate correlations;

proc corr
    data=intro.fat2
    noprob nosimple;
  var fat_brozek fat_siri;
  with neck -- wrist;
  title "Correlation matrix";
run;

* Part16. Save the correlations in a separate data file.;

proc corr
    data=intro.fat2
    noprint
    outp=correlations;
  var fat_brozek fat_siri;
  with neck -- wrist;
run;

proc print 
    data=correlations;
  title "Correlation matrix output to a data set";
run;

* Part17. Modify these correlations.;

data correlations;
  set correlations;
  if _type_="CORR";
  drop type;
  fat_brozek=round(100*fat_brozek);
  fat_siri=round(100*fat_siri);
run;

proc sort
    data=correlations;
  by descending fat_brozek;
run;

* Part18. Print the modified correlations.;

proc print 
    data=correlations;
  title "Rounded and re-ordered correlation matrix";
run;

* Part19. Draw a scatterplot.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  title "Simple scatterplot";
run;

* Part20. Adding linear trend line.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  reg x=abdomen y=fat_brozek;
  title "Scatterplot with linear regression line";
run;

* Part21. Adding a smooth curve.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  pbspline x=abdomen y=fat_brozek;
  title "Scatterplot with a smooth curve";
run;

ods pdf close;

* End of program;

