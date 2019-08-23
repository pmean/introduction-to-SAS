* MEDB 5507 SAS Short Course ;
* sas_train_part1.sas ;
* Setting up SAS library / Importing data / Saving SAS dataset ;


* Set up SAS library using tool ;


* Command language to set up a SAS library ;
libname "libname" 'path to computer location where files are to be stored' ;
run ;
* example - SAS library on a desktop computer device ;
libname testlib2 'c:\My Documents\MEDB 5507_Intro to SAS\SAS files' ;
run ;
* example - SAS library on a USB device ;
libname sastrain 'f:\MEDB 5507_Intro to SAS\SAS files' ;
run ;


* GETTING DATA INTO SAS USING THE IMPORT METHOD ;
* IMPORT .xlsx data file - 32-bit version of SAS only - xlsx1 ;

* IMPORT csv data file - csv1 ;

* IMPORT tab-delimited data file - tab1 ;

* IMPORT space-delimited data file - space1 ;

* IMPORT fixed column data file - fix1 ;

* Note - other stats program files can be imported - ex. SPSS & Stata ;



* View working data files as they are imported to check process ;



* READ-IN csv data file - THIS WORKS ;
data csv2 ; 
  infile 'c:\My Documents\MEDB 5507_Intro to SAS\Datasets\SAS course\ImportDataFile.csv' 
   dlm = "," MISSOVER DSD lrecl=32767 firstobs=2 ;
   informat name $3. ;
   informat title $8. ;
   informat level best32. ;
   informat years best32. ;
   informat dob mmddyy10. ;
   informat hire_date mmddyy10. ;
   informat number_courses best32. ;
   informat ext_res_fund best32. ;
   informat number_services best32. ;
   format name $3. ;
   format title $8. ;
   format level best32. ;
   format years best32. ;
   format dob mmddyy10. ;
   format hire_date mmddyy10. ;
   format number_courses best32. ;
   format ext_res_fund best32. ;
   format number_services best32. ;
  input name $ title $ level years dob hire_date number_courses ext_res_fund number_services ;
  run ;


* Open up work.csv2 and look at it - does it look right? ;


* READ-IN fixed-column data file - desktop version - THIS WORKED ;
data pulm ; 
	infile 'c:\my documents\MEDB 5507_Intro to SAS\Datasets\SAS course\pulmonary_data.txt' ;
	input age 1-3 fev 5-10 ht 12-15 sex 19 smoke 25 ;
	run ;



* Run FREQUENCY to check data that were imported - does it look right? ;
* Categorical variables ;
proc freq data=csv1 ;
 tables title level number_courses ext_res_fund number_services ;
 run ;

* Continuous variables ;
proc means data=csv1 n mean stddev min max ;
 var years number_courses number_services ;
 run ;

* Alternative way to check distribution of variables - continuous measures ;
proc univariate data=csv1 normal ;
 var years number_courses number_services ;
 run ;






* Check Output and Check Results Viewer ;



* Save SAS dataset ;
data sastrain.csv1 ; set work.csv1 ;
run ;



* Document your SAS datasets ;
proc contents position data=sastrain.csv1 ;
run ;


* How to open this SAS dataset when you next want to work with it ;
data work.file1 ; set sastrain.csv1 ;
run ;


* On your own - work with Gardasil data set ;
* Import .xls file ;
* Check the data  ;
* Save SAS dataset for later use ;
* Document the SAS dataset you just saved ;

* Import other datasets as noted in the Course Outline document ;
