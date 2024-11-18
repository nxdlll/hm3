---
title: "Introduction to simplelinear_regression()"
description: >
  A comprehensive guide to the simplelinear_regression() function.
output: html_vignette
vignette: >
  %\VignetteIndexEntry{introduction}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
```

```{r setup}
knitr::opts_chunk$set(echo = TRUE)
```
# Introduction to simplelinear_regression()

This vignette provides an overview of the `simplelinear_regression()` function, which is a part of the `mypackage` package. The function is designed to perform simple linear regression with a single predictor and response variable. It is useful for basic statistical analysis and provides key insights into model fit.

## Key Features of `simplelinear_regression()`

The `simplelinear_regression()` function offers the following features:
1. **Model Fitting**: Computes the slope and intercept of the linear regression model.
2. **Residual Analysis**: Provides residuals for diagnostic purposes.
3. **Statistical Tests**: Calculates t-test and F-test statistics for model significance.
4. **Goodness-of-Fit Metrics**: Returns R-squared and adjusted R-squared values.

### Function Inputs
The function takes two primary arguments:
- `x`: A numeric vector representing the predictor variable.
- `y`: A numeric vector representing the response variable.

### Function Outputs
The function returns a list containing:
- `intercept`: The intercept of the fitted regression line.
- `slope`: The slope of the fitted regression line.
- `r2`: R-squared value, indicating the proportion of variance explained by the model.
- `adj_r2`: Adjusted R-squared value, accounting for the number of predictors.
- `t_value`, `p_value`: T-test statistics and p-value for the slope.
- `f_stat`, `f_p_value`: F-statistics and p-value for the model.
- `residuals`: The residuals from the fitted regression model.

---
## Installing the Package

The package can be installed and loaded using the following commands:
```{r}
library(devtools)
install_github("nxdlll/hw3")

library(hw3)
```

##Example Usage
Below is an example of how to use simplelinear_regression() on a toy dataset.

Load the Data
```{r}
# Simulate some data
x <- c(1, 2, 3, 4, 5)
y <- c(2.2, 2.8, 4.5, 3.7, 5.5)
```
Fit the Model
```{r}
model <- simplelinear_regression(x, y)
```

Inspect the Results
```{r}
print(model)
```

Visualize the Model
```{r}
plot(model, x, y)
```


