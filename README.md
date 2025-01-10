# Advanced People Analytics
**Tools and methods for advanced analysis** 

[Go to the End](#end)
<a name="top"></a>

In this part, a review of tools and methods is provided with code examples for each one, and then detailed examples are presented in the subßsections. 

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

The equation is:

_X^2 = Σ ((observed_value - expected_value)^2 / expected_value)_ 

The chi-square statistic is calculated as:

$X^2 = \sum \frac{(O - E)^2}{E}$

Where:
- $O$ is the observed value
- $E$ is the expected value

The chi-square statistic is calculated as:

$$
X^2 = \sum \frac{(O - E)^2}{E}
$$

Where:
- \( O \) is the observed value
- \( E \) is the expected value



[Go to the Top](#top)
<a name="end"></a>