## Finding the minimum of a function (univariate search)
from scipy.optimize import minimize_scalar

# Define the function
def f(x):
    # This is a simple quadratic function
    return (x - 3)**2 + 2

# Use a scalar minimization over a bounded interval (-10, 10)
result = minimize_scalar(f, bounds=(-10, 10), method='bounded')

# Display the result
print(f"Minimum value of f(x): {result.fun}")
print(f"At x = {result.x}")

## Numerical Derivative using numDeriv
import numpy as np

# Define the function
def f(x):
    return x**2 + 2*x + 1

# Compute numerical derivative (gradient) manually
def grad(f, x, h=1e-6):
    # Central difference approximation
    return (f(x + h) - f(x - h)) / (2 * h)

# Evaluate derivative at x = 3
gradient_at_3 = grad(f, 3)
print(f"Gradient at x=3: {gradient_at_3}")

## Multivariate Optimization Example
from scipy.optimize import minimize

# Define a function of two variables
def f(x):
    # x is an array [x1, x2]
    return (x[0] - 1)**2 + (x[1] - 2)**2

# Initial guess
x0 = [0, 0]

# Run optimization
result = minimize(f, x0)

# Display results
print(f"Minimum value: {result.fun}")
print(f"Optimal point: {result.x}")

## Optimization with gradient information
import numpy as np
from scipy.optimize import minimize

# Define objective function
def f(x):
    return (x[0] - 1)**2 + (x[1] - 2)**2

# Define gradient function
def grad(x):
    # Analytical gradient (partial derivatives)
    return np.array([2*(x[0]-1), 2*(x[1]-2)])

# Initial guess
x0 = np.array([0, 0])

# Use BFGS algorithm with gradient
result = minimize(f, x0, method='BFGS', jac=grad)

print(f"Minimum value: {result.fun}")
print(f"Optimal point: {result.x}")

## Constrained optimazation
from scipy.optimize import minimize

# Objective function
def f(x):
    return (x - 3)**2 + 2

# Initial guess
x0 = [0]

# Bounds for x
bounds = [(0, 5)]

# Minimize using L-BFGS-B (handles box constraints)
result = minimize(f, x0, method='L-BFGS-B', bounds=bounds)

print(f"Minimum value: {result.fun}")
print(f"At x = {result.x}")

## Non-linear Function Example
import numpy as np
from scipy.optimize import minimize_scalar

# Define nonlinear function
def f(x):
    return np.sin(x) + 0.1 * x

# Minimize over interval (-10, 10)
result = minimize_scalar(f, bounds=(-10, 10), method='bounded')

print(f"Minimum value: {result.fun}")
print(f"At x = {result.x}")
