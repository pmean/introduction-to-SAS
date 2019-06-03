* lecture12.sas
  written by Steve Simon
  November 02, 2018;

%let path=/folders/myfolders/introduction-to-sas;
%let xpath=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

ods pdf
  file="&path/module12/lecture12.pdf";

filename titanic
  "&path/data02/titanic_v00.txt";

libname intro
  "&path/data02";

proc import
    datafile="&path/data02/titanic_v00.txt"
    out=intro.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

* You can characterize the relationship between 
  two categorical variables when both are 
  binary (only two levels) using an odds
  ratio, a relative risk, or a risk difference.
;

proc freq
    data=intro.titanic;
  tables Sex*Survived / 
    nocol nopercent relrisk;
run;

* Divide the number of deaths by the number of
  survivors to get the odds of death. Among the
  men, it is 709/142 or 4.993, almost 5. Among the
  women, it is 154/308 or 0.5. The ratio of these
  odds is 9.986 or roughly 10. Notice that SAS
  reverses the odds ratio and gives a value of
  0.1 rather than 10. This is something you just
  have to get used to.
;

* The relative risk of death is the ratio of the
  two row percentages, 83.31% / 33.33% or 2.5.
  Again, SAS computes the reciprocal fraction,
  33.33% / 83.31% or 0.4.
;

* Note also that SAS computes the relative "risk"
  of survival, 66.67% / 16.69% or 3.9953. This
  number is not normally reported, but SAS has 
  no way of knowing whether you want the relative
  risk using the ratio of row percentages in the
  first column or the ratio of row percentages
  in the second column.
;

* You use the logistic procedure in SAS to predict
  a binary outcome like survival. In this model,
  the categorical variable Sex is used as an 
  independent variables. SAS requires you to
  declare categorical variables in procedures
  like logistic using a class statement.
;

proc logistic
    data=intro.titanic;
  class Sex;
  model Survived = Sex;
run;

* SAS reports the log odds ratio, -1.156, and
  you exponentiate this value to get the odds
  ratio of 0.1. The confidence limits are
  0.077 to 0.130. If you prefer to report the
  reciprocal odds ratio (10), then the confidence
  limits are 1 / 0.130 = 7.7 and 1 / 0.077 = 13.0.
;

* You can reverse the order of division by 
  changing what SAS defines as an "event."
;

proc logistic
    data=intro.titanic;
  class Sex;
  model Survived(event='1') = Sex;
run;

* You can also reverse the order of division by
  changing the reference level for your
  categorical independent variable.
;

proc logistic
    data=intro.titanic;
  class Sex (ref='female');
  model Survived = Sex;
run;

* You should familiarize yourself with the
  Generalized Linear Model, available in the
  genmod procedure. It can fit a logistic
  regression model just as easily as the
  logistic procedure, but has enough flexibility
  to run other important models like Poisson
  regression.
;

proc genmod
    data=intro.titanic;
  class Sex;
  model Survived = Sex / dist=binomial;
run;


  

proc freq
    data=intro.titanic;
  tables PClass*Survived / 
    nocol nopercent relrisk;
run;

proc logistic
    data=intro.titanic;
  class PClass;
  model Survived = PClass;
run;

data age;
  set intro.titanic;
  age_c = input(age, ?? 8.);
  if age_c < 21
    then child=1;
	else child=0;
run;

proc freq
    data=age;
  tables child*Survived / 
    nocol nopercent relrisk;
run;

proc logistic
    data=age;
  class child;
  model Survived = child;
run;

ods pdf close;

