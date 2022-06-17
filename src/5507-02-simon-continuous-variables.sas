* Part01. Documentation header;


* 5507-02-simon-continuous-variables.sas
* author: Steve Simon
* date: created 2021-05-30
* purpose: to work with continuous variables
* license: public domain;

options papersize=(6in 4in);


* Speaker notes: This is the standard documentation header.;


* Part02. Tell SAS where to find and store things.;


filename fat
  "q:/introduction-to-sas/data/fat.txt";
  
libname intro
  "q:/introduction-to-sas/data";


ods pdf file=
  "q:/introduction-to-sas/results/5507-02-simon-continuous-variables.pdf";


* Speaker notes: You should already be familiar
with this. The filename statement tells you where
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


* Part03. Read in your data;


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

    
* Speaker notes: This is the code to input all
the variables in this data set. It is quite
long and does not fit on a single Powerpoint
slide.;


* Part04. Add variable labels;


label
    case="Case number"
    fat_brozek="Fat (Brozek's equation)"
    fat_siri="Fat (Siri's equation)"
    dens="Density"
    age="Age (yrs)"
    wt="Weight (lbs)"


    ht="Height (inches)"
    bmi="Body mass index (kg/m^2)"
    ffw="Fat Free Weight (lbs)"
    neck="Neck circumference (cm)"
    chest="Chest circumference (cm)"
    abdomen="Abdomen circumference (cm)"
    hip="Hip circumference (cm)"


    thigh="Thigh circumference (cm)"
    knee="Knee circumference (cm)"
    ankle="Ankle circumference (cm)"
    biceps="Biceps circumference (cm)"
    forearm="Forearm circumference (cm)"
    wrist="Wrist circumference (cm)";
run;


* Speaker notes: SAS offers an opportunity for 
you to add documentation to your program about 
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


* Some additional details about this data:

Brozek's equation is 457/Density - 414.2

Siri's equation is 495/Density - 450


Abdomen circumference is measured at the
umbilicus and level with the iliac crest

Wrist circumference is distal to the 
styloid processes;
    
    
* Speaker notes: I am including some additional
details that would not fit easily into the 
variable labels. How much documentation you
include is a judgment call. I am including
this extra documentation just to remind you
that such documentation is possible.;


* Part05. Print a small piece of the data;


proc print
    data=intro.fat(obs=10);
  var case fat_brozek fat_siri dens age;
  title1 "Ten rows and five columns";
  title2 "of the fat data set";
run;


* Speaker notes: It's always a good idea to
print out a small piece of your data to make
sure everything is okay.
  
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


* Figure 1. proc print.;


* Speaker notes: There are no obvious
problems with this dataset.;


proc contents
    data=intro.fat;
  title1 "Internal description of fat dataset";
run;


* Speaker notes. The contents procedure produces
information about any dataset produced by SAS,
including both temporary datasets (one part names)
and permanent datasets (two part names).

For a dataset that you just created and one that
is not all that complicated, using proc contents
is overkill. I am showing it so you will know how
to use proc contents for very complex datasets,
especially ones that were created by someone other 
than yourself.;


* Figure 2. proc contents (1 of 4).;


* Speaker notes: SAS produces a lot of information
and much of it is only relevant for advanced
applications. You have to wade through the details
to get the important information. The important 
information on this page is

date created,

date modified,

observations, and

variables.;


* Figure 3. proc contents (2 of 4).;


* Speaker notes. The only important things on 
this page are 

filename, and

