* lecture13.sas
  written by Steve Simon
  December 2, 2018;

%let path=/folders/myfolders/introduction-to-sas;
%let xpath=c:/Users/simons/My Documents/SASUniversityEdition/myfolders;

ods pdf
  file="&path/module13/lecture13.pdf";

libname intro
  "&path/data03";

* Let's take a closer look at the fev data set.
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

proc print
    data=intro.fev(obs=10);
  format 
    sex fsex. 
    smoke fsmoke.
  ;
  title1 "Pulmonary function study";
  title2 "Partial listing of fev data";
run;

* When you are using a categorical predictor for
  a continuous outcome, you can use analysis of
  variance (ANOVA).
;

proc glm
    data=intro.fev;
  class smoke;
  model fev = smoke;
  title2 "ANOVA";
run;

* In this ANOVA model, there are only two levels
  for the categorical predictor (smoke=yes and
  smoke=no). This simplifies the interpretation
  a bit. Since the p-value is small, you can
  conclude that there is a statistically 
  sigificant difference in the FEV between
  smokers and non-smokers. 

  Looking at the boxplot, you can see that this
  result is going in the opposite direction from
  what you'd expect: smokers have a higher 
  average FEV than non-smokers. There's an 
  explanation for this which you will see later.
;

* When you are using a continuous predictor for
  a categorical outcome, you can use logistic
  regression. There is a logistic procedure in
  SAS, but I recommend that you use the 
  generalized linear model instead, as this
  procedure allows you to fit other interesting
  models like Poisson regression.
;

proc genmod
    data=intro.fev;
  model smoke = age / dist=binomial;
  title2 "Logistic regression";
run;

* SAS parameterizes this model in the opposite
  way from your intuition. SAS models the 
  probability of being a non-smoker, and it
  turns out that as age increases, the 
  probability of being a non-smoker decreases.

  The number reported is the log odds ratio
  and you would exponentiate this value to get
  an odds ratio of 0.62. This means that for
  each year increase in age, the odds of being
  a non-smoker decreases by 38%.

  Exponentiate the confidence limits to get a
  confidence interval for the odds ratio of
  0.55 to 0.69.
;

* You can show on your own that there is a 
  positive association between age and fev.
  Older children tend to have higher values
  for fev. This makes sense and may provide
  an explanation for counterintuitive 
  results from earlier. Maybe smokers have
  better fev values not because smoking is
  good for them, but rather because smoking
  occurs more often in the older kids. Put
  both variables in the model and let's see
  what happens.
;

proc glm
    data=intro.fev;
  class smoke;
  model fev=age smoke;
  title2 "ANCOVA";
run;

* This model, with both a continuous predictor
  and a categorical predictor, is often called
  analysis of covariance (ANCOVA). The model
  shows a statistically significant effect of
  both age and smoking.

  The difference between the statistically
  significant effect of smoking is that in
  this model, where you control for the effect
  of age, smoking has a negative association
  with FEV.
;

* Here is the homework assignment for this module.

  Read in the data housing.txt. 
  
  1. Fit a linear regression model predicting
  the sales price (dependent variable) using
  custom build (independent variable). Is there
  a statistically significant difference in the
  average sales price between custom build and 
  regular houses?

  2. Fit a logistic regression model predicting
  custom build (dependent variable) using the 
  square footage of the house (independent
  variable). How do the odds of a custom build 
  change as the size of the house increases?

  3. Fit a linear regression model predicting
  the sales price (dependent variable) using
  custom build and square footage (independent
  variables). Does the sales price for custom
  builds differ when you control for the size
  of the house?
;

ods pdf close;

