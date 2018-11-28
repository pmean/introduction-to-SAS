* hw01.sas
  written by Steve Simon
  September 17, 2018;

%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;
%let xpath=/folders/myfolders/introduction-to-sas;

ods pdf
  file="&path/module01/hw01.pdf";

filename sleep
  "&path/data01/sleep.txt";

libname intro
  "&path/data01";

data intro.sleep;
  infile sleep delimiter='09'X firstobs=2;
  informat species $24.;
  input 
    species
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
  nondreaming1 = input(nondreaming, ?? 8.);
  dreaming1 = input(dreaming, ?? 8.);
  totalsleep1 = input(totalsleep, ?? 8.);
  lifespan1 = input(lifespan, ?? 8.);
  gestation1 = input(gestation, ?? 8.);
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
    data=intro.sleep(obs=10);
  var species bodywt totalsleep totalsleep1;
  title1 "The first ten rows and two columns";
  title2 "of the sleep data set";
run;

proc sort
    data=intro.sleep;
  by bodywt;
run;

proc print
    data=intro.sleep(obs=1);
  title1 "The smallest body weight";
run;

proc sort
    data=intro.sleep;
  by descending bodywt;
run;

proc print
    data=intro.sleep(obs=1);
  title1 "The largest body weight";
run;

proc means
    data=intro.sleep;
  var
    bodywt
    brainwt
    nondreaming1
    dreaming1
    totalsleep1
    lifespan1
	gestation1
	predation
	exposure
	danger;
  title1 "Descriptive statistics for all continuous variables";
run;

proc sgplot
    data=intro.sleep;
  histogram bodywt;
  title1 "Histogram of body weight";
run;

data log_weight;
  set intro.sleep;
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
  set intro.sleep;
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
