libname binary 
  "c:\Users\simons\My Documents\SASUniversityEdition\myfolders\introduction-to-sas\part1\data";
ods pdf
  file=
  "c:\Users\simons\My Documents\SASUniversityEdition\myfolders\introduction-to-sas\part1\results\hw_output.pdf";
proc print
    data=binary.sleep(obs=10);
  var species bodywt;
  title1 "First ten observations";
run;
ods pdf close;
