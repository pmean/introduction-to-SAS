* 5507-02-wheeler-continious-variables.sas
  author: Steve Simon and Leroy Wheeler
  date: created 2024-09-03
  purpose: to work with a few continious
    variables.
  license: public domain;

libname storage "/home/u63988796/data";

filename rawdata
	"/home/u63988796/data/fat.txt";

ods pdf file=
    "/home/u63988796/results/5507-02-wheeler-continious-variables.pdf";
    
data storage.fat;
  infile fat;
  input 
    case
    fat_brozek
    fat_siri
    density
    age
    wt
    ht
    bmi
    ffw
    neck
    chest
    abdomen
    hip
    thigh
    knee
    ankle
    biceps
    forearm
    wrist;
    
    label
    case="Case number"
    fat_brozek="Fat (Brozek's equation)"
    fat_siri="Fat (Siri's equation)"
    density="Density"
    age="Age (yrs)"
    wt="Weight (lbs)"
    ht="Height (inches)"
    bmi="Body mass index (kg/m^2)"
    ffw="Fat Free Weight (lbs)"
    neck="Neck circumference (cm)"
    chest="Chest circumference (cm)"
    abdomen="Abdomen circumference (cm)"
    hip="Hip circumference (cm)"
    thigh="Thigh circumference (cm)"
    knee="Knee circumference (cm)"
    ankle="Ankle circumference (cm)"
    biceps="Biceps circumference (cm)"
    forearm="Forearm circumference (cm)"
    wrist="Wrist circumference (cm)";

run;

* Some additional details about this data:

  Brozek's equation is 457/Density - 414.2

  Siri's equation is 495/Density - 450


  Abdomen circumference is measured at the
  umbilicus and level with the iliac crest

  Wrist circumference is distal to the 
  styloid processes;

proc print
data=storage.fat(obs=10);
  var
    case
    fat_brozek
    fat_siri
    density
    age
  ;
  title1 "Partial listing of data";
run;

proc contents
  data=storage.fat;
  title1 "Information about the fat data set";

run;
  
ods pdf close;