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

## we can also extend the analysis to more than two categories in the DV
  # focusing now on position rather than managerial level

# Frequency cross-tabulation
GenderByPosition <- table(Data$gender,
                         Data$position)
GenderByPosition

# Computing the Chi-square test
chisq.test(GenderByPosition)

# again the low p-value (2.749e-12) shows there is a significant relationship between gender and position

# so, to interpret the results, we can look at the expected number of each gender across positions:
chisq.test(GenderByPosition)$expected

# and The strength of association can be measured using Cramer’s V
  # it ranges from 0 (no association) to 1 (perfect association):
library(rcompanion)
cramerV(GenderByPosition)

# Cramer’s V = 0.3078 suggests a moderate association

# in order to explore which categories drive the difference, we can use pairwise comparisons:
# Transpose the GenderByPosition table
GenderByPosition_transposed <- t(GenderByPosition)
pairwise_results <- pairwise.prop.test(GenderByPosition_transposed, p.adjust.method = "bonferroni")
print(pairwise_results)
kable(pairwise_results)
# the results show that there is a statistically significant difference between operational vs. middle management, and between operational vs. top management.
  # however, the difference between the two managerial levels is not statistically significant. 

# it can be also seen visually the pattern across functions:

barplot(GenderByPosition, beside = TRUE, legend = TRUE, col = c("red", "blue"),
        main = "Gender Distribution by Position",
        xlab = "Position", ylab = "Count",
        ylim = c(0, max(GenderByPosition) + 10))

