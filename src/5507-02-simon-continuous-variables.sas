* Part00. Documentation header;


* 5507-02-simon-continuous-variables.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to work with continuous variables
* license: public domain;


* Notes00 This is the standard documentation header.;


* Part01. Tell SAS where to find and store things.;


options papersize=(6 4); * needed to have the output fit on PowerPoint;

%let p=q:/introduction-to-sas;

filename fat
  "&p/data/fat.txt";

libname intro
  "&p/data";

ods pdf file=
  "&p/results/5507-02-simon-continuous-variables.pdf";


* Notes01. You should already be familiar with 
this. The filename statement tells you where
the raw data is stored. The libname statement
tells you where SAS will store any permanent 
datsets. The ods statement tells you that SAS is 
going to store the results with a particular 
filename and in pdf format.

Today, you will analyze some data sets that have
mostly continuous variables. The first dataset
at body measurements.

The input statement is very long and
does not fit on a single slide. Go to the Canvas
site if you want to see the full code.;


* Part02. Read in your data;


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

    
* Notes02. This is the code to input all the 
variables in this data set. It is quite long 
and does not fit on a single Powerpoint slide.;


* Part03. Add variable labels;


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


* Notes03. SAS offers an opportunity for you to 
add documentation to your program about 
individual variables. These are called variable
labels. They have almost no restrictions. You can 
use blanks, or special symbols like a dollar sign 
or a dash. The documentation that variable labels 
provide is mostly internal, but these labels are 
substituted in a few places like some graphs.

I strongly recommend use of variable labels and 
will require them for any homework you submit in 
this class. See the grading rubric for details.

What makes a good variable label? First take 
advantage of a mixture of upper and lower case 
to make your labels more readable. Spell out any 
abbreviations, even obvious abbreviations. If 
your variable has a measurement unit, specify 
that unit in your variable label. If there are 
other important details, put these in the 
variable label as well.

Every variable in a SAS program should have a 
label. This label will make some (but not all) 
of the SAS output more readable. it is also part 
of the internal documentation of your program. 
Note that some of these labels do not fit well 
in this Powerpoint slide, but that's okay.;


* Part04. Print a small piece of the data;


proc print
    data=intro.fat(obs=10);
  var case fat_brozek fat_siri dens age;
  title1 "The first ten rows and five columns";
  title2 "of the fat data set";
run;


* Notes04. It's always a good idea to print out 
a small piece of your data to make sure 
everything is okay.
  
The data option tells SAS what data set you want 
to print. If you omit this, SAS will print the 
most recently created data set.
  
The obs=10 option limits the number of rows 
printed to the first 10. For large data sets, you 
should always take advantage of this option.
  
The var statement limits the variables that you 
print to those that you specify. Again, this is 
important for large data sets. 

Please do not ever print more than ten rows or 
more than five variables, if you can help it. 
Excessively lengthy outputs will lose you a few 
points (see the grading rubric).
  
The title statement tells SAS to provide a 
descriptive title at the top of the page of 
output.
  
The run statement says you're done with the 
procedure.;


* Output, page 1. There are no obvious problems 
with this dataset.;


* Part05. Calculate simple statistics for ht;


proc means
    n mean std min max
    data=intro.fat;
  var ht;
  title1 "Simple descriptive statistics for ht";
  title2 "Notice the unusual minimum value";
run;


* Notes05. The means procedure will produce 
descriptive statistics for your data. By default, 
it will produce the count of non-missing values, 
the mean, the standard deviation, and the minimum 
and maximum values, but I am listing them 
explicitly here, just for show.

The data option tells SAS which data set you want 
descriptive statistics on, and the var statement 
tells SAS which variable(s) you want descriptive 
statistics on.;


* Output, page 2. This is what your output looks 
like.

Notice the unusual minimum value. While this is 
not totally outside the realm of possibility, you 
should always ask when you see something unusual 
like this.;


* Part06. Look at smallest value;


proc sort
    data=intro.fat;
  by ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the smallest ht";
  title2 "Note the inconsistency with wt";
run;


* Notes06. First, let's look at this value in the 
context of the other values in this row of data.

You do this by sorting the data so that the 
shortest subject becomes the first row of the 
data and the tallest subject becomes the last. 
Then print just the very first row of your data.

Warning: be careful about sorting your data if 
you can't get the data easily back to the 
original order. It might be okay, but there are 
times when you'd like your data all the way back 
and that means data in the original order. This 
data set has a case variable that you can resort 
by in order to get back ot the original order.

