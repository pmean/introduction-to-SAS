* hw01.sas
  written by Steve Simon
  September 17, 2018;

%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

filename sleep
  "&path/data/sleep.txt";

libname intro
  "&path/bin";

ods pdf
  file="&path/results/hw01.pdf";
filename sleep
  "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/data/sleep.txt";

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
    predation
    exposure
    danger;
  nondreaming1 = nondreaming + 0;
  dreaming1 = dreaming + 0;
  totalsleep1 = totalsleep + 0;
  lifespan1 = lifespan + 0;
  gestation1 = gestation + 0;
run;
 
proc print
    data=intro.sleep(obs=10);
  var species bodywt totalsleep totalsleep1;
  title1 "The first ten rows and two columns";
  title2 "of the sleep data set";
run;

proc means
    data=intro.sleep;
  title "Descriptive statistics for all continuous variables";
run;


ods pdf close;
