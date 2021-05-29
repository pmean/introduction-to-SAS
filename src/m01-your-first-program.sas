* getting-started.sas by Steve Simon;
data small_example;
 input x y;
 cards;
1 2
2 4
3 6
;
proc print
    data=small_example(obs=1);
title "First row of data";
run;
