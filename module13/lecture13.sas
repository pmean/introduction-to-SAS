* lecture13.sas
  written by Steve Simon
  December 2, 2018;

%let path=/folders/myfolders/introduction-to-sas;
%let xpath=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

ods pdf
  file="&path/module13/lecture13.pdf";

libname intro
  "&path/data03";

* Let's take a closer look at the fev data set.
;

proc format;
  value fsex
    0 = "Female"
    1 = "Male"
  ;
  value fsmoke
    0 = "Nonsmoker"
    1 = "Smoker"
  ;
run;

proc print
    data=intro.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title1 "Pulmonary function study";
  title2 "Partial listing of fev data";
run;

* When you are using a categorical predictor for
  a continuous outcome, you can use analysis of
  variance (ANOVA).
;

proc glm
    data=intro.fev;
  class smoke;
  model fev = smoke;
  title2 "ANOVA";
run;

* When you are using a continuous predictor for
  a categorical outcome, you can use logistic
  regression.
;

proc genmod
    data=intro.fev;
  model smoke = age / dist=binomial;
  title2 "Logistic regression";
run;

proc glm
    data=intro.fev;
  class smoke;
  model fev=age smoke;
  title2 "ANCOVA";
run;

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
  
  1. 
;

ods pdf close;

