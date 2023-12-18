setwd("/Users/anaszaheer/Desktop/house-prices-advanced-regression-techniques")

#3a. What is your response variable? Is it quantitaive or qualitaive?

'the response variable in our project is the "SalePrice." 
It is a quantitative variable because it represents
a numeric value (the sale price of a house).'

#3b. What are your predictors? Which of them are quantitaive?

'In our project the predictors are the variables used to predict the "SalePrice." 
which are:
"GrLivArea" - Represents the above-ground living area in square feet.
"YearBuilt" - Represents the year when the house was built.
"OverallQual" - Represents the overall material and finish quality of the house.'


#3c What predictors do you expect to be key predictors? Can you prove that they are 
#key predictors, e.g. using significance?

house_prices = read.csv("train.csv")

model = lm(SalePrice ~ GrLivArea + YearBuilt + OverallQual, data = house_prices)

summary(model)

#Interpretation:

'Key Predictors:
GrLivArea: The positive coefficient suggests that the number of rooms (GrLivArea) is a key predictor. 
Each additional room contributes significantly to the house price.
YearBuilt: The positive coefficient indicates that the age of the house (YearBuilt) is another key predictor. 
Newer houses tend to have higher prices.
OverallQual: The positive coefficient signifies that overall quality (OverallQual) is a key predictor. 
Higher quality leads to higher prices.

Significance:
All factors are very important in predicting the price. 
(p-values are very small, less than 0.001)

Model Fit:
The model explains roughly 74% of the price differences among houses 
(R-squared is 0.74).

Residuals:
The predited prices are close to the actual prices, 
with some variations (residuals) ranging from -393,773 to 290,554.

In summary, the model suggests that the number of rooms, house age, 
and overall quality are key predictors of house prices in the dataset.'


#3d Is there any collinearity (or mul�collinearity) between predictors?

library(ggplot2)
library(corrplot) #this library is for the honor credit

# Subset the predictors for correlation analysis
predictors_subset = house_prices[, c("GrLivArea", "YearBuilt", "OverallQual")]

# Calculate the correlation matrix
cor_matrix = cor(predictors_subset)

# Create a heatmap
corrplot(cor_matrix, method = "color")

#from looking at heatmap 
'The heatmap colors indicate the correlation strength between pairs of predictors:
  
Dark Blue: Represents variables highly correlated with themselves (diagonal boxes). 
This is expected and shows perfect correlation as a variable is always perfectly 
correlated with itself.

Sky Blue: Indicates moderate positive correlation between variables. 
For example, there is a moderate positive correlation between GrLivArea and 
OverallQual, as well as between YearBuilt and OverallQual.

Half White: Represents little to no correlation. 
For instance, the half-white box between GrLivArea and YearBuilt 
suggests a weak or negligible correlation between these two variables.'

#The heatmap shows a mix of colors, suggesting different levels of correlation between 
#predictors, but none of them indicate a strong, problematic multicollinearity.

#4a."House Prices: Advanced Regression Techniques" competition on Kaggle.

#4c. Some some figures

library(ggplot2)


#for YearBuilt
ggplot(house_prices, aes(x = YearBuilt)) +
  geom_histogram(binwidth = 10, fill = "lightgreen", color = "black", alpha = 0.7) +
  labs(title = "Distribution of YearBuilt", x = "YearBuilt", y = "Frequency")

#for OverallQual
ggplot(house_prices, aes(x = OverallQual)) +
  geom_histogram(binwidth = 1, fill = "lightcoral", color = "black", alpha = 0.7) +
  labs(title = "Distribution of OverallQual", x = "OverallQual", y = "Frequency")


