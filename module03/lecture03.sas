* lecture03.sas
  written by Steve Simon
  November 27, 2018;

%let path=/folders/myfolders/introduction-to-sas;
%let xpath=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

ods pdf
  file="&path/module03/lecture03.pdf";

filename fev
  "&path/data03/fev.txt";

libname intro
  "&path/data03";

* Today, you will analyze some data sets that
  have a mix of categorical and continuous
  variables. The first data set looks at 
  pumonary function in a group of children.
  You can find a description of this data set at

  http://jse.amstat.org/datasets/fev.txt
;

proc format;
  value fsex
    0 = "Female"
    1 = "Male"
  ;
  value fsmoke
    0 = "Nonsmoker"
    1 = "Smoker"
  ;
run;

data intro.fev;
  infile fev delimiter="," firstobs=2;
  input age fev ht sex smoke;
  label
    age=Age in years
    fev=Forced Expiratory Volume (liters)
    ht=Height in inches
    sex=Sex
    smoke=Smoking status
  ;
run;

proc print
    data=intro.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title1 "Partial listing of fev data";
run;

* There is a mix of categorical and continuous variables in this data set, but the summary function should work for all of them.

* Calculate correlations among age, ht, and fev.

* Recall that you use a scatterplot to examine the relationship between two continuous variables.

```{r pu.scatterplot}
plot(pu$ht,pu$fev)
smooth.curve <- lowess(pu$ht,pu$fev)
lines(smooth.curve)
```
When you want to look at a relationship between a categorical variable and a continuous variable, you should use a boxplot.

```{r pu.boxplots-fev}
boxplot(fev~smoke.factor,data=pu)
```

This is very odd. You can get a hint as to why smokers might have higher fev values than non-smokers by looking at how age and smoking status are related.

```{r pu.boxplots-age}
boxplot(age~smoke.factor,data=pu)
```


## On your own

Look at the relationship between sex and fev.

You should also calculate the means for each continuous variable within each level of the categorical variable.

Note: you don't really need the na.rm=TRUE argument here, but you might in other examples.

```{r pu.by.fev}
# fev mean by smoke.factor
by(pu$fev,pu$smoke.factor,mean,na.rm=TRUE)
# fev standard deviation by smoke.factor
by(pu$fev,pu$smoke.factor,sd,na.rm=TRUE)
```

The output is not labelled all that clearly, but you can use the paste function to make things look nicer.

```{r pu.paste.fev}
grp.means <- by(pu$fev,pu$smoke.factor,mean)
grp.stdev <- by(pu$fev,pu$smoke.factor,sd)
colon <- ": "
plus.minus <- "+/-"
paste(names(grp.means),colon,round(grp.means,1),
      plus.minus,round(grp.stdev,1),sep="")
```

Let's calculate mean ages for smokers and nonsmokers. Notice that smokers are 4 years older on average than nonsmokers.

```{r pu.paste.age}
grp.means <- by(pu$age,pu$smoke.factor,mean)
grp.stdev <- by(pu$age,pu$smoke.factor,sd)
colon <- ": "
plus.minus <- "+/-"
paste(names(grp.means),colon,round(grp.means,1),
      plus.minus,round(grp.stdev,1),sep="")
```

## On your own

Compute the mean and standard deviation for fev by sex.


;

proc import
    datafile="&path/data03/housing.txt"
    out=intro.housing
    dbms=dlm
    replace;
  delimiter='09'x;
  getnames=yes;
run;

proc print
    data=intro.housing(obs=10);
  title1 "Partial listing of housing data";
run;

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
  
  1. Convert the asterisks in the AGE and TAX
     variables to missing. How many missing
     values are there for AGE and for TAX?

  2. Create factors for NE, CUST, and COR.
     Draw bar charts for each of these factors.

  3. Find the largest house (biggest SQFT) in the
     data set. Is the largest house also the most
     expensive house?

  4. Calculate frequency counts for FEATS. Are
     there any houses with the no features? Are
     there any houses with every possible feature?

  5. Evaluate the relationship between PRICE and
     SQFT using a scatterplot. Include a smooth 
     curve. Do larger houses tend to cost more?

  6. Evaluate the relationship between CUST and
     PRICE using a boxplot. Calculate the mean
     price and standard deviation by CUST.

  7. What is the difference in average prices
     between northeast houses and other houses?
     What is the difference in average taxes?

  8. Are custombuilt houses more likely to appear
     on corner lots? Calculate the percentages and
     compute a relative risk.
;

ods pdf close;

