data test_example;
 input x y;
 cards;
1 2
2 4
3 6
;

proc means data=test_example;
  var x y;
  title "Descriptive statistics";
run;
