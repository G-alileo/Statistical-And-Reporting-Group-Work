## Finding the minimum of a function (univariate search)

# Define the function
f <- function(x) {
  # This is a simple quadratic function
  return((x - 3)^2 + 2)
}

# Use optimize() for univariate optimization
result <- optimize(f, interval=c(-10, 10))

# Display the result
cat(sprintf("Minimum value of f(x): %.6f\n", result$objective))
cat(sprintf("At x = %.6f\n", result$minimum))

## Numerical Derivative using numDeriv

# Define the function
f <- function(x) {
  return(x^2 + 2*x + 1)
}

# Compute numerical derivative (gradient) manually
grad <- function(f, x, h=1e-6) {
  # Central difference approximation
  return((f(x + h) - f(x - h)) / (2 * h))
}

# Evaluate derivative at x = 3
gradient_at_3 <- grad(f, 3)
cat(sprintf("Gradient at x=3: %.6f\n", gradient_at_3))

## Multivariate Optimization Example

# Define a function of two variables
f <- function(x) {
  # x is a vector c(x1, x2)
  return((x[1] - 1)^2 + (x[2] - 2)^2)
}

# Initial guess
x0 <- c(0, 0)

# Run optimization using optim()
result <- optim(x0, f)

# Display results
cat(sprintf("Minimum value: %.6f\n", result$value))
cat(sprintf("Optimal point: [%.6f, %.6f]\n", result$par[1], result$par[2]))

## Optimization with gradient information

# Define objective function
f <- function(x) {
  return((x[1] - 1)^2 + (x[2] - 2)^2)
}

# Define gradient function
grad <- function(x) {
  # Analytical gradient (partial derivatives)
  return(c(2*(x[1]-1), 2*(x[2]-2)))
}

# Initial guess
x0 <- c(0, 0)

# Use BFGS algorithm with gradient
result <- optim(x0, f, gr=grad, method='BFGS')

cat(sprintf("Minimum value: %.6f\n", result$value))
cat(sprintf("Optimal point: [%.6f, %.6f]\n", result$par[1], result$par[2]))

## Constrained optimization

# Objective function
f <- function(x) {
  return((x - 3)^2 + 2)
}

# Initial guess
x0 <- 0

# Use optimize with bounds or optim with L-BFGS-B
# Method 1: Using optimize (for univariate)
result <- optimize(f, interval=c(0, 5))

cat(sprintf("Minimum value: %.6f\n", result$objective))
cat(sprintf("At x = %.6f\n", result$minimum))

# Method 2: Using optim with L-BFGS-B (for consistency with multivariate case)
result2 <- optim(x0, f, method='L-BFGS-B', lower=0, upper=5)
cat(sprintf("(Alternative) Minimum value: %.6f\n", result2$value))
cat(sprintf("(Alternative) At x = %.6f\n", result2$par))

## Non-linear Function Example

# Define nonlinear function
f <- function(x) {
  return(sin(x) + 0.1 * x)
}

# Minimize over interval (-10, 10)
result <- optimize(f, interval=c(-10, 10))

cat(sprintf("Minimum value: %.6f\n", result$objective))
cat(sprintf("At x = %.6f\n", result$minimum))