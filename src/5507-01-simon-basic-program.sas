data small_example;
 input x y;
 datalines;
1 2
2 4
3 6
;
proc print
    data=small_example(obs=1);
title "First row of data";
run;
