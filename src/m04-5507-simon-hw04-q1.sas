*************************************************
m04-5507-simon-h204-q1.sas
author: Steve Simon
date created: 2019-10-30
purpose: To use formats
license: public domain
*************************************************;

%let path=q:/introduction-to-sas;

libname perm "&path/data";

filename rawdata "&path/data/gardasil.csv";

ods pdf file="&path/results/m04-5507-simon-hw04-q1.pdf";

proc import
    datafile=raw_data
    out=intro.gardasil
    dbms=dlm
    replace;
  delimiter=',';
  getnames=yes;
run;

proc format;
  value f_agegroup
    0="11-17 years"
    1="18-26 years";
  value f_race
    0="white"
    1="black"
    2="Hispanic"
    3="other/unknown";  
  value f_yesno
    0="no"
    1="yes";
  value f_insurancetype
    0="medical assistance"
    1="private payer"
    2="hospital based"
    3="military";
  value f_location
    1="Odenton"
    2="White Marsh"
    3="Johns Hopkins Outpatient Center"
    4="Bayview";
  value f_locationtype
    0="suburban"
    1="urban";
  value f_practicetype
    0="pediatric"
    1="family practice"
    2="OB-GYN";
run;    

* VARIABLE DESCRIPTIONS:  
Age = the patient's age in years
AgeGroup = the age group in which the patient falls (0 = 11-17 years, 1 = 18-26 years)
Race = the patient's race (0 = white, 1 = black, 2 = Hispanic, 3 = other/unknown)
Shots = the number of shots that the patients completed during a period of 12 months from
the time of the first shot
Completed = did the patient complete the three-shot regimen within the recommended period
of 12 months (0 = no, 1 = yes)
InsuranceType = the type of insurance that the patient had (0 = medical assistance, 1 = 
private payer [Blue Cross Blue Shield, Aetna, Cigna, United, Commercial, CareFirst], 2 = 
hospital based [EHF], 3 = military [USFHP, Tricare, MA])
MedAssist = did the patient have some type of medical assistance (0 = no, 1 = yes)
Location = the clinic that the patient attended (1 = Odenton, 2 = White Marsh, 3 = 
Johns Hopkins Outpatient Center, 4 = Bayview)
LocationType = was the clinic in a suburban or an urban location (0 = suburban, 1 = urban)
PracticeType = the type of practice that the patient visited (0 = pediatric, 1 = family
practice, 2 = OB-GYN);

proc print
    data=intro.gardasil(obs=10);
  format 
    AgeGroup f_agegroup.
    Race f_race.
    Completed f_yesno.
    InsuranceType f_insurancetype.
    MedAssist f_yesno.
    Location f_location.
    LocationType f_locationtype.
    PracticeType f_practicetype.;
  title1 "Q1. Create factors for AgeGroup, Race, Completed, Location.";
  title3 "This listing shows all the factors. Even though you did not ask for this,";
  title4 "I include factors for some of the other variables as well.";
run;

proc means
    n nmiss
    data=intro.gardasil;
  title1 "Q2. Report which variables have missing data and how many of these values are missing.";
  title2 "None of the variables have missing values.";
run;

proc freq
    data=intro.gardasil;
  tables Completed;
  format Completed f_yesno.;
  title1 "Q3. What proportion of patients completed all three shots?";
  title3 "xx% of the patients completed all three shots.";
run:

proc freq
    data=intro.gardasil;
  tables Location / noprint out=location_summary;
run;

proc print
    data=location_summary;
  format Location f_location.;
  title1 "Q4. Draw a bar chart showing the percentage of patients at each of the four locations.";
  title3 "First, I had to create a new data set with percentages.";
run;

proc sgplot
    data=location_summary;
  vbar Location / response=PERCENT;
  format Location f_location.;
  title3 "The bar chart appears below.";
run;

proc freq
    data=intro.gardasil;
  tables 
    Age*AgeGroup 
    Location*LocationType /
      norow nocol nopercent;
  format AgeGroup f_agegroup.;
  format Location f_Location.;
  format LocationType f_locationtype.;
  title1 "Q5. Use a crosstabulation to compare Age to AgeGroup, and Location to LocationType.";
  title2 "Are the recodings into AgeGroup and LocationType done properly?";
  title4 "Here are the crosstabulation. There is indeed something unusual about this data...";
run;

data binary;
  set intro.gardasil;
  if (race=.)
    then binary_race="Blank";
  else if (race=0)
    then binary_race="White";
  else binary_race="Other";
run;

proc freq
    data=binary;
  table race*binary_race / 
    norow nocol nopercent;
  title1 "Q6. Create a new variable that combines the race categories into white, and non-white.";
  title2 "Calculate the proportion of white patients at each of the four locations.";
  title4 "Quick quality check.";
run;

proc freq
    data=binary;
  tables Location;
  where binary_race="White";
  format Location f_location.;
  title4 "This is the percentage of white patients at each location.";
run;

proc freq
    data=binary;
  tables Location*binary_race / nocol nopercent;
  format Location f_location.;
  title4 "Or maybe this is the percentage.";
run;

ods pdf close;
