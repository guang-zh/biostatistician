# Data Scientist Exam Questions

# cumulative probability
ppois(30, lambda = 15, lower.tail = FALSE)

# obtain 5 trial results, binomial distribution, success is 20%
rbinom(5, size = 1, prob = 0.2)

# 10% donation, probability of 15 in next 100 gives donation
pbinom(15, 100, prob = 0.1, lower.tail = FALSE)

# ANOVA test
anova_result <- aov(measure ~ group, data = df)
summary(anova_result)
library(emmeans)
emmeans(anova_result, pairwise ~ group, adjust = "tukey")

mpg_test <- aov(mpg~factor(gear), data = mtcars)
TukeyHSD(mpg_test)$`factor(gear)`

# probability
ppois(50, lambda = 75)

# Chi-square test for two categorical variables
chisq.test(table(mtcars$cyl, mtcars$carb))

# One sample t-test for mean rate of 20% and higher
t.test(x = df$rate, alternative = "greater", mu = 0.2)

# spam email or not
rbinom(50, size = 1, prob = 0.5)

library(dplyr)
df %>% sample_n(7, temp)

df_data %>% sample_n(7)

# Expected life of 5 cars when expected average of 7 years for cars
rexp(n=5, rate=1/7)

dpois(1, 20, 0.002)
dpois(1, 20, 0.002)

pbinom(1, 20, 0.002)

dbinom(3, size = 5, prob = 0.5)


lapply(mtcars[, -1], mean, na.rm = TRUE)

library(reshape2)
pivot_table <- dcast(mtcars ~ ., mean, value.var = "mpg")
print(pivot_table)

stat_summary()

# pivot table
your_data %>%
  group_by(row_variable, column_variable) %>%
  summarize(value = sum(value_variable, na.rm = TRUE)) %>%
  pivot_wider(names_from = column_variable, values_from = value)

library(ggplot2)
ggplot(data = df, aes(x = group, y = measure)) +
  geom_line() +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2)


  library(ggplot2)
  library(RColorBrewer)

  # Assuming 'df' is the dataframe with the data for the heatmap
  # and 'value' is the column name for the values to be plotted

  ggplot(df, aes(x = X, y = Y, fill = value)) +
    geom_tile() +
    scale_fill_gradientn(colours = brewer.pal(9, "Blues"), limits = c(min(df$value), max(df$value))) +
    labs(x = "X-axis", y = "Y-axis", fill = "Value") +
    theme_minimal()


#################################################

sapply(mtcars, class)
sapply(mtcars, is.numeric)

library(stringr)
str_subset(your_data, "^p", negate = TRUE)

negative_value <- function(x) {
  if (x < 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

library(jsonlite)
data <- stream_in(file("large_file.json"))

is_positive <- function(x) {
  if (!is.numeric(x)) {
    stop("Input must be numeric")
  }
  return(x > 0 & is.finite(x))
}
is_positive(c(5, -10, 0.2))


# Load necessary libraries
library(caret)
library(MASS)

# Example dataset
data(Boston)

# Fit a linear regression model using caret
set.seed(123)
model <- train(medv ~ ., data = Boston, method = "lm")

# Get a description of the fitted model
fit_description <- describeFit(model)

# Print the fit description
print(fit_description)