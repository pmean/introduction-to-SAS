* saved-html.sas 
written by Steve Simon;

libname perm "q:/Documents/results";

ods html body="saved-web.html";

data perm.simple_example;
  input x y;
cards;
1 2
2 4
3 6
run;
proc print
    data=perm.simple_example(obs=1);
  title1 "First row";
run;

ods html close;
