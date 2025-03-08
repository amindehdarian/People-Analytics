### Kaplan-Meier Survival analysis test

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
