*************************************************
5507-04-simon-hw-q1.sas
author: Steve Simon
date created: 2019-10-30
purpose: To answer homework questions for module04
license: public domain
*************************************************;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename raw_data "&path/data/gardasil.csv";

ods pdf file="&path/results/5507-04-simon-hw-q1.pdf";

proc import
    datafile=raw_data
    out=perm.gardasil
    dbms=dlm
    replace;
  delimiter=',';
  getnames=yes;
run;

*************************************************
I did not ask for variable labels, but if you
wanted to add them, you have to do it in a
data step.
*************************************************;
data perm.gardasil;
  set perm.gardasil;
  label
    Age = "The patient's age in years"
    AgeGroup = "The age group in which the patient falls"
    Race = "The patient's race"
    Shots = "The number of shots that the patients completed"
    Completed = "Did the patient complete the three-shot regimen"
    InsuranceType = "The type of insurance that the patient had"
    MedAssist = "Did the patient have some type of medical assistance"
    Location = "The clinic that the patient attended"
    LocationType = "Was the clinic in a suburban or an urban location"
    PracticeType = "The type of practice that the patient visited";
run;


proc format;
  value f_agegroup
    0="11-17 years"
    1="18-26 years";
  value f_race
    0="White"
    1="Black"
    2="Hispanic"
    3="Other/unknown";  
  value f_yesno
    0="No"
    1="Yes";
  value f_location
    1="Odenton"
    2="White Marsh"
    3="Johns Hopkins Outpatient Center"
    4="Bayview";
run;    

*************************************************
Q1. Display frequency counts for AgeGroup, Race,
Completed, Location. Be sure to use proc format
to display your frequencies using short text
descriptors rather than number codes. Which 
category occurs mostfrequently for each variable?
*************************************************;
proc freq
    data=perm.gardasil;
  tables AgeGroup Race Completed Location;
  format 
    AgeGroup f_agegroup.
    Race f_race.
    Completed f_yesno.
    Location f_location.;
  title1 "The 18-26 years category appears most frequently for AgeGroup";
  title2 "The White category appears most frequently for Race";
  title3 "The No category appears most frequently for Completed";
  title4 "The Odenton category appears most frequently for Location";
run;

ods pdf close;
