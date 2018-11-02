* lecture12.sas
  written by Steve Simon
  November 02, 2018;

%let xpath=/folders/myfolders;
%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

ods pdf
  file="&path/introduction-to-sas/module12/lecture12.pdf";

filename titanic
  "&path/data/titanic_v00.txt";

libname intro
  "&path/data";

proc import
    datafile="&path/data/titanic_v00.txt"
    out=intro.titanic
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

proc freq
    data=intro.titanic;
  tables Sex*Survived / 
    nocol nopercent relrisk;
run;

proc logistic
    data=intro.titanic;
  class Sex;
  model Survived = Sex;
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

