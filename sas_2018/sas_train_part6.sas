* MEDB 5507 SAS Short Course ;
* sas_train_part6.sas ;
* Restructure your dataset from horizontal to vertical and vice versa ;


options fmtsearch = (formats) nofmterr ;

* Using your recently saved Adherence Project Beliefs dataset that includes scores ;
* Keep only variables that we need for restructuring ;

data beliefs1 ; set sastrain.beliefs2 ;
 keep subject evalnum necess1 concern1 ;
run ;

* Data on this scale were only collected during evaluations 1, 24, and 48 ;
* Keep observations for those evaluations only ;

data beliefs2 ; set beliefs1 ;
 if evalnum in(1, 24, 48) ;
 run ;

proc freq data=beliefs2 ;
 tables evalnum ;
 run ;


* Sort working dataset by identifier variables ;
proc sort data=beliefs2 ;
 by subject evalnum ;
run ;

* Restructure the dataset so that 3 sets of scores are in 1 record ;
proc transpose data=beliefs2 out=flip_nec ;
 by subject ;
 id evalnum ;
 var necess1 ;
 run ;

* Rename new variables so that this file can be merged with concern dataset ;
data flip_nec2 ; set flip_nec ;
 rename _1 = necess_1 ;
 rename _24 = necess_24 ;
 rename _48 = necess_48 ;
 run ;

* Do the same thing for the concern scores ;
* Restructure the dataset so that 3 sets of scores are in 1 record ;
proc transpose data=beliefs2 out=flip_con ;
 by subject ;
 id evalnum ;
 var concern1 ;
 run ;

* Rename new variables so that this file can be merged with concern dataset ;
data flip_con2 ; set flip_con ;
 rename _1 = concern_1 ;
 rename _24 = concern_24 ;
 rename _48 = concern_48 ;
 run ;

* Sort these 2 files together using subject value so you can then merge them ;
proc sort data=flip_nec2 ;
 by subject ;
 run ;

proc sort data=flip_con2 ;
 by subject ;
 run ;

* Merge together these 2 sorted files ;
data comb1 ; merge flip_nec2 flip_con2 ;
 by subject ;
 run ;

* Check the file and make it looks right ;

proc contents position data=flip_con2 ;
run ;

data comb2 ; set comb1 ;
 drop _name_ ;
 run ;


* Create a transposed file going the other direction ;
* Create multiple records out of a single record that has data from multiple time points ;

* Use the South Africa Project Outcomes dataset ;
* This dataset has depression score collected at both baseline and week 24 ;

data depr1 ; set sastrain.saproj_outcomes ;
run ;

* Create a working dataset that has only the variables we will work with ;

data depr2 ; set depr1 ;
 keep studyno baseline_depression wk24_depression ;
 run ;

* To be on the safe side sort by your identifying variable first ;
proc sort data=depr2 ;
 by studyno ;
 run ;

* Transpose the data into the vertical formatted file ;
proc transpose data=depr2 out=depr3 ;
 by studyno ;
 var baseline_depression wk24_depression ;
 run ;

proc contents position data=depr2 ;
run ;

proc contents position data=depr3 ;
run ;


* Create evaluation number variable that is easier to work with ;
data depr4 ; set depr3 ;
 if _name_ = "Baseline_Depression" then evalnum = 1 ;
 if _name_ = "WK24_Depression" then evalnum = 24 ;
 depress_score = col1 ;
 run ;

* Clean-up file to keep only the variables you'll use ;
data depr5 ; set depr4 ;
 keep studyno evalnum depress_score ;
 run ;
