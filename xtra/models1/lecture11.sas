* lecture11.sas
  written by Steve Simon
  September 7, 2018;

* This program illustrates how to fit a 
  linear regression model in SAS. It
  also explains how to output predicted 
  values, and residuals. Finally, it 
  shows some of the standard diagnostics
  that you can use to assess the validity
  of your model assumptions.
;

%let path=c:/Users/simons/My Documents/SASUniversityEdition/myfolders/introduction-to-sas;

filename fat
  "&path/data/fat.txt";

libname intro
  "&path/bin";

ods pdf
  file="&path/results/lecture11.pdf";


* It's always a good idea to print out a small 
  piece of your data to make sure everything
  is okay.
;
  
proc print
    data=intro.fat2(obs=10);
  var case fat_b fat_s dens age;
  title1 "The first ten rows and five columns";
  title2 "of the fat data set";
run;

* Before you run a linear regression model,
  always, always, always draw a graph of
  your data.
;

proc sgplot
    data=intro.fat2;
  scatter x=age y=fat_b;
  reg x=age y=fat_b;
  title "Scatterplot with linear regression line";
run;

* SAS has several programs that can produce
  a linear regression models, but the two
  big ones are reg and glm. I will talk 
  exclusively about glm, because it
  generalizes well to other statistical
  models like analysis of variance and
  analysis of covariance

  The acronym glm stands for general
  linear model. This is not the same as
  the generalized linear model. It is 
  general in the sense that it can 
  handle several different types of 
  independent variables. It is not as
  general, though, as the generalized
  linear model (proc genmod) which
  can handle several different types
  of outcome variables.

  You specify a linear regression model
  in the glm procedure using the model
  statement. The dependent or outcome
  variable goes on the left side of the
  equal sign and the independent variable
  goes on the right hand side.
;

proc glm
    data=intro.fat2;
  model fat_b=age;
run;

* Much of the output from glm is only of
  interest when you are comparing a series of
  fairly complex regression models. The key
  information appears in the last table.

  The intercept term represents the estimated
  average percentage of fat for a person who
  is zero years old. This is obviously an
  extrapolation beyond the range of the data.

  The slope term represents the estimated
  average change in percentage fat when age
  increases by one year.

  You may wish to compute predictions for
  this linear regression model. By default,
  SAS produces predictions at each age in
  your data set, but you can produce 
  predictions at other values by supplementing
  your original data set.

  In this example, SAS produces predictions at
  a value (20) just a bit smaller than the
  youngest subject and a value (60) just a bit
  larger than the oldest subject. Even for a 
  minor extrapolation, you should be careful!

  Notice that the dependent variable is 
  explicitly set to missing to emphasize that
  this is a prediction for a new value of your
  independent variable.
;

data predict;
  age=20; fat_b=.; output;
  age=60; fat_b=.; output;
run;

data augmented;
  set predict intro.fat2;
run;

proc print 
    data=augmented(obs=10);
  var fat_b age;
  title "Partial listing of augmented data set";

* Use the output statement to produce a new
  data set with predicted values. Also, save
  some paper by telling SAS not to print out
  any output for the second time through with
  the same model.
;

proc glm 
    noprint
    data=augmented;
  model fat_b=age;
  output 
    out=new_predictions
    p=predicted_fat;
run;

proc print
    data=new_predictions(obs=10);
  var fat_b age predicted_fat;
  title "Partial listing of predicted values";
run;

* The residuals, the difference between the
  observed value and the predicted value, is
  produced similarly.
;

proc glm
    noprint
    data=intro.fat2;
  model fat_b=age;
  output
    out=residual_data
	p=predicted_fat
	r=residuals_fat;
run;

proc print
    data=residual_data(obs=10);
  var fat_b age predicted_fat residuals_fat;
  title "Partial listing of predicted values and residuals";
run;

* A histogram of the residuals allows you 
  to look for a skewed pattern or outliers.
;

proc sgplot
    data=residual_data;
  histogram residuals_fat;
  title "Histogram of residuals";
run;

* This histogram shows a distribution fairly
  close to a bell shaped curve, which provides
  a small bit of assurance of the validity of
  the normality assumption. You can also run
  a normal probability plot here.
;

* A plot of residuals versus the predicted
  values is useful for checking for a
  possible nonlinear relationship. A
  smoothing spline helps a lot with
  interpretation of this graph.
;

proc sgplot
    data=residual_data;
  scatter x=predicted_fat y=residuals_fat;
  pbspline x=predicted_fat y=residuals_fat;
  title "Residual plot with smoothing spline";
run;

* Ignore the minor bends in the smoothing
  spline. This plot provides a fair 
  amount of assurance that the
  relationship between age and body fat
  does not have any non-linear components.
;

* SAS offers a very broad range of additional
  diagnostic measures. A simple and very 
  useful diagnostic is Cook's D, which
  measures how much the predicted value would
  change if you deleted a particular value. As
  a rough rule of thumb, a value of Cook's D 
  larger than 4/n is a source of concern.
;

proc glm 
    noprint
    data=intro.fat2;
  model fat_b=age;
  output 
    out=diagnostics
    cookd=d;
run;

proc sgplot
    data=diagnostics;
  scatter x=age y=d;
  refline 0.016 / axis=y label="4/n" lineattrs=(pattern=dot);
  title "Plot of Cook's distance";
run;

proc sort
    data=diagnostics;
  by d desc;
run;

proc print
    data=diagnostics(obs=10);
  var age fat_b d;
  title "Plot of ten largest values for Cook's distance";
run;

* Homework11.

Having reviewed these analyses, I would like 
you to turn in some simple analyses that you 
run on a fresh data set. This homework 
assignment will be graded pass/fail.

There is a second data set on sleep in 
mammals. You can find a brief description of
this data set at

--> http://www.statsci.org/data/general/sleep.html

and you can download the actual data at

--> http://www.statsci.org/data/general/sleep.txt

For every question, include the relevant SAS 
output and a brief written commentary explaining
what the results mean. When you send your 
answers, please include the original questions.

1. Fit a linear regression model with predation
as the independent variable and total sleep as
the dependent variable. Include a scatterplot.
Interpret the results.

2. Repeat #1 using exposure as the independent
variable.

3. Repeat #1 on more time using danger as the
independent variable.

4. Calculate residuals from the linear 
regression model in #1 and draw a 
histogram. Interpret this histogram.

5. Place all the key results into a Word 
document or PowerPoint presentation, or 
as a PDF file or as an HTML file.
;

ods pdf close;

