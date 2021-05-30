* MEDB 5507 SAS Short Course ;
* sas_train_part2.sas ;
* Additional manipulation of dataset ;
* Creating format information ;
* Creating label information ;
* Creating new variables etc ;
* Coding for missing data ;
* Creating numeric variables from character data ;
* Renaming variables ;
* Working with date information ;



* Creating format information using Gardasil dataset ;
* Create SAS format library - gardform - using library tool ;

* Create format information to be stored in library ;
proc format library = gardform ; 

* Value statements ;
value agecateg 
 0 = '11-17 yrs' 
 1 = '18-26 yrs' ;
run ;


* Check to see what format library looks like and the information that is in the format library ;


* Command to tell SAS where to find format information ;
* Includes code to prevent error message if there is no format information stored ;
* Include this options statement in all programs in the future ;

options fmtsearch = (gardform) nofmterr ;


* Open your gardasil SAS dataset ;
data work.gard1 ; set sastrain.gardasil ;
run ;

* Check agegroup variable ;
proc freq data=gard1 ;
 tables agegroup ;
 run ;


* Add information to file - variable labels & format codes ;
data gard2 ; set gard1 ;
 label agegroup = 'Age Group - 0 = 11-17 yrs, 1 = 18-26 yrs' ;
 format agegroup agecateg. ;
 run ;


* Check how your frequency output looks with the label and format information added ;
proc freq data=gard2 ;
 tables agegroup ;
run ;


proc freq data=gard2 ;
 tables race--practicetype ;
 run ;


* Examining your frequency output to look for questions ;
* Example - relationship between SHOTS and COMPLETED ;
proc freq data=gard2 ;
 tables shots * completed ;
 run; 

* Check documentation for explanation of these data ;

* Create new race-ethnicity variable to represent 3 categories ;
data gard3 ; set gard2 ;
 if race = 0 then new_race = 0 ;
 if race = 1 then new_race = 1 ;
 if race in (2 3) then new_race = 2 ;
 label new_race = 'New Race-Ethnicity variable - white / black / other' ;
 run ;

* Check coding - 2dim table - rows X columns ;
proc freq data=gard3 ;
 tables race * new_race ;
 run ;

* Create new insurance variable to represent private vs not private ; 
data gard4 ; set gard3 ;
 if insurancetype = 1 then private_ins = 1 ;
  else private_ins = 0 ;
 if insurancetype = . then private_ins = . ; 
run ;


* Check coding - 2dim table - rows X columns ;
proc freq data=gard4 ;
 tables insurancetype * private_ins ;
 run ;


* When you're ready to save a new SAS dataset, the labels and format information will be saved ;
data sastrain.gardasil2 ; set gard4 ;
run ;

* Check this out when you open the new version of the Gardasil dataset ;



* Code missing data ;
* Use Back Pain dataset ;

data back1 ; set sastrain.back_pain ;
run ;

data back2 ; set work.back1 ;
 weekdist_rec = weekdist ;
 if weekdist = 0 then weekdist_rec = . ;
 label weekdist_rec = 'weekdist variable with 0 coded as md' ;
 run ;

* Check coding ;
proc freq data=back2 ;
 tables weekdist weekdist_rec ;
 run ;

* A way of checking that coding was done correctly ;
data back3 ; set back2 ;
 if weekdist = 0 then zero_flag = 1 ;
  else zero_flag = 0 ;
 if weekdist_rec = . then md_flag = 1 ;
  else md_flag = 0 ;
  label zero_flag = 'Flag variable indicating record has zero value for weekdist' ;
  label md_flag = 'Flag variable indicating record has md value for weekdist' ;
run ;

proc freq data=back3 ;
 tables zero_flag * md_flag ;
 run ;


data back4 ; set back3 ;
 event_flag = "race" ;
 if event = "None" then event_flag = " " ;
 run ;


proc freq data=back4 ;
 tables event ;
 run ;



* Renaming variables ;
* rename old_variable = new_variable ;

* Example - using Back Pain dataset ;
data back4 ; set back3 ;
 rename event = distance ;
 run ;

proc freq data=back3 ;
 tables event ;
 run ;

proc freq data=back4 ;
 tables distance ;
 run ;



* Use the Sleep in Mammals dataset ;
* Code for missing data and create numeric variable from character variable ;

data sleep1 ; set sastrain.sleep1 ;
run ;


* Code character variable NA as missing data ;
data sleep2 ; set sleep1 ;
 nondreaming_rec = nondreaming ;
 if nondreaming_rec = "NA" then nondreaming_rec = " " ;
 label nondreaming_rec = 'New variable for nondreaming to code NA as missing' ;
 run ;

* Code character variable NA as missing data ;
data sleep3 ; set sleep2 ;
 nondreaming_rec2 = nondreaming ;
 if nondreaming_rec2 = "NA" then nondreaming_rec2 = . ;
 label nondreaming_rec2 = 'Alt - New variable for nondreaming to code NA as missing' ;
 run ;



* Create numeric variable from character variable ;
data sleep3 ; set sleep2 ;
 nondreaming_num = nondreaming + 0 ;
 label nondreaming_num = 'Numeric nondreaming variable that includes missing data coding' ;
 run ;

* Create numeric variable from character variable - alternate method ;
data sleep4 ; set sleep3 ;
 nondreaming_num2 = input(nondreaming,best4.1);
 label nondreaming_num2 = 'Alt - Numeric nondreaming variable that includes missing data coding' ;
 run ;



* Create new numeric variable from character variable for use in analysis ;
* Using Diet / Fiber dataset ;

data diet1 ; set sastrain.diet ;
run ;

data diet2 ; set diet1 ;
 if bloat = 'none' then bloat_num = 0 ;
 if bloat = 'low' then bloat_num = 1 ;
 if bloat = 'med' then bloat_num = 2 ;
 if bloat = 'high' then bloat_num = 3 ;
run ;



* Working with DATE data using original importing dataset ;

data import1 ; set sastrain.import ;
run ;

* Compute age when hired ;
data import2 ; set import1 ;
 age_hire = int(yrdif(dob, hire_date, 'age')) ;
 age_hire2 = (yrdif(dob, hire_date, 'age')) ;
 run ;


* Compute current age ;
data import3 ; set import2 ;
 current_age = (today() - dob) / 365.25 ;
 current_age_yrs = int(current_age) ;
 run ;


* Create flag variable based on a specific date ;
data import4 ; set import3 ;
 if hire_date > '01jul2010'd then new_hire = 1 ;
  else new_hire = 0 ;
  run ;

* alt - Create flag variable based on a specific date ;
data import4 ; set import3 ;
 if hire_date gt '01jul2010'd then new_hire = 1 ;
  else new_hire = 0 ;
  run ;


* Operation coding ;
* > gt ;
* >= ge ;
* < lt ;
* <= le ;



