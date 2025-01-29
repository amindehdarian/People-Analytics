### Chi-square test

#setting the default working directory
install.packages("rstudioapi")
library(rstudioapi)
library(rmarkdown)
library(knitr)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

rm(list=ls())