If you don't have a case variable, store the 
sorted data in a separate location: something 
along the lines of proc sort data=x out=y.;


* Output, page 3. This is what your output looks 
like.

There is no possible way that a height of 29.5 
inches could be paired with a weight of 205 
pounds.

With this outlier on the low end, you might 
consider doing nothing other than noting the 
unusual value.

Alternately, you could delete the entire row 
associated with this value. Finally, you might 
consider converting the small ht value to a 
missing value code.

There is no one method that is preferred in this 
setting. If you encounter an unusual value, you 
should discuss it with your research team, 
investigate the original data sources, if 
possible, and review any procedures for handling 
unusual data values that might be specified in 
your research protocol.

Your data set may arrive with missing values in 
it already. Data might be designated as missing 
for a variety of reasons (lab result lost, value 
below the limit of detection, patient refused to 
answer this question) and how you handle missing 
values is way beyond the scope of this class. 
Just remember to tread cautiously around missing 
values as they are a minefield.

Notice that I store the revised data sets with 
the row removed and with the 29.5 replaced by a 
missing value in different data frames. This is 
good programming practice. If you ever have to 
make a destructive change to your data set (a 
change that wipes out one or more values or a 
change that is difficult to undo), it is good 
form to store the new results in a fresh spot. 
That way, if you get cold feet, you can easily 
backtrack.

We'll use the data set with the 29.5 changed to a 
missing value for all of the remaining analyses 
of this data set.

Logic statements involving missing value codes 
are tricky. SAS stores missing value codes as the 
most extreme legal negative number. So if you 
want, for example, to exclude negative values, 
make sure that you account for missing values as 
well.

   (ht < 0) & (ht ~= .); 


* Part07. Look at the largest value;


proc sort
    data=intro.fat;
  by descending ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the largest ht";
  title2 "This seems quite normal to me";
run;


* Notes07. Just for the sake of completeness, 
let's look at the row of data with the largest 
height value. Add the keyword desc to sort the 
data in reverse order.;


* Output, page 4. This is what your output looks 
like. These values seem reasonable to me.;


* Part08. Removing the entire row;


data intro.fat1;
  set intro.fat;
  if ht > 29.5;
run;


* Notes08. This code removes the entire row of 
data. Notice that I store the modified data under 
a new name. That way, if I regret tossing the 
entire row out, I can easily revert to the 
original data.;


* Part09. Converting the outlier to a missing value;


data intro.fat2;
  set intro.fat;
  if ht=29.5 then ht=.;
run;


* Notes09. This code converts the height to a 
missing value, but keeps the original data.

There is no one method that is preferred in 
this setting. If you encounter an unusual value, 
you should discuss it with your research team, 
investigate the original data sources, if 
possible, and review any procedures for handling 
unusual data values that might be specified in 
your research protocol.

Your data set may arrive with missing values in 
it already. Data might be designated as missing 
for a variety of reasons (lab result lost, value 
below the limit of detection, patient refused to 
answer this question) and how you handle missing 
values is way beyond the scope of this class. 
Just remember to tread cautiously around missing 
values as they are a minefield.

Notice that I store the revised data sets with 
the row removed and with the 29.5 replaced by a 
missing value in different data frames. This is 
good programming practice. If you ever have to 
make a destructive change to your data set (a 
change that wipes out one or more values or a 
change that is difficult to undo), it is good 
form to store the new results in a fresh spot. 
That way, if you get cold feet, you can easily 
backtrack.

We'll use the data set with the 29.5 changed to a 
missing value for all of the remaining analyses 
of this data set.;


* Part10. Faulty approach for filtering out negative values;


proc print
    data=intro.fat2;
  where ht < 0;
  title1 "ht < 0 will include ht = .";
run;


* Notes10. Here's an important thing to remember 
about missing values. SAS stores missing value 
codes as the most extreme legal negative number. 
This can sometimes lead to surprising and 
misleading results.

Every procedure in SAS has its own default 
approach to missing values and often provides you 
with one or more alternatives. You have to review 
this carefully for each and every statistical 
procedure that you run. If you do data 
manipulations involving missing values, you have 
to make sure that the result correctly reflects 
what you want.;


* Output, page 5. This is what your output looks 
like.

In order to prevent this from happening, you need 
to check for missingness before applying any 
other logic statement.;


* Part11. Counting missing values;


proc means
    n nmiss mean std min max
    data=intro.fat2;
  var ht;
  title "Using the nmiss statistic";
run;


