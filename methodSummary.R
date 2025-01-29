### Chi-square test

#setting the default working directory
install.packages("rstudioapi")
library(rstudioapi)
library(rmarkdown)
library(knitr)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

rm(list=ls())

# loading data
Data <- read.table("sampleData_chiSquareTest.csv", sep = ",", header = TRUE)
colnames(Data)

# creating the frequency table
Freq1 <- table(Data$managing)
Freq1
prop.table(Freq1)
kable(Freq1)

Freq2 <- table(Data$gender)
Freq2
prop.table(Freq2)

# Frequency cross-tabulation
GenderByManager <- table(Data$gender,
                         Data$managing)
GenderByManager

#margin frequency of each gender
margin.table(GenderByManager, 1)

#proportions of managers for each gender
prop.table(GenderByManager, 1)

#marginal frequency for each role
margin.table(GenderByManager, 2)

# proportions of genders for each role
prop.table(GenderByManager, 2)
round(prop.table(GenderByManager, 2),2)

# Computing the Chi-square test
chisq.test(GenderByManager)

#p-value = 5.292e-12 which shows the difference between genders across roles is statistically significant

