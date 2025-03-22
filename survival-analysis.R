### Kaplan-Meier Survival analysis test

#setting the default working directory
install.packages("rstudioapi")
install.packages("survival")
library(rstudioapi)
library(rmarkdown)
library(knitr)
library(survival)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

rm(list=ls())

# loading data
Data <- read.table("sampleData_survivalAnalysis.csv", sep = ",", header = TRUE)
colnames(Data)

Data$Gender <- factor(Data$Gender,
                              levels = c(0, 1), labels = c("Female", "Male"))

# frequency of genders
Freq1 <-table(Data$Gender)
Freq1

#frequency of leavers
Data$LeaverStatus2 <- factor(Data$LeaverStatus,
                                       levels = c(0, 1), labels = c("Stayer",
                                                                    "Leaver"))
Freq2 <- table(Data$LeaverStatus2)
Freq2

#Kaplan-Meier Analysis

# Survival analyses overall
kmall <- survfit(Surv(LengthOfService, LeaverStatus) ~ 1, data =
                   Data)

# Prints the event (leaver) data, mean, and median survival
print(kmall, print.rmean = TRUE)

# Prints the survival table statistics
summary(kmall)

# Plot of the overall turnover/tenure data
plot(kmall, xlab = "Job Tenure",
     ylab = "% Surviving", yscale = 100,
     main = "Survival Distribution (Overall)")

# Conduct survival analyses by Gender
kmGEN <- survfit(Surv(LengthOfService, LeaverStatus) ~ Gender, data =
                   Data)

# Prints the event (leaver) data, mean, and median survival for this gender analyses
print(kmGEN, print.rmean = TRUE)

# Prints the survival table statistics
summary(kmGEN)

#prints the number of events (leaver), mean, and median survival by
# gender
print(kmGEN, print.rmean = TRUE)

# Plot of the different survival curves across males V females
plot(kmGEN, xlab = "Job Tenure",
     ylab = "% Surviving", yscale = 100, col = c("blue","red"),
     main = "Survival Distributions by Gender")
legend("bottomleft", title = "Gender", legend = c("Female", "Male"),
       fill = c("blue", "red"))

# Obtain the significance of any differences in survival patterns across
# gender (0 = female, 1 = male)
survdiff(Surv(LengthOfService, LeaverStatus) ~ Gender, data =
           Data)
