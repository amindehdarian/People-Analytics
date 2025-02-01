# Advanced People Analytics
**Tools and methods for advanced analysis** 

[Go to the End](#end)


In this part, a review of tools and methods is provided with code examples for each one, and then detailed examples are presented in the sub-sections. 

## Table of Contents
- [Chi-square analysis](#chi-square-analysis)
- [Logistic Regression Analysis](#logistic-regression-analysis)

## Chi-square analysis
When both Dependent Variable (DV) and the Independent Variable (IV) are categorical (binary, nominal or ordinal), and there is only one IV, then Chi-square analysis is used.

It analyzes if the frequencies and proportions across particular categories are related to changes in another category. 

For instance, imagine we have workforce data of a company with 562 employees working at 3 different levels. One level is non-managerial and the two others are managerial levels.
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

***Explanation of the example for binary DV***

***Explanation of the example for non-binary categorical DV***

The chi-square analysis is used when the relationship between two categorical variables is analyzed. For more than two categorical variables, loglinear analysis should be done. 

[Back to the Table of Contents](#table-of-contents)

## Logistic Regression Analysis

Logistic regression is used when the DV is binary; so, we can have a combination of categorical and continuous variables as IVs. 
The method includes the following steps:
	- Calculating the model's Chi-square: to test how well the model fits the data by comparing the observed versus the expected values. 
	- Modeling chi-square p-value: to evaluate the statistical significance of the overall model
	- Calculating the Nagelkerke R-square: an estimation of the percentage of variation explained by our model
	- Calculating the p-value of each IV: to analyze which IVs potentially significantly impact the DV
	- Analzying the odds ratio (Exp(b)): to indicate the odds or probability of the occurence in the DV, incurred by one unit change in each IV. 

The logistic regression model is defined as:

$P(Y) = \frac{1}{1+e^{-(b_0 + b_1X_{1i} + b_2X_{2i} + \dots + b_nX_{ni})}}$


where:
- **P(Y)**: Probability of the event occurring
- **b0**: Intercept
- **b1, b2, ..., bn**: Coefficients
- **X1, X2, ..., Xn**: Predictor variables



When the DV is binary, then the analysis is called a binary logistic regression. If it is not binary, then we have a multinomial logistic regression. 

In the example, we want to predict if recommending working for a company (collected through a survey) is based on gender or position in the company.
- Gender is binary (male-female)
- Position has five levels (one operational level and four managerial levels - junior, middle, upper, top)

| Predictor                  | Estimate  | Std. Error | z-value | p-value  | Odds Ratio (exp(β)) |
|----------------------------|----------|------------|---------|----------|----------------------|
| **Intercept**              | 2.06873  | 0.22351    | 9.256   | <0.0001 *** | 7.91                 |
| **Gender (Male)**          | 0.32659  | 0.16461    | 1.984   | 0.0473 *  | 1.39                 |
| **Position (Middle Mgmt)** | -0.27406 | 0.24213    | -1.132  | 0.2577    | 0.76                 |
| **Position (Operational)** | 0.04427  | 0.26891    | 0.165   | 0.8692    | 1.05                 |
| **Position (Top Mgmt)**    | 1.18681  | 1.03855    | 1.143   | 0.2531    | 3.28                 |
| **Position (Upper Mgmt)**  | 0.28908  | 0.32170    | 0.899   | 0.3689    | 1.34                 |

*Significance codes:*  
- *** `p < 0.001`
- ** `p < 0.01`
- * `p < 0.05`
- `p < 0.1`

Based on the results, we can only infer males are more likely to recommend than females, and the rest of the coefficents are not statistically significant. 

Looking at the Odds Ratios:

| Predictor                  | Odds Ratio (exp(β)) | 95% CI | p-value  | Significance |
|----------------------------|--------------------|--------|----------|-------------|
| **Intercept**              | 7.91               | -      | <0.0001  | ***         |
| **Gender (Male)**          | 1.39               | -      | 0.0473   | *           |
| **Position (Middle Mgmt)** | 0.76               | -      | 0.2577   |             |
| **Position (Operational)** | 1.05               | -      | 0.8692   |             |
| **Position (Top Mgmt)**    | 3.28               | -      | 0.2531   |             |
| **Position (Upper Mgmt)**  | 1.34               | -      | 0.3689   |             |

*Significance codes:*  
- *** `p < 0.001`
- ** `p < 0.01`
- * `p < 0.05`
- No symbol: Not statistically significant (p > 0.05)

**Note:** Only `Gender (Male)` has a significant effect (p = 0.0473). The Odds Ratios for Position categories are **not statistically significant** and should be interpreted with caution.

### Model Fit Statistics

| Metric                            | Value  | Interpretation |
|----------------------------------|--------|---------------|
| **McFadden's R²**                | 0.0109 | Very low explanatory power |
| **Cox & Snell (ML) R²**          | 0.0074 | Low model fit |
| **Nagelkerke R²**                | 0.0150 | 1.5% of variance explained |
| **Likelihood Ratio Test p-value** | 0.0277 | Model is slightly better than null model |

**Interpretation:**
- The **Nagelkerke R² (1.5%)** suggests the model explains **only a small fraction** of the variation in `Recommend`.
- The **Likelihood Ratio Test (p = 0.0277)** suggests that the model provides **some improvement** over a null (intercept-only) model, but the effect is **not strong**.
- Overall, the model fit is **weak**, meaning more predictive variables or interactions might be needed to improve accuracy.













[Back to the Table of Contents](#table-of-contents)