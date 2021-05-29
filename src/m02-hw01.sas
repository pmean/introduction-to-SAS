* simon-5507-hw01.sas

  Written by Steve Simon, creation date: 2018-09-17

  This program reads the sleep data set and produces
  some simple descriptive statistics. It is placed
  in the public domain and you can use this in any
  way you please.;

%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;
%let xpath=/folders/myfolders/introduction-to-sas;

ods pdf
  file=
    "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/part1/results/hw01.pdf";

filename sleep
    "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/part1/data/sleep_modified.txt";

libname intro
    "c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas/part1/data";

data intro.sleep_modified;
  infile sleep delimiter=' ';
  informat species $24.;
  input 
    species
    bodywt
    brainwt
    nondreaming
    dreaming
    totalsleep
    lifespan
    gestation
    predation
    exposure
    danger;
  label
    BodyWt = "body weight (kg)"
    BrainWt = "brain weight (g)"
	NonDreaming = "slow wave (nondreaming) sleep (hrs/day)"
	Dreaming = "paradoxical (dreaming) sleep (hrs/day)"
	TotalSleep = "total sleep, sum of slow wave and paradoxical sleep (hrs/day)"
	LifeSpan = "maximum life span (years)"
	Gestation = "gestation time (days)"
	Predation = "predation index (1-5) 1 = least predated"
	Exposure = "sleep exposure index (1-5) 1 = least exposed"
	Danger = "overall danger index (1-5) (based on predation and exposure)";
run;
 
proc print
    data=intro.sleep_modified(obs=10);
  var species bodywt totalsleep totalsleep1;
  title1 "The first ten rows and two columns";
  title2 "of the sleep data set";
run;

proc sort
    data=intro.sleep_modified;
  by bodywt;
run;

proc print
    data=intro.sleep_modified(obs=1);
  title1 "The smallest body weight";
run;

proc sort
    data=intro.sleep_modified;
  by descending bodywt;
run;

proc print
    data=intro.sleep_modified(obs=1);
  title1 "The largest body weight";
run;

proc means
    data=intro.sleep_modified;
  var
    bodywt
    brainwt
    nondreaming
    dreaming
    totalsleep
    lifespan
	gestation
	predation
	exposure
	danger;
  title1 "Descriptive statistics for all continuous variables";
run;

proc sgplot
    data=intro.sleep_modified;
  histogram bodywt;
  title1 "Histogram of body weight";
run;

data log_weight;
  set intro.sleep_modified;
  log_w = log10(bodywt);
run;

proc sgplot
    data=log_weight;
  histogram log_w;
  title1 "Histogram of log body weight";
run;

* Divide brainwt by 1000 to convert grans to kilograms,
  then multiply entire ratio by 100 to get percent.
;

data ratio;
  set intro.sleep_modified;
  brain_body_ratio = 100 * (brainwt/1000) / bodywt;
run;

proc sort
    data=ratio;
  by brain_body_ratio;
run;

proc print
    data=ratio(obs=1);
  title1 "Lowest brain to body ratio";
run;

proc sort
    data=ratio;
  by descending brain_body_ratio;
run;

proc print
    data=ratio(obs=1);
  title1 "Highest brain to body ratio";
run;

ods pdf close;
