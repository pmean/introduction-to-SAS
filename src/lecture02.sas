* lecture02.sas
  written by Steve Simon
  October 22, 2018;


%let path=/myfolders/introduction-to-sas;

filename fat
  "&path/data/fat.txt";

* The libname statement tells SAS where you want
  it to place any permanent SAS data files            ;
  
libname intro
  "&path/bin";

* The ods statement tells SAS where to store your
  output and in what format.        
  
  VERY IMPORTANT! You need to turn off ODS at the 
  completion of your program or none of the 
  output gets saved.
  
  You can view the output on the screen and then
  save the output manually, but it is good form
  to explicity specify the location of output in 
  your program                                        ;  

ods pdf
  file="&path/results/lecture01.pdf";

* The data statement creates a new data set. If 
  you want a permanent data set, specify a two part
  name. The part before the period is the libname
  and tells SAS where to store your file. The part
  after the period gives the name of the file. By
  default, all SAS files use the extension .sas7bdat  
  
  The infile statement tells SAS where to find the
  raw data. The delimiter option tells SAS how to
  tell when one number stops and when another
  begins. In this example, spaces are delimiters.     
  
  The input statement tells SAS what the names are
  for the variables you are reading in.
  
  The label statement provides descriptive labels
  for your variables. You can use special characters
  like parentheses, slashes, and dashes that would
  not be allowed in a variable name. The variable
  label provides you with the opportunity to give
  a more detailed description of your variable,
  including the units of measurement. The variable
  labels will appear on some of the SAS output,
  which helps you clarify what the tables and
  graphs are representing.  
  
  The run statement tells SAS that you are ready
  to go and there is nothing more to input or 
  manipulate.                                         ;

data intro.fat;
  infile fat delimiter=' ';
  input 
    case
    fat_b
    fat_s
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
    fat_b="Percentage body fatusing Brozek's equation, 457/Density - 414.2"
    fat_s="Percent body fat using Siri's equation, 495/Density - 450"
    dens="Density"
    age="Age (yrs)"
    wt="Weight (lbs)"
    ht="Height (inches)"
    bmi="Adiposity index = Weight/Height^2 (kg/m^2)"
    ffw="Fat Free Weight = (1 - fraction of body fat) * Weight using Brozek's formula (lbs)"
    neck="Neck circumference (cm)"
    chest="85  Chest circumference (cm)"
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

* It's always a good idea to print out a small 
  piece of your data to make sure everything
  is okay.
  
  The data option tells SAS what data set you
  want to print. If you omit this, SAS will
  print the most recently created data set.
  
  The obs=10 option limits the number of rows 
  printed to the first 10. For large data sets,
  you should always take advantage of this 
  option.
  
  The var statement limits the variables that
  you print to those that you specify. Again,
  
  The title statement tells SAS to provide
  a descriptive title at the top of the page
  of output.
  
  The run statement says you're done with the
  procedure.
  
;
  
proc print
    data=intro.fat(obs=10);
  var case fat_b fat_s dens age;
  title1 "The first ten rows and five columns";
  title2 "of the fat data set";
run;

