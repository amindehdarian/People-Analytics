# Advanced People Analytics
**Tools and methods for advanced analysis** 

[Go to the End](#end)


In this part, a review of tools and methods is provided with code examples for each one, and then detailed examples are presented in the sub-sections. 

## Table of Contents
<a name="top"></a>
[Chi-square analysis](#end)

## Chi-square analysis
When both Dependent Variable (DV) and the Independent Variable (IV) are categorical (binary, nominal or ordinal), and there is only one IV, then Chi-square analysis is used.

It analyzes if the frequencies and proportions across particular categories are related to changes in another category. 

For instance, imagine we have workforce data of a company with 562 employees working at 5 different levels. Two of these levels are non-managerial and the three others are managerial levels.
So, we can check if there is statistically significant relationship between gender and managerial position. It is like calculating the frequency of men and women in the company and then see whether they are in managerial or non-managerial roles. 
By combining these two dimensions, we have four categories:

- male manager
- male non-manager
- female manager
- female non-manager

To check the significance of this relationship, we conduct a chi-square test. It compares the frequencies observed with the expected frequency. If there is no relationship, we can conclude the observed difference could be gained by chance. 

The chi-square statistic is calculated as:

$X^2 = \sum \frac{(O - E)^2}{E}$

where:
- $O$ is the observed value
- $E$ is the expected value

then the chi-squared statistic checked against a distribution with known properties along with the degrees of freedom, calculated as (r-1)(c-1) where r and c are our data dimensions, to find the p-value. 

*** Explanation of the example

The chi-square analysis is used when the relationship between two categorical variables is analyzed. For more than two categorical variables, loglinear analysis should be done. 

## Logistic Regression Analysis

[Go to the Table of Contents](#top)
<a name="end"></a>