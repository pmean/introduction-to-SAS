* lecture1.sas
  written by Steve Simon
  September 7, 2018;

* Before you start any serious SAS programming,
  tell SAS where everything belongs
  
  The filename statement tells SAS where you 
  have placed your raw data file.                     ;

filename fat
  "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/data/fat.txt";

* The libname statement tells SAS where you want
  it to place any permanent SAS data files            ;
  
libname intro
  "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas";

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
  file="c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/results/lecture1.pdf";

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

* The means procedure will produce descriptive 
  statistics for your data. By default, it will
  produce the count of non-missing values, the 
  mean, the standard deviation, and the minimum
  and maximum values, but I am listing them
  explicitly here, just for show.
  
  The data option tells SAS which data set you
  want descriptive statistics on, and the var
  statement tells SAS which variable(s) you
  want descriptive statistics on.

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
  
  There are three options for handling this
  unusual value.
  
;

ods pdf close;