* This data set shows data various body 
  measurements. A brief description of this 
  file is available at

  http://www.amstat.org/publications/jse/datasets/fat.txt

  The means procedure will produce descriptive 
  statistics for your data. By default, it will
  produce the count of non-missing values, the 
  mean, the standard deviation, and the minimum
  and maximum values, but I am listing them
  explicitly here, just for show.
  
  The data option tells SAS which data set you
  want descriptive statistics on, and the var
  statement tells SAS which variable(s) you
  want descriptive statistics on.

  This data set did not have a header, a line
  at the very top of the file that lists 
  variable names. For files with a header, you
  should consider using the import procedure,
  which I will describe later.

  I'm using the variable names provided but if
  you create your own names, use brief (but 
  descriptive) name for EVERY variable in your
  data set. There's no precise rule, but names
  should be around 8 characters long. Longer 
  variable names make your typing tedious and 
  much shorter variable names makes your code 
  terse and cryptic.

  I'm a bit more terse with these variable names
  than I normally would be just to reduce the 
  amount of typing you have to do.

  You should avoid special symbols in your 
  variable names especially symbols that are 
  likely to cause confusion (the dash symbol,
  for example, which is also the symbol for 
  subtraction). You should also avoid blanks.
  These rules are pretty much universal across
  most statistical software packages.

  There are times when you'd like to have a 
  blank in your variable name and you can use
  two special symbols in SAS (and most other 
  statistical pacakges):

  * the underscore symbol (above the minus key
    on most keyboards) and
  * the dot (period).

  These symbols create some artificial spacing
  that mimics the blanks. Another approach is 
  "CamelCase" which is the mixture of upper and
  lower case within a variable name with each 
  uppercase designating the beginning of a new "word".
;

proc means
    n mean std min max
    data=intro.fat;
  var ht;
  title1 "Simple descriptive statistics for ht";
  title2 "Notice the unusual minimum value";
run;

* There is an unusual data value for ht, 29.5 inches.
  While this is not totally outside the realm of
  possibility, you should always ask when you
  see something unusual like this.

  First, let's look at this value in the context
  of the other values in this row of data.
;

proc sort
    data=intro.fat;
  by ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the smallest ht";
run;

* Clearly something is wrong. There's no way that a
  person with such a small height would have such a
  big weight.

  There are several ways to handle this outlier, but
  first, let's check to see if something weird is
  happening for the tallest person in the data set.
;

proc sort
    data=intro.fat;
  by descending ht;
run;

proc print
    data=intro.fat(obs=1);
  title1 "The row with the largest ht";
run;

* Seems normal enough to me. 

  With this outlier on the low end, you might
  consider doing nothing other than noting the
  unusual value.
  
  Alternately, you could delete the entire row
  associated with this value.

  Finally, you might consider converting the
  small ht value to a missing value code.
;

data intro.fat1;
  set intro.fat;
  if ht > 29.5;
run;

data intro.fat2;
  set intro.fat;
  if ht=29.5 then ht=.;
run;

 * There is no one method that is preferred 
   in this setting. If you encounter an unusual
   value, you should discuss it with your 
   research team, investigate the original
   data sources, if possible, and review any
   procedures for handling unusual data values
   that might be specified in your research
   protocol.

   Your data set may arrive with missing values
   in it already. Data might be designated as 
   missing for a variety of reasons (lab result
   lost, value below the limit of detection, 
   patient refused to answer this question) and
   how you handle missing values is way beyond 
   the scope of this class. Just remember to 
   tread cautiously around missing values as they
   are a minefield.

   Notice that I store the revised data sets with
   the row removed and with the 29.5 replaced by 
   a missing value in different data frames. This
   is good programming practice. If you ever have
   to make a destructive change to your data set
   (a change that wipes out one or more values or
   a change that is difficult to undo), it is good 
   form to store the new results in a fresh spot. 
   That way, if you get cold feet, you can easily
   backtrack.

   We'll use the data set with the 29.5 changed
   to a missing value for all of the remaining
   analyses of this data set.

   Logic statements involving missing value codes
   are tricky. SAS stores missing value codes as
   the most extreme legal negative number. So if
   you want, for example, to exclude negative
   values, make sure that you account for missing
   values as well.

   (ht < 0) & (ht ~= .) 
;

proc print
    data=intro.fat2;
  where ht < 0;
  title "ht < 0 will include ht = .";
run;

* Every procedure in SAS has its own default
  approach to missing values and often provides
  you with one or more alternatives.

  If you are concerned at all about missing 
  values, ask for the number of missing values
  in proc means using nmiss. 
;

proc means
    n nmiss mean std min max
    data=intro.fat2;
  var ht;
  title "Using the nmiss statistic";