release created (which tells the precise 
version of SAS that was used to create
this dataset.;


* Figure 4. proc contents (3 of 4).;


* Speaker notes: This page and the following
page lists all the variables in the dataset,
their type (all numeric in this dataset), and
the variable label.;


* Figure 5. proc contents (4 of 4).;


* Part06. Calculate simple statistics for ht;


proc means
    n mean std min max
    data=intro.fat;
  var ht;
  title1 "Descriptive statistics for ht";
  title2 "Notice the unusual minimum";
run;


* Speaker notes. The means procedure will produce 
descriptive statistics for your data. By default, 
it will produce the count of non-missing values, 
the mean, the standard deviation, and the minimum 
and maximum values, but I am listing them 
explicitly here, just for show.

The data option tells SAS which data set you want 
descriptive statistics on, and the var statement 
tells SAS which variable(s) you want descriptive 
statistics on.;


* Figure 6. proc means. 


* Speaker notes: This is what your output looks 
like.

Notice the unusual minimum value. While this is 
not totally outside the realm of possibility, you 
should always ask when you see something unusual 
like this.;


* Part07. Look at smallest value;


proc sort
    data=intro.fat;
  by ht;
run;


proc print
    data=intro.fat(obs=1);
  title1 "The row with the smallest ht";
  title2 "Note the inconsistency with wt";
run;


* Speaker notes. First, let's look at this value in the 
context of the other values in this row of data.

You do this by sorting the data so that the 
shortest subject becomes the first row of the 
data and the tallest subject becomes the last. 
Then print just the very first row of your data.

Warning! Be careful about sorting your data if 
you can't get the data easily back to the 
original order. It might be okay, but there are 
times when you'd like your data all the way back 
and that means data in the original order. This 
data set has a case variable that you can resort 
by in order to get back ot the original order.

If you don't have a case variable, store the 
sorted data in a separate location: something 
along the lines of proc sort data=x out=y.;


* Figure 7. proc print


* Speaker notes: This is what your output looks 
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


* Part08. Look at the largest value;


proc sort
    data=intro.fat;
  by descending ht;
run;


proc print
    data=intro.fat(obs=1);
  title1 "The row with the largest ht";
  title2 "This seems quite normal to me";
run;


* Speaker notes: Just for the sake of
completeness, let's look at the row of data
with the largest height value. Add the 
keyword desc to sort the data in reverse
order.;


* Figure 8. proc print.;


* Speaker notes: This is what your output
looks like. These values seem reasonable 
to me.;


* Part09. Removing the entire row;


data intro.fat1;
  set intro.fat;
  if ht > 29.5;
run;


* Speaker notes: This code removes the entire row
of data. Notice that I store the modified data
under a new name. That way, if I regret tossing
the entire row out, I can easily revert to the 
original data.;


proc contents
    data=intro.fat;
  title1 "Internal description of fat dataset";
run;


* Speaker notes: It is reasonable to check the contents
when you create a new file. In this case, the change
is so small that it is definitely overkill. I just
want to encourage you to think about using proc
contents as a way of reviewing your work in more
complex settings.;


* Figure 9. proc contents (1 of 5).;


* Figure 10. proc contents (2 of 5).;


* Speaker notes. The only important things on 
this page are 

filename, and

release created (which tells the precise 
version of SAS that was used to create
this dataset.;


* Figure 11. proc contents (3 of 5).;


* Speaker notes: This page and the following
page lists all the variables in the dataset,
their type (all numeric in this dataset), and
the variable label.;


* Figure 12. proc contents (4 of 5).;


* Figure 13. proc contents (5 of 5).;


* Speaker notes: You get an extra page for this dataset because it notes that your data is sorted by descending height.;


* Part10. Converting the outlier to a missing value;


data intro.fat2;
  set intro.fat;
  if ht=29.5 then ht=.;
run;


* Speaker notes: This code converts the height
to a missing value, but keeps the original data.

I won't use proc contents a third time.

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


* Part11. Faulty approach for filtering out negative values;


proc print
    data=intro.fat2;
  where ht < 0;
  title1 "ht < 0 will include ht = .";
run;


* Speaker notes: Here's an important thing to
remember about missing values. SAS stores 
missing value codes as the most extreme legal
negative number. This can sometimes lead to 
surprising and misleading results.

Every procedure in SAS has its own default 
approach to missing values and often provides you 
with one or more alternatives. You have to review 
this carefully for each and every statistical 
procedure that you run. If you do data 
manipulations involving missing values, you have 
to make sure that the result correctly reflects 
what you want.;


* Figure 14. proc print.;


* Speaker notes: This is what your output looks 
like.

In order to prevent this from happening, you need 
to check for missingness before applying any 
other logic statement.;


* Part12. Counting missing values;


proc means
    n nmiss mean std min max
    data=intro.fat2;
  var ht;
  title "Using the nmiss statistic";
run;


* Speaker notes: If you are concerned at all 
about missing values (and you should be), ask
for the number of missing values in proc means
using nmiss.;


* Figure 15. proc means.


* Speaker notes: This is what your output
looks like. Note that your data set has 251 
observations and 1 missing value.;


* Part13. Simple transformations;


data converted_units;
  set intro.fat2;
  ht_cm = round(ht * 2.54, 0.01);
  wt_kg = round(wt / 2.2, 0.01);
run;


proc print 
    data=converted_units(obs=10);
  var ht ht_cm wt wt_kg;
  title1 "Original and converted units";
run;


* Speaker notes: You can do simple transformations
like unit conversions in SAS. Create a new dataset 
with the data statement. Use the set command to 
tell SAS that you plan to use and modify an 
existing dataset.

The conversions done here will turn height and 
weight into centimeters and kilograms, 
respectively.;


* Figure 16. proc print.;


* Speaker notes: This is your output with 
measurements both in the original units and 
metric. Notice that I did not print any more than 
10 rows of data.;


* Part14. Display a histogram;


proc sgplot
    data=intro.fat2;
  histogram ht;
  title1 "Histogram with default bins";
run;


* Speaker notes: Here is the code to create a
histogram with the default option. Generally, it
is wise to modify the defaults for any graphic
image.;


* Figure 17. proc sgplot.;


* Speaker notes: This is the default histogram.;


* Part15. Revised histogram with narrow bins;


proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=1;
  title "Histogram with narrow bins";
run;


* Speaker notes: Here's the code to create a
histogram with many bars. The first bar is 
centered at 60, and each bin has a width of
1 inch (plus or minus 0.5 inches);


* Figure 18. proc sgplot.;


* Speaker notes: This is what you get. You can 
also go in the opposite direction.;


* Part16. Revised histogram with wide bins;


proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  title "Histogram with wide bins";
run;


* Speaker notes: Here's the code to create a 
histogram with few bars. The first bar is again
centered at 60, but now each bin has a width of
5 inches (plus or minus 2.5 inches).;


* Figure 19. proc sgplot.;


* Speaker notes: This is the revised histogram. 
There is no "correct" version of the histogram. 
Try several widths and see which one gives the 
clearest picture of your data.;


* Part17. Calculate correlations;


proc corr
    data=intro.fat2
    noprob nosimple;
  var fat_brozek fat_siri;
  with neck -- wrist;
  title "Correlation matrix";
run;


* Speaker notes: Here's the code to compute 
correlations.;


* Figure 20. proc corr (1 of 2).;


* Speaker notes: The output here extends to a
fresh page.;


* Figure 21. proc corr (2 of 2).;


* Speaker notes: The output here really annoys
me. I want to show something a bit advanced here.;


* Part18. Save the correlations in a separate data file.;


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


* Speaker notes: You can save the correlations
in a separate data file.;


* Figure 22. proc print (1 of 2).


* Speaker notes: Continues on the next slide.;


* Figure 23. proc print (2 of 2).


* Speaker notes: The output is a bit unusual 
because SAS wants to include means and standard 
deviations in your output. You can and should 
remove this. It would be easy enough to do (use 
the where statement), but I wanted to show you 
the full data set.;


* Part19. Modify these correlations.;


data correlations;
  set correlations;
  if _type_="CORR";
  drop _type_;
  fat_brozek=round(100*fat_brozek);
  fat_siri=round(100*fat_siri);
run;

proc sort
    data=correlations;
  by descending fat_brozek;
run;


* Speaker notes: Saving as a data file allows
you to manipulate the individual correlations.
Here we multiply the correlations by 100, round
them, and sort them. This can often simplify
the interpretation of large correlation matrices.

This code does the reordering and printing;


* Part20. Print the modified correlations.;


proc print 
    data=correlations;
  title "Rounded and re-ordered correlation matrix";
run;


* Speaker notes: Just to help visualize things,
let's print the file before we modify it.;


* Figure 24. proc print.


* Speaker notes: This is the output. You can 
see that measurements at the extremities are poor 
predictors of body fat. Apparently, we grow fat 
from the middle outward.;


* Part21. Draw a scatterplot.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  title1 "Simple scatterplot";
run;


* Speaker notes: A scatterplot is also useful for 
examining the relationship among variables. You 
can produce scatterplots several different ways, 
but the scatterplots produced by the sgplot 
procedure have the most flexibility.;


* Figure 25. proc sgplot.;


* Speaker notes: This plot shows a general 
upward trend.;


* Part22. Adding linear trend line.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  reg x=abdomen y=fat_brozek;
  title2 "with linear trend";
run;


* Speaker notes: The trend line is very useful for 
large and noisy data sets. It also allows you to 
more quickly visualize extreme values.

Notice that there is no title1. When you leave this
out, SAS will pull the title1 used in the previous
procedure, if it is available. This allows you to
repeat the top line title across broad sections of
your program.;


* Figure 26. proc sgplot.


* Speaker notes: Notice, for example, that the 
person with the largest abdomen measure (the 
biggest gut, if I can be informal) is quite out 
of line with what you might expect the 
relationship to be.;


* Part23. Adding a smooth curve.;


proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_brozek;
  pbspline x=abdomen y=fat_brozek;
  title2 "with a smooth curve";
run;

ods pdf close;


* Speaker notes: Here's the code to compute a smoothing
spline. It helps you visualize whether the trend
is linear or not.;


* Figure 27. proc sgplot.


* Speaker notes: The smoothing spline provides 
some evidence that the relationship is roughly 
linear a low and medium abdomen measurements, but 
tends to level off a bit at higher levels. 
Interpret this with caution, of course, because 
you have very little data at extrmemy high 
adbomen measures.;
