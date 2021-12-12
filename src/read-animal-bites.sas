* read-animal-bites.sas
* author: Steve Simon
* creation date: 2019-12-08
* purpose: to read a tricky text file
* license: public domain;


%let path=q:/introduction-to-sas;

ods pdf file=
    "&path/results/read-animal-bites.pdf";

libname perm
    "&path/data";

filename raw_data
    "&path/data/Health_AnimalBites.csv";


proc import
    datafile=raw_data dbms=dlm
    out=perm.animal_bites replace;
  delimiter=",";
  getnames=yes;
  guessingrows=MAX;
run;

proc print
    data=perm.animal_bites(obs=2);
  title1 "First two rows of data";
run;

proc freq
    data=perm.animal_bites;
  tables 
    SpeciesIDDesc
    BreedIDDesc
    GenderIDDesc
    color
    vaccination_yrs
    victim_zip
    AdvIssuedYNDesc
    WhereBittenIDDesc
    DispositionIDDesc
    ResultsIDDesc / missprint;
  title1 "Frequency counts";
run;

proc means
    n nmiss
	data=perm.animal_bites;
  var
    bite_date
    vaccination_date
    quarantine_date
    head_sent_date ;
  title1 "Counts for date variables";

filename mod_data
  "&path/data/Modified-Animal-Bites.csv";

data PERM.ANIMAL_BITES;
  infile mod_data delimiter = ',' firstobs=2;
  informat bite_date $10.;
  informat SpeciesIDDesc $7.;
  informat BreedIDDesc $17.;
  informat GenderIDDesc $7.;
  informat color $12.;
  informat vaccination_yrs $8.;
  informat vaccination_date $10.;
  informat victim_zip $10.;
  informat AdvIssuedYNDesc $3.;
  informat WhereBittenIDDesc $7.;
  informat quarantine_date $10.;
  informat DispositionIDDesc $8.;
  informat head_sent_date $10.;
  informat release_date $10.;
  informat ResultsIDDesc $8.;
  input
    bite_date $
    SpeciesIDDesc $
    BreedIDDesc $
    GenderIDDesc $
    color $
    vaccination_yrs $
    vaccination_date $
    victim_zip $
    AdvIssuedYNDesc $
    WhereBittenIDDesc $
    quarantine_date
    DispositionIDDesc $
    head_sent_date $
    release_date $
    ResultsIDDesc $
  ;
run;

proc print
    data=perm.animal_bites(obs=2);
  title1 "First two rows of data";
run;

proc freq
    data=perm.animal_bites;
  tables 
    SpeciesIDDesc
    BreedIDDesc
    GenderIDDesc
    color
    vaccination_yrs
    victim_zip
    AdvIssuedYNDesc
    WhereBittenIDDesc
    DispositionIDDesc
    ResultsIDDesc / missprint;
  title1 "Frequency counts";
run;

proc means
    n nmiss
	data=perm.animal_bites;
  var
    bite_date
    vaccination_date
    quarantine_date
    head_sent_date ;
  title1 "Counts for date variables";
run;

ods pdf close;
