### Chi-square test

#setting the default working directory
install.packages("rstudioapi")
library(rstudioapi)
library(rmarkdown)
library(knitr)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

rm(list=ls())

# loading data
Data <- read.table("sampleData_logisticRegressionTest.csv", sep = ",", header = TRUE)
colnames(Data)

# Define the logistic regression model 
model <- glm(Recommend ~ Gender + Position, family =
                    binomial("logit"), data = Data)
# Show the results of the logistic regression model
summary(model)

# based on the results, we can only infer males are more likely to recommend than females
# the rest of the coefficents are not statistically significant. 

# Display odds ratios by exponentiating the coefficients
exp(coef(model))

# the odds ratios show males have 1.39 times higher odds of recommending compared to females.

# For some Logistic regression stats (Nagelkerke and pseudo R sq):
nagelkerke(model, null = NULL, restrictNobs = TRUE)

# Nagelkerke R² = 0.015 (1.5%) means the model explains only 1.5% of the variation in the outcome
  # meaning it's not a strong model.