run;

* You can also make simple transformations
  of your data, such as converting from
  English units to metric units.
;

data converted_units;
  set intro.fat2;
  ht_cm = ht * 2.54;
  wt_kg = wt / 2.2; 
run;

proc print 
    data=converted_units(obs=10);
  var ht ht_cm wt wt_kg;
  title "Original and converted units";
run;

* A histogram is useful for displaying a 
  continuous variable graphically.
;

proc sgplot
    data=intro.fat2;
  histogram ht;
  title "Histogram with default bins";
run;

* You should not accept the default width and
  starting values for your histogram, but 
  should specify values that are meaningful
  to you
;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=1;
  title "Histogram with narrow bins";
run;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  title "Histogram with wide bins";
run;

proc format;
  value range_fmt
    60="58-62"
	65="63-67"
	70="68-72"
	75="73-77"
	80="78-82"
  ;
run;

proc sgplot
    data=intro.fat2;
  histogram ht / binstart=60 binwidth=5;
  xaxis valuesformat=range_fmt.;
  title "Histogram with re-labeled bins";
run;

* Note to myself. Talk about saving graphs
  to a png file, datasets to a csv file.
;

* The correlation coefficient is a single 
  number between -1 and +1 that quantifies 
  the strength and direction of a relationship 
  between two continuous variables. As a rough 
  rule of thumb, a correlation larger than +0.7 
  indicates a strong positive association and a 
  correlation smaller than -0.7 indicates a 
  strong negative association. A correlation 
  between +0.3 and +0.7 (-0.3 and -0.7) indicates
  a weak positive (negative) association. A 
  correlation between -0.3 and +0.3 indicates 
  little or no association.

  Don't take these rules too literally. You're
  not trying to make definitive statements about
  your data set. You are just trying to get 
  comfortable with some general patterns that 
  occur in your data set. A complex and 
  definitive statistical analysis will almost
  certainly not agree with at least some of the
  preliminary correlations noted here.

  The corr procedure produces, by default, a
  square correlation matrix of all the 
  numeric variables. The noprob and nosimple
  options cut down on the amount of information
  printed. The with statement produces a
  rectangular correlation matrix.
;

proc corr
    data=intro.fat2
    noprob nosimple;
  var fat_b fat_s;
  with neck -- wrist;
  title "Correlation matrix";
run;

* You can save the correlations in a separate
  data file.
;

proc corr
    data=intro.fat2
    noprint
    outp=correlations;
  var fat_b fat_s;
  with neck -- wrist;
run;

proc print 
    data=correlations;
  title "Correlation matrix output to a data set";
run;

* Saving as a data file allows you to 
  manipulate the individual correlations.
  Here we multiply the correlations by 100,
  round them, and sort them. This can often
  simplify the interpretation of large
  correlation matrices.
;

data correlations;
  set correlations;
  if _type_="CORR";
  drop type;
  fat_b=round(100*fat_b);
  fat_s=round(100*fat_s);
run;

proc sort
    data=correlations;
  by descending fat_b;
run;

proc print 
    data=correlations;
  title "Rounded and re-ordered correlation matrix";
run;

* A scatterplot is also useful for examining the
  relationship among variables. You can produce
  scatterplots several different ways, but the
  scatterplots produced by the sgplot procedure
  have the most flexibility.
;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_b;
  title "Simple scatterplot";
run;

* The reg statement adds a least squares trend
  line to your graph.
;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_b;
  reg x=abdomen y=fat_b;
  title "Scatterplot with linear regression line";
run;

* The pbspline statement adds a smoothing spline
  to your graph;

proc sgplot
    data=intro.fat2;
  scatter x=abdomen y=fat_b;
  pbspline x=abdomen y=fat_b;
  title "Simple scatterplot";
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

8. Place all the key results into a Word 
document or PowerPoint presentation, or 
as a PDF file or as an HTML file.

;
ods pdf close;

