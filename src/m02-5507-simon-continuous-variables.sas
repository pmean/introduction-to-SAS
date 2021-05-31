* m02-5507-simon-continuous-variables.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to work with continuous variables
* license: public domain;

options papersize=(6 4);

%let p=q:/introduction-to-sas;

filename fat
  "&p/data/fat.txt";

libname intro
  "&p/data";

ods pdf file=
  "&p/results/m02-5507-simon.pdf";

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
    chest="+ SimplChest circumference (cm)"
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

* Print a small piece of the data;

proc print
    data=intro.fat(obs=10);
  var case fat_brozek fat_siri dens age;
  title1 "The first ten rows and five columns";
  title2 "of the fat data set";
run;

* Calculate simple statistics for ht;

proc means
    n mean std min max
    data=intro.fat;
  var ht;
  title1 "Simple descriptive statistics for ht";
  title2 "Notice the unusual minimum value";
run;

* Look at smallest value;

proc sort
    data=intro.fat;
  by ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the smallest ht";
  title2 "Note the inconsistency with wt";
run;

* Look at the largest value;

proc sort
    data=intro.fat;
  by descending ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the largest ht";
  title2 "This seems quite normal to me";
run;

* Removing the entire row;

data intro.fat1;
  set intro.fat;
  if ht > 29.5;
run;

* Converting the outlier to a missing value;

data intro.fat2;
  set intro.fat;
  if ht=29.5 then ht=.;
run;

* Faulty approach for filtering out negative values;

proc print
    data=intro.fat2;
  where ht < 0;
  title1 "ht < 0 will include ht = .";
run;

* Counting missing values;

proc means
    n nmiss mean std min max
    data=intro.fat2;
  var ht;
  title "Using the nmiss statistic";
run;

* Simple transformations;

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

* Display a histogram;

proc sgplot
    data=intro.fat2;
  histogram ht;
  title "Histogram with default bins";
run;

* Revised histogram with narrow bins;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=1;
  title "Histogram with narrow bins";
run;

* Revised histogram with wide bins;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  title "Histogram with wide bins";
run;

* Note to myself. Talk about saving graphs
  to a png file, datasets to a csv file.
;

* Calculate correlations;

proc corr
    data=intro.fat2
    noprob nosimple;
  var fat_brozek fat_siri;
  with neck -- wrist;
  title "Correlation matrix";
run;

* Save the correlations in a separate data file.;

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

* Modifying these correlations.;

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

proc print 
    data=correlations;
  title "Rounded and re-ordered correlation matrix";
run;

* Draw a scatterplot.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  title "Simple scatterplot";
run;

* Adding linear trend line.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  reg x=abdomen y=fat_brozek;
  title "Scatterplot with linear regression line";
run;

* Adding a smooth curve.;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  pbspline x=abdomen y=fat_brozek;
  title "Scatterplot with a smooth curve";
run;

* Homework01.

Having reviewed these analyses, I would like 
you to turn in some simple analyses that you 
run on a fresh data set. This homework 
assignment will be graded pass/fail.

There is a second data set on sleep in 
mammals. You can find a brief description of
this data set at

--> http://www.statsci.org/data/general/sleep.html

and you can download the actual data at

--> http://www.statsci.org/data/general/sleep.txt

For every question, include the relevant SAS 
output and a brief written commentary explaining
what the results mean. When you send your 
answers, please include the original questions.

1. Notice that there is a huge range in body 
weight. Display the information for the 
smallest and the largest mammals.

2. Which variables have missing data?

3. Calculate the mean and standard deviation 
for TotalSleep.

4. Draw a histogram for the BodyWt variable.
Note that this variable is highly skewed. 
Re-draw the histogram on the log scale. 
For exta credit, relabel the axes with values
at 0.001, 0.01, etc.

5. Calculate the ratio of BrainWt to BodyWt 
and express it as a percentage. Be sure to 
convert grams to kilograms (or vice versa) 
before computing the ratio. What animal has
the smallest/largest ratio?

6. Do bigger animals sleep longer or live
longer? Show your results using a correlation
coefficient.

7. Do animals who have high degrees of 
Predation, Exposure, or Danger sleep less?
Show your results using a plot and a trendline.

8. Place all the key results into a document
and copy the original questions and include
your own written answer along with the 
appropriate supporting tables or graphs.
Do NOT submit uneditted and unannoted
SAS output. You can use any program to
prepare the output, but convert it to a PDF
format before submission. If you have any
difficulty producing a PDF document, please
talk to me.

;
ods pdf close;