* Notes11. If you are concerned at all about 
missing values (and you should be), ask for the 
number of missing values in proc means using 
nmiss.;


* Output, page 6. This is what your output looks 
like. Note that your data set has 251 
observations and 1 missing value.;


* Part12. Simple transformations;


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


* Notes12. You can do simple transformations like 
unit conversions in SAS. Create a new dataset 
with the data statement. Use the set command to 
tell SAS that you plan to use and modify an 
existing dataset.

The conversions done here will turn height and 
weight into centimeters and kilograms, 
respectively.;


* Output, page 7. This is your output with 
measurements both in the original units and 
metric. Notice that I did not print any more than 
10 rows of data.;


* Part13. Display a histogram;


proc sgplot
    data=intro.fat2;
  histogram ht;
  title "Histogram with default bins";
run;


* Notes13. Here's the code to create a histogram 
with the default option. Generally, it is wise to 
modify the defaults for any graphic image.;


* Output, page 8. This is the default histogram.;


* Part14. Revised histogram with narrow bins;


proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=1;
  title "Histogram with narrow bins";
run;


* Notes14. Here's the code to create a histogram 
with many bars. The first bar is centered at 60, 
and each bin has a width of 1 inch (plus or minus 
0.5 inches);


* Output, page 9. This is what you get. You can 
also go in the opposite direction.;


* Part15. Revised histogram with wide bins;


proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  title "Histogram with wide bins";
run;


* Notes15. Here's the code to create a histogram 
with few bars. The first bar is again centered at 
60, but now each bin has a width of 5 inches 
(plus or minus 2.5 inches).;


* Output, page 10. This is the revised histogram. 
There is no "correct" version of the histogram. 
Try several widths and see which one gives the 
clearest picture of your data.;


* Part16. Calculate correlations;


proc corr
    data=intro.fat2
    noprob nosimple;
  var fat_brozek fat_siri;
  with neck -- wrist;
  title "Correlation matrix";
run;


* Notes16. Here's the code to compute 
correlations.;


* Output, page 11. The output here extends to a
fresh page.;


* Output, page 12. The output here really annoys
me. I want to show something a bit advanced here.;


* Part17. Save the correlations in a separate data file.;


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


* Notes17. You can save the correlations in a 
separate data file.;


* Output, page 13. Continues on the next slide.;


* Output, page 14. The output is a bit unusual 
because SAS wants to include means and standard 
deviations in your output. You can and should 
remove this. It would be easy enough to do (use 
the where statement), but I wanted to show you 
the full data set.;


* Part18. Modify these correlations.;


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


* Notes18. Saving as a data file allows you to 
manipulate the individual correlations. Here we 
multiply the correlations by 100, round them, and 
sort them. This can often simplify the 
interpretation of large correlation matrices.

This code does the reordering and printing;


* Part19. Print the modified correlations.;


proc print 
    data=correlations;
  title "Rounded and re-ordered correlation matrix";
run;


* Notes19. Just to help visualize things, let's
print the file before we modify it.;


* Output, page 15. This is the output. You can 
see that measurements at the extremities are poor 
predictors of body fat. Apparently, we grow fat 
from the middle outward.;


* Part20. Draw a scatterplot.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  title "Simple scatterplot";
run;


* Notes20. A scatterplot is also useful for 
examining the relationship among variables. You 
can produce scatterplots several different ways, 
but the scatterplots produced by the sgplot 
procedure have the most flexibility.;


* Output, page 16. This plot shows a general 
upward trend.;


* Part21. Adding linear trend line.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  reg x=abdomen y=fat_brozek;
  title "Scatterplot with linear regression line";
run;


* Notes21. The trend line is very useful for 
large and noisy data sets. It also allows you to 
more quickly visualize extreme values.;


* Output, page 17.  Notice, for example, that the 
person with the largest abdomen measure (the 
biggest gut, if I can be informal) is quite out 
of line with what you might expect the 
relationship to be.;


* Part22. Adding a smooth curve.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  pbspline x=abdomen y=fat_brozek;
  title "Scatterplot with a smooth curve";
run;

ods pdf close;


* Notes22. Here's the code to compute a smoothing
spline. It helps you visualize whether the trend
is linear or not.;


* Output, page 18. The smoothing spline provides 
some evidence that the relationship is roughly 
linear a low and medium abdomen measurements, but 
tends to level off a bit at higher levels. 
Interpret this with caution, of course, because 
you have very little data at extrmemy high 
adbomen measures.;


* Part23. End of program;
