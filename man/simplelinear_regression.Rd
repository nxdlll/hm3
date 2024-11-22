% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simplelinear_regression.R
\name{simplelinear_regression}
\alias{simplelinear_regression}
\title{Simple Linear Regression Model}
\usage{
simplelinear_regression(x, y)
}
\arguments{
\item{x}{A numeric vector representing the predictor variable.}

\item{y}{A numeric vector representing the response variable.}
}
\value{
A list with the following components:
\item{intercept}{The intercept of the regression model.}
\item{slope}{The slope of the regression model.}
\item{r2}{The R-squared value, indicating the proportion of variance explained by the model.}
\item{adj_r2}{The adjusted R-squared value, accounting for the number of predictors.}
\item{t_value}{The t-statistic for the slope.}
\item{p_value}{The p-value for the t-test on the slope.}
\item{f_stat}{The F-statistic for the model.}
\item{f_p_value}{The p-value for the F-test on the model.}
\item{residuals}{The residuals of the model.}
}
\description{
`simplelinear_regression()` fits a linear regression model given a single numerical response variable and one numerical predictor variable.
It calculates the intercept and slope of the regression line, performs statistical testing on the slope (t-test and F-test), calculates R-squared and adjusted R-squared values, and outputs residuals.
}
\examples{
x <- c(1, 2, 3, 4, 5)
y <- c(2.2, 2.8, 4.5, 3.7, 5.5)
model <- simplelinear_regression(x, y)
print(model)
plot(model, x, y)
}
