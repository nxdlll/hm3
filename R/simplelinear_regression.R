#' Simple Linear Regression Model
#'
#' `simplelinear_regression()` fits a linear regression model given a single numerical response variable and one numerical predictor variable.
#' It calculates the intercept and slope of the regression line, performs statistical testing on the slope (t-test and F-test), calculates R-squared and adjusted R-squared values, and outputs residuals.
#'
#' @param x A numeric vector representing the predictor variable.
#' @param y A numeric vector representing the response variable.
#'
#' @return A list with the following components:
#' \item{intercept}{The intercept of the regression model.}
#' \item{slope}{The slope of the regression model.}
#' \item{r2}{The R-squared value, indicating the proportion of variance explained by the model.}
#' \item{adj_r2}{The adjusted R-squared value, accounting for the number of predictors.}
#' \item{t_value}{The t-statistic for the slope.}
#' \item{p_value}{The p-value for the t-test on the slope.}
#' \item{f_stat}{The F-statistic for the model.}
#' \item{f_p_value}{The p-value for the F-test on the model.}
#' \item{residuals}{The residuals of the model.}
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4, 5)
#' y <- c(2.2, 2.8, 4.5, 3.7, 5.5)
#' model <- simplelinear_regression(x, y)
#' print(model)
#' plot(model, x, y)
simplelinear_regression <- function(x, y) {
  if (length(x) != length(y)) {
    stop("x and y must have the same length")
  }

  n <- length(x)
  x_mean <- mean(x)
  y_mean <- mean(y)

  # slope and intercept
  slope <- sum((x - x_mean) * (y - y_mean)) / sum((x - x_mean)^2)
  intercept <- y_mean - slope * x_mean

  # Predicted values
  y_pred <- intercept + slope * x

  # Residuals
  residuals <- y - y_pred

  # R-squared
  sst <- sum((y - y_mean)^2)
  sse <- sum(residuals^2)
  r2 <- 1 - (sse / sst)
  adj_r2 <- 1 - ((1 - r2) * (n - 1) / (n - 2))

  # statistical tests
  t_value <- slope / sqrt(sum(residuals^2) / ((n - 2) * sum((x - x_mean)^2)))
  p_value <- 2 * (1 - pt(abs(t_value), df = n - 2))
  f_stat <- (sst - sse) / (sse / (n - 2))
  f_p_value <- pf(f_stat, 1, n - 2, lower.tail = FALSE)

  results <- list(
    intercept = intercept,
    slope = slope,
    r2 = r2,
    adj_r2 = adj_r2,
    t_value = t_value,
    p_value = p_value,
    f_stat = f_stat,
    f_p_value = f_p_value,
    residuals = residuals
  )

  class(results) <- "linear_regression"
  return(results)
}

# Printing Results
print.linear_regression <- function(model) {
  cat("Simple Linear Regression Model:\n")
  cat(sprintf("Intercept: %.3f\n", model$intercept))
  cat(sprintf("Slope: %.3f\n", model$slope))
  cat(sprintf("R-squared: %.3f\n", model$r2))
  cat(sprintf("Adjusted R-squared: %.3f\n", model$adj_r2))
  cat(sprintf("T-test p-value: %.3f\n", model$p_value))
  cat(sprintf("F-test p-value: %.3f\n", model$f_p_value))
}

# Plotting
plot.linear_regression <- function(model, x, y) {
  plot(x, y, main = "Simple Linear Regression", xlab = "X", ylab = "Y", pch = 16)
  abline(a = model$intercept, b = model$slope, col = "blue", lwd = 2)
  legend("topright", legend = sprintf("y = %.2f + %.2fx", model$intercept, model$slope), col = "blue", lwd = 2)
}
