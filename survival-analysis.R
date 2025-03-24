### Kaplan-Meier Survival Analysis Test

# Step 0: Setting the default working directory
if (!require(rstudioapi)) install.packages("rstudioapi")
if (!require(survival)) install.packages("survival")
if (!require(rmarkdown)) install.packages("rmarkdown")
if (!require(knitr)) install.packages("knitr")

library(rstudioapi)
library(survival)
library(rmarkdown)
library(knitr)

# Automatically set the working directory to the location of the script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Clear the workspace to remove all existing objects and start fresh
rm(list=ls())

# Step 1: Load the data from a CSV file into a data frame
# The data file should be in the working directory or provide the full path
Data <- read.table("sampleData_survivalAnalysis.csv", sep = ",", header = TRUE)

# View column names to understand the structure of the data
colnames(Data)

# Step 2: Convert the Gender variable from numerical to categorical (factor)
# 0 = Female, 1 = Male
Data$Gender <- factor(Data$Gender, levels = c(0, 1), labels = c("Female", "Male"))

# Frequency count of genders to check the distribution
Freq1 <- table(Data$Gender)
print("Frequency of Genders:")
print(Freq1)

# Step 3: Convert the LeaverStatus variable from numerical to categorical (factor)
# 0 = Stayer, 1 = Leaver
Data$LeaverStatus2 <- factor(Data$LeaverStatus, levels = c(0, 1), labels = c("Stayer", "Leaver"))

# Frequency count of leaver status to check the distribution
Freq2 <- table(Data$LeaverStatus2)
print("Frequency of Leavers:")
print(Freq2)

# Step 4: Overall Survival Analysis using Kaplan-Meier estimator
# Fit the survival model without grouping (overall survival curve)
kmall <- survfit(Surv(LengthOfService, LeaverStatus) ~ 1, data = Data)

# Print the survival statistics including restricted mean survival time (rmean)
print("Overall Survival Analysis:")
print(kmall, print.rmean = TRUE)

# Summary of the survival analysis to view detailed survival statistics
summary(kmall)

# Plotting the overall survival distribution curve
plot(kmall, xlab = "Job Tenure", ylab = "Survival Probability (%)", yscale = 100, 
     main = "Survival Distribution (Overall)")

# Step 5: Survival Analysis by Gender
# Fit separate survival curves for each gender using Kaplan-Meier
kmGEN <- survfit(Surv(LengthOfService, LeaverStatus) ~ Gender, data = Data)

# Print the survival statistics for each gender
print("Survival Analysis by Gender:")
print(kmGEN, print.rmean = TRUE)

# Summary of gender-specific survival analysis
summary(kmGEN)

# Plotting the survival curves for each gender
plot(kmGEN, xlab = "Job Tenure", ylab = "Survival Probability (%)", yscale = 100, 
     col = c("blue", "red"), main = "Survival Distributions by Gender")
legend("bottomleft", title = "Gender", legend = c("Female", "Male"), fill = c("blue", "red"))

# Step 6: Log-Rank Test to Compare Survival Curves Between Genders
# The log-rank test assesses whether there is a significant difference between the survival curves of males and females
gender_diff <- survdiff(Surv(LengthOfService, LeaverStatus) ~ Gender, data = Data)

# Print the results of the log-rank test
print("Log-Rank Test for Gender Differences:")
print(gender_diff)

# Interpretation:
# The Chi-squared test result (Chisq= 21.6 on 1 degree of freedom) shows a very low p-value (p = 3e-06).
# This indicates that there is a statistically significant difference in survival curves between genders.
# Specifically, males tend to have longer survival times (job tenure) compared to females.
