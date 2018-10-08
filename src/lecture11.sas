* lecture11.sas
  written by Steve Simon
  September 7, 2018;

%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

filename fat
  "&path/data/fat.txt";

libname intro
  "&path/bin";

ods pdf
  file="&path/results/lecture01.pdf";


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

ods pdf close;

