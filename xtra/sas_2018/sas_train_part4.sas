* MEDB 5507 SAS Short Course ;
* sas_train_part4.sas ; 
* Examining relationships between variables ;


options fmtsearch = (gardform) nofmterr ;


* Using your new Gardasil dataset ;

data gard1 ; set sastrain.gardasil2 ;
run ;



* Look at bivariate relationships ;

* Between two categorical variables ;
proc freq data=gard1 ;
 tables race * completed / chisq ;
 run ;

proc freq data=gard1 ;
 tables new_race * completed / chisq ;
 run ;


* Plot relationship between 2 categorical variables ;
proc freq data=gard1 ;
 tables new_race * completed / plots = freqplot (twoway=grouphorizontal) ;
 run ;
 
proc freq data=gard1 ;
 tables new_race * completed / plots = freqplot (twoway=groupvertical) ;
 run ;
 
proc freq data=gard1 ;
 tables new_race * completed / plots = freqplot (twoway=stacked) ;
 run ;
 

* Repeat this with variables listed in reverse order ;
proc freq data=gard1 ;
 tables completed * new_race / plots = freqplot (twoway=grouphorizontal) ;
 run ;
 
proc freq data=gard1 ;
 tables completed * new_race / plots = freqplot (twoway=groupvertical) ;
 run ;
 
proc freq data=gard1 ;
 tables completed * new_race / plots = freqplot (twoway=stacked) ;
 title1 'frequency plot of categorical variables' ;
 run ;
 
proc freq data=gard1 ;
 tables completed * new_race / chisq ;
 tables completed * new_race / plots = freqplot (twoway=stacked) ;
 title1 'frequency plot of categorical variables' ;
 run ;
 


* Comparing 2 continuous variables ;
* Use South Africa Project Outcomes dataset ;

data sa1 ; set sastrain.saproj_outcomes ;
run ;


* Getting a statistical measure of the relationship between two variables ;
proc corr data=sa1 pearson spearman kendall hoeffding ;
 var cd4t4abs hivviralload ;
 run ;


* Plot the relationship between two continuous variables ;
ods graphics on ;
proc corr data=sa1 plots = (scatter matrix) ;
 var cd4t4abs hivviralload ;
 run ;


* Comparing values of a continuous variable between independent groups ;
* Doing this one variable at a time ;
proc ttest data=sa1 ;
 class treatment_gp ;
 var baseline_depression ;
 title1 ' ' ;
 run ;


* Creating statistical graphics with proc ttest ;
proc ttest data=sa1 plots (only) = (all) ;
 class treatment_gp ;
 var baseline_depression ;
 run ;


* Comparing values of a continuous variable collected at two time points ;
proc ttest data=sa1 ;
 paired baseline_depression * wk24_depression ;
 run ;


* Creating statistical graphics with proc ttest ;
proc ttest data=sa1 plots (only) = (agreementplot profilesplot) ;
 paired baseline_depression * wk24_depression ;
 run ;





* Alternative way to check distribution of variables - continuous measures ;
proc univariate data=sa1 ;
 var cd4t4abs hivviralload ;
 run ;


* Creating statistical graphics with proc univariate ;
 proc univariate data=sa1 ;
  var cd4t4abs hivviralload ;
  histogram cd4t4abs hivviralload ;
  probplot  cd4t4abs hivviralload ;
 run ;


