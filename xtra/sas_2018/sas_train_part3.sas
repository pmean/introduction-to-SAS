* MEDB 5507 SAS Short Course ;
* sas_train_part3.sas ;
* Additional manipulation of dataset ;
* Selecting subset of variables ;
* Selecting subset of cases ;
* Combining / concatenating datasets together ;
* Merging datasets together ;


options fmtsearch = (gardform) nofmterr ;


* Using your new Gardasil dataset ;

data gard1 ; set sastrain.gardasil2 ;
run ;



* Creating subsets of your original dataset - variables - 1st method ;
data gard_shortvar1 ; set gard1 ;
 keep agegroup new_race completed private_ins locationtype practicetype ;
 run ;

* Creating subsets of your original dataset - variables - 2nd method ;
data gard_shortvar2 ; set gard1 ;
 drop age race shots insurancetype medassist location ;
 run ;

* These 2 datasets should be equivalent ;
* Do you know how you could verify this ;


* Alt - Creating subsets of your original dataset - variables - 1st method ;
data gard_shortvar1x ; set gard1 ;
 keep agegroup completed locationtype--private_ins ;
 run ;

* check expected number of observations ;
proc freq data=gard1 ;
 tables agegroup ;
 run ;


* Creating a subset of your original dataset - observations - 1st method ;
data gard_young1 ; set gard1 ;
 if agegroup = 0 ;
 run ;

data gard_old1 ; set gard1 ;
 if agegroup = 1 ;
 run ;


* Creating subsets of your original dataset - observations - 2nd method ;
data gard_young2 ; set gard1 ;
 if agegroup = 1 then delete ;
 run ;

data gard_old2 ; set gard1 ;
 if agegroup = 0 then delete ;
 run ;

* The young1 and young2 datasets should be equivalent ;
* The old1 and old2 datasets should be equivalent ;


* Combining files ;
* Adding a 2 separate sets of observations together ;

data new_gard1 ; set gard_young1 gard_old1 ;
run ;

* This new file - new_gard1 - should be equivalent to the Gardasil dataset you started out with ;



* Combining files ;
* Adding variables to an existing dataset ;

* Open the two South Africa Project datasets ;
data out1 ; set sastrain.saproj_outcomes ;
run ;

data pss1 ; set sastrain.saproj_pss ;
run ;


* In order to combine / merge variables from two datasets you have to sort each dataset ;
proc sort data=out1 ;
 by studyno ;
 run ;

proc sort data=pss1 ;
 by studyno ;
 run ;


* When you do the merging you have to tell SAS what variable to use to combine the records ;
data comb1 ; merge out1 pss1 ;
 by studyno ;
 run ;

* Check LOG - does the # of observations and # of variables make sense? ;


* Create new SAS dataset that contains all the data from the South Africa project ;
 data sastrain.saproj_comb ; set work.comb1 ;
 run ;

 proc contents position data=sastrain.saproj_comb ;
 run ;



* Note - if you are going to use the Sleep in Mammals dataset further, you will want to delete the blank record - #59 - if you have it ;
* If you do this, document the steps you took ;
