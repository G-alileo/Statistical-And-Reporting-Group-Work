import numpy as np

# Define the cube function
def cube(x):
    return np.power(x, 3)

# cube(1:10)
print(cube(np.arange(1, 11)))
# Output: [   1    8   27   64  125  216  343  512  729 1000]

# cube(matrix(1:8, 2, 4))
m = np.arange(1, 9).reshape(2, 4, order='F')  # 'F' means fill column-wise like R
print(cube(m))
# Output:
# [[  1  27 125 343]
#  [  8  64 216 512]]

# matrix(cube(1:8), 2, 4)
m2 = np.array(cube(np.arange(1, 9))).reshape(2, 4, order='F')
print(m2)
# Output same as above

# cube(array(1:24, c(2, 3, 4)))
a = np.arange(1, 25).reshape(2, 3, 4, order='F')
print(cube(a))  # cubes each element in the 3D array

# mode(cube)
print(type(cube))  # <class 'function'>

# Robust Loss functions
import numpy as np

def psi1(x):
    x = np.asarray(x)
    return np.where(x**2 > 1, 2 * np.abs(x) - 1, x**2)

def psi2(x, c=1):
    x = np.asarray(x)
    return np.where(x**2 > c**2, 2 * c * np.abs(x) - c**2, x**2)

def psi3(x, c=1):
    if not np.isscalar(c) or c <= 0:
        raise ValueError("c must be a single positive number")
    x = np.asarray(x)
    return np.where(x**2 > c**2, 2 * c * np.abs(x) - c**2, x**2)

# function scoping and constants
x = 7
y = ["A", "C", "G", "T", "U"]

def adder(y):
    global x   # This will cause UnboundLocalError in Python (if global declaration is ignored))
    x = x + y  
    return x

# Circle Area function
def circle_area(r):
    """
    Calculate the area of a circle given radius r.
    Supports scalar or iterable inputs.
    """
    r = np.array(r)
    return np.pi * r**2

print(circle_area([1, 2, 3]))  # Output: [3.14, 12.57, 28.27]

# Recursive Fibonacci function
def fib(n):
    """
    Recursive Fibonacci function.
    Returns 1 for n=0 or n=1, else fib(n-1) + fib(n-2).
    """
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

# Predict from a fitted model
def predict_plm(model, newdata):
    """
    Predict response values from a power-law scaling model.
    model: dict with keys 'a' and 'y0'
    newdata: numeric or array of values to predict on
    """
    assert 'a' in model and 'y0' in model, "Model must contain 'a' and 'y0'"
    a, y0 = model['a'], model['y0']
    assert isinstance(a, (int, float)), "a must be numeric"
    assert isinstance(y0, (int, float)), "y0 must be numeric"
    newdata = np.array(newdata)
    return y0 * newdata**a


