libname binary 
  "c:\Users\simons\My Documents\SASUniversityEdition\myfolders\introduction-to-sas\part1\data";
ods pdf
  file=
  "c:\Users\simons\My Documents\SASUniversityEdition\myfolders\introduction-to-sas\part1\results\hw_output.pdf";

proc contents
    order=varnum
	data=binary.sleep;
  title1 "Metadata for binary.sleep";
run;

data xfer;
  set binary.sleep;
  nondreaming1=nondreaming+0;
  dreaming1=dreaming+0;
  totalsleep=totalsleep+0;
  lifespan1=lifespan+0;
  gestation1=gestation+0;
  drop nondreaming--gestation;
run;

data xfer;
  set xfer(
    rename=(
	  nondreaming1=nondreaming
	  dreaming1=dreaming
	  totalsleep1=totalsleep
	  lifespan1=lifespan
	  gestation1=gestation
    )
  );
  drop nondreaming1--gestation1;
run;

proc contents
    varnum
	data=xfer;
run;
  


proc print
    data=binary.sleep(obs=10);
  var species bodywt;
  title1 "First ten observations";
run;
proc sort
    data=binary.sleep;
  by bodywt;
run;

proc print
    data=binary.sleep(obs=1);
  title1 "The smallest body weight";
run;

proc sort
    data=binary.sleep;
  by descending bodywt;
run;

proc print
    data=binary.sleep(obs=1);
  title1 "The largest body weight";
run;

proc means
    data=binary.sleep;
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
    data=binary.sleep;
  histogram bodywt;
  title1 "Histogram of body weight";
run;

data log_weight;
  set binary.sleep;
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
  set binary.sleep;
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
