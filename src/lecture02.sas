* lecture02.sas
  written by Steve Simon
  October 22, 2018;

ods pdf
  file="&path/introduction-to-sas/results/lecture01.pdf";

%let xpath=/folders/myfolders;
%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

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

proc print
    data=intro.titanic(obs=10);
run;

proc freq
    data=intro.titanic;
  tables PClass Sex Survived;
run;

ods pdf close;

