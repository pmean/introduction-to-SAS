* hw1.sas
  written by Steve Simon
  September 17, 2018;

filename sleep
  "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/data/sleep.txt";

libname intro
  "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/bin/introduction-to-sas";

ods pdf
  file="c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/results/hw1.pdf";

data intro.sleep;
  infile sleep delimiter='09'X firstobs=2;
  input 
    species $
    bodywt
    brainwt
    nondreaming $
    dreaming $
    totalsleep $
    lifespan $
    gestation $
    predation $
    exposure $
    danger $;
  totalsleep1 = totalsleep + 0;
run;
 
proc print
    data=intro.sleep(obs=10);
  var species bodywt totalsleep totalsleep1;
  title1 "The first ten rows and two columns";
  title2 "of the sleep data set";
run;

ods pdf close;
