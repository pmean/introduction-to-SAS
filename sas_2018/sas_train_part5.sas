* MEDB 5507 SAS Short Course ;
* sas_train_part5.sas ;
* Code subscale scores ;
* Compute mean scores ;
* Use do loops to code ;


options fmtsearch = (gardform) nofmterr ;


* Using your MOTIV8 Adherence Project Beliefs About ART dataset ;

data beliefs1 ; set sastrain.beliefs ;
run ;

* Compute subscale scores using one method ; 
data beliefs2 ; set beliefs1 ;
 necess1 = baa1 + baa3 + baa4 + baa7 + baa10 ;
 concern1 = baa2 + baa5 + baa6 + baa8 + baa9 ;
 run ;

* Compute subscale scores using another method ;
data beliefs3 ; set beliefs2 ;
 necess2 = sum(baa1, baa3, baa4, baa7, baa10) ;
 concern2 = sum(baa2, baa5, baa6, baa8, baa9) ;
 run ;

* Check - did you get the same answer using both methods? ;
proc corr data=beliefs3 ;
 var necess1 necess2 ;
 var concern1 concern2 ;
 run ;

* Alternate Check - did you get the same answer using both methods? ;
proc corr data=beliefs3 ;
 var necess1--concern2 ;
 run ;


* What happens if you have missing data on one of the variables? ;
data beliefs4 ; set beliefs3 ;
 if subject = 1001 then baa1 = . ;
 run ;

data beliefs5 ; set beliefs4 ;
 necess3 = baa1 + baa3 + baa4 + baa7 + baa10 ;
 necess4 = sum(baa1, baa3, baa4, baa7, baa10) ;
 concern3 = baa2 + baa5 + baa6 + baa8 + baa9 ;
 concern4 = sum(baa2, baa5, baa6, baa8, baa9) ;
run ;

* Check - did you get the same answer using both methods? ;
proc means data=beliefs5 n mean stddev min max ;
 var necess1 necess2 necess3 necess4 ;
 run ;

proc corr data=beliefs5 ;
 var necess1 necess2 necess3 necess4 ;
 run ;

* For rest of work use previous dataset - before entry changed to missing data ;


 * Compute mean scores ;
 data beliefs4 ; set beliefs3 ;
  necess_mean = mean(baa1, baa3, baa4, baa7, baa10) ;
  concern_mean = mean(baa2, baa5, baa6, baa8, baa9) ;
  run ;

* Compute mean scores ;
 data beliefs4x ; set beliefs5 ;
  necess_mean = mean(baa1, baa3, baa4, baa7, baa10) ;
  concern_mean = mean(baa2, baa5, baa6, baa8, baa9) ;
  run ;

* Save new SAS dataset with the computed subscores ;
data sastrain.beliefs2 ; set work.beliefs4 ;
run ;

proc contents position data=sastrain.beliefs2 ;
run ;


* Using your MOTIV8 Adherence Project Depressive Symptoms dataset ;

data depress1 ; set sastrain.depression ;
run ;

* Use a do loop to reverse code the 4 items - 4, 8, 12, & 16 ;

data depress2 ; set depress1 ;
 array items {4} ds4 ds8 ds12 ds16 ;
 array items_rev {4} ds4_rev ds8_rev ds12_rev ds16_rev ;
  do i = 1 to 4 ;
   items_rev{i} = 3 - items{i} ;
   end ;
run ;

* Checking coding ;

proc freq data=depress2 ;
 tables ds4 * ds4_rev ;
 tables ds8 * ds8_rev ;
 tables ds12 * ds12_rev ;
 tables ds16 * ds16_rev ;
 run ;


* Optional method for reverse coding ;
data depress3 ; set depress2 ;
 if ds4 = 0 then ds4_alt = 3 ;
 if ds4 = 1 then ds4_alt = 2 ;
 if ds4 = 2 then ds4_alt = 1 ;
 if ds4 = 3 then ds4_alt = 0 ;
 run ;

* Check this alternative coding method ;
proc freq data=depress3 ;
 tables ds4 * ds4_alt ;
 tables ds4_rev * ds4_alt ;
 run ;


* Create total score for depressive symptoms ;
data depress4 ; set depress3 ;
 drop i ;
 ds_total = ds1 + ds2 + ds3 + ds4_rev + ds5 + ds6 + ds7 + ds8_rev + ds9 + ds10 + ds11 + ds12_rev + ds13 + ds14 + 
            ds15 + ds16_rev + ds17 + ds18 + ds19 + ds20 ;
 run ;

* Create total score for depressive symptoms - alternate method ;
data depress5 ; set depress4 ;
 ds_total2 = sum(ds1, ds2, ds3, ds4_rev, ds5, ds6, ds7, ds8_rev, ds9, ds10, ds11, ds12_rev, ds13, ds14, 
            ds15, ds16_rev, ds17, ds18, ds19, ds20) ;
 run ;


data depress5x ; set depress5 ;
 if ds_total = 0 ; 
 run ;

* Create dichotomous high group variable ;
data depress6 ; set depress5 ;
 if ds_total ge 16 then ds_high = 1 ;
 if ds_total lt 16 then ds_high = 0 ;
 if ds_total = . then ds_high = . ;
 label ds_high = 'Depressive Symptoms High Group designation' ;
 run ;


* Check coding of high group ;
proc freq data=depress6 ; 
 tables ds_total * ds_high ;
 run ;


* Save new SAS dataset for depressive symptoms data ;
data sastrain.depression2 ; set work.depress6 ;
run ;

proc contents position data=sastrain.depression2 ;
run ;




