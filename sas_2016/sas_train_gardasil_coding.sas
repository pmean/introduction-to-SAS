* MEDB 5507 SAS Short Course ;
* sas_train_gardasil_coding.sas ;


* Creating format information using Gardasil dataset ;
* Create SAS format library - gardform - using library tool ;

* Creat format information to be stored in library ;
proc format library = gardform ; 

* Value statements ;
value agecateg 
 0 = '11-17 yrs' 
 1 = '18-26 yrs' ;
value racecateg
 0 = 'White'
 1 = 'Black'
 2 = 'Hispanic'
 3 = 'other/unknown' ;
value newracecateg
 0 = 'White'
 1 = 'Black'
 2 = 'other incl Hispanic & unknown' ;
value noyes
 0 = 'no'
 1 = 'yes' ;
value insurcateg
 0 = 'medical assistance'
 1 = 'private payer' 
 2 = 'hospital based' 
 3 = 'military' ;
value locatcateg 
 1 = 'Odenton'
 2 = 'White Marsh' 
 3 = 'Johns Hopkins Outpatient Center'
 4 = 'Bayview' ;
value locatypecateg
 0 = 'suburban'
 1 = 'urban' ;
value practcateg
 0 = 'pediatric' 
 1 = 'family practice'
 2 = 'ob-gyn' ;
run ;



options fmtsearch = (gardform) nofmterr ;


* Open your gardasil SAS dataset ;
data work.gard1 ; set sastrain.gardasil ;
run ;


* Add information to file - variable labels & format codes ;
data gard2 ; set gard1 ;
 label age = 'Patient age in years' ;

 label agegroup = 'Age Group - 0 = 11-17 yrs, 1 = 18-26 yrs' ;
 format agegroup agecateg. ;

 label race = 'Patient race' ;
 format race racecateg. ;

 label shots = 'Number of shots completed within 12 months of first' ;

 label completed = 'Was 3-shot regimen completd within recommended time?' ;
 format completed noyes. ;

 label insurancetype = 'Type of insurance' ;
 format insurancetype insurcateg. ;

 label medassist = 'Did the patient have any type of medical assistance?' ;
 format medassist noyes. ;

 label location = 'Clinic location attended' ;
 format location locatcateg. ;

 label locationtype = 'Type of clinic location' ;
 format locationtype locatypecateg. ;

 label practicetype = 'Type of practice visited' ;
 format practicetype practcateg. ;


 if race = 0 then new_race = 0 ;
 if race = 1 then new_race = 1 ;
 if race in (2 3) then new_race = 2 ;
 label new_race = 'New Race-Ethnicity variable - white / black / other' ;
 format new_race newracecateg. ;


 if insurancetype = 1 then private_ins = 1 ;
 else private_ins = 0 ;
 label private_ins = 'Does patient have private insurance?' ;
 format private_ins noyes. ;
 run ;


* When you're ready to save a new SAS dataset, the labels and format information will be saved ;
data sastrain.gardasil2 ; set gard2 ;
run ;


proc contents position data=sastrain.gardasil2 ;
run ;


