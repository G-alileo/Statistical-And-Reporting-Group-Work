"""
This file demonstrates fundamental concepts covered in the Basics of Data Statistical Computing:
- Data types (numbers, strings, booleans)
- Operators (arithmetic, comparison, logical)
- Variables and naming
- Vectors (lists in Python)
- Vector operations
- Functions on vectors
"""

# Data Types and Operators
print("=" * 60)
print("BASIC ARITHMETIC OPERATIONS")
print("=" * 60)

# Arithmetic operations
print(f"7 + 5 = {7 + 5}")
print(f"7 - 5 = {7 - 5}")
print(f"7 * 5 = {7 * 5}")
print(f"7 ** 5 = {7 ** 5}")  # Power operator
print(f"7 / 5 = {7 / 5}")
print(f"7 % 5 = {7 % 5}")  # Modulo operator
print(f"7 // 5 = {7 // 5}")  # Integer division

print("\n" + "=" * 60)
print("COMPARISON OPERATORS")
print("=" * 60)

# Comparison operators
print(f"7 > 5: {7 > 5}")
print(f"7 < 5: {7 < 5}")
print(f"7 >= 7: {7 >= 7}")
print(f"7 <= 5: {7 <= 5}")
print(f"7 == 5: {7 == 5}")
print(f"7 != 5: {7 != 5}")

print("\n" + "=" * 60)
print("BOOLEAN OPERATORS")
print("=" * 60)

# Boolean operators
print(f"(5 > 7) and (6*7 == 42): {(5 > 7) and (6*7 == 42)}")
print(f"(5 > 7) or (6*7 == 42): {(5 > 7) or (6*7 == 42)}")

# Variables and Data Types
print("\n" + "=" * 60)
print("VARIABLES AND TYPE CHECKING")
print("=" * 60)

# Variables
approx_pi = 22/7
diameter_in_cubits = 10
circumference = approx_pi * diameter_in_cubits

print(f"Approximation of π: {approx_pi}")
print(f"Diameter: {diameter_in_cubits} cubits")
print(f"Circumference: {circumference:.2f} cubits")

# Type checking
x = 7
print(f"\nType of 7: {type(7)}")
print(f"Is numeric: {isinstance(7, (int, float))}")
print(f"Is string: {isinstance(7, str)}")

# String types
print(f"\nIs '7' a string? {isinstance('7', str)}")
print(f"Is 'seven' a string? {isinstance('seven', str)}")

# Type conversion
print(f"\nConvert 5/6 to string: {str(5/6)}")
print(f"Convert back to number: {float(str(5/6))}")


# Vectors (Lists in Python)
print("\n" + "=" * 60)
print("WORKING WITH VECTORS (LISTS)")
print("=" * 60)

# Creating vectors
x = [7, 8, 10, 45]
print(f"Vector x: {x}")
print(f"Length: {len(x)}")
print(f"First element x[0]: {x[0]}")
print(f"Fourth element x[3]: {x[3]}")

# Vector slicing
print(f"All but last element: {x[:-1]}")
print(f"Elements 0-2: {x[0:3]}")


# Vector Arithmetic
print("\n" + "=" * 60)
print("VECTOR ARITHMETIC")
print("=" * 60)

# Element-wise operations using list comprehension
import numpy as np  # Using numpy for easier vector operations

x = np.array([7, 8, 10, 45])
y = np.array([-7, -8, -10, -45])

print(f"x: {x}")
print(f"y: {y}")
print(f"x + y: {x + y}")
print(f"x * y: {x * y}")

# Recycling (broadcasting in numpy)
print(f"x + [-7, -8]: {x + np.array([-7, -8, -7, -8])[:len(x)]}")
print(f"2 * x: {2 * x}")


# Vector Comparisons
print("\n" + "=" * 60)
print("VECTOR COMPARISONS")
print("=" * 60)

print(f"x > 9: {x > 9}")
print(f"(x > 9) & (x < 20): {(x > 9) & (x < 20)}")

# Boolean indexing
greater_than_9 = x[x > 9]
print(f"Elements greater than 9: {greater_than_9}")


# Functions on Vectors
print("\n" + "=" * 60)
print("FUNCTIONS ON VECTORS")
print("=" * 60)

data = [7, 8, 10, 45, 3, 12, 18]
print(f"Data: {data}")
print(f"Mean: {np.mean(data):.2f}")
print(f"Median: {np.median(data):.2f}")
print(f"Standard deviation: {np.std(data):.2f}")
print(f"Variance: {np.var(data):.2f}")
print(f"Maximum: {np.max(data)}")
print(f"Minimum: {np.min(data)}")
print(f"Sum: {np.sum(data)}")
print(f"Sorted: {sorted(data)}")


# Named Elements (Dictionaries)
print("\n" + "=" * 60)
print("NAMED ELEMENTS (DICTIONARY)")
print("=" * 60)

# Using dictionaries for named elements
named_values = {
    'v1': 7,
    'v2': 8,
    'v3': 10,
    'fred': 45
}

print(f"Named values: {named_values}")
print(f"Access 'fred': {named_values['fred']}")
print(f"Access 'v1': {named_values['v1']}")


# Floating Point Precision
print("\n" + "=" * 60)
print("FLOATING POINT PRECISION")
print("=" * 60)

print(f"0.45 == 3*0.15: {0.45 == 3*0.15}")
print(f"0.45 - 3*0.15: {0.45 - 3*0.15}")

# Better comparison
import math
print(f"Close to equal (math.isclose): {math.isclose(0.45, 3*0.15)}")

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print("- Python uses similar concepts to R but with different syntax")
print("- Lists are Python's basic vector-like structure")
print("- NumPy arrays provide more R-like vector operations")
print("- Python uses 0-based indexing (R uses 1-based)")
print("- Type checking and conversion work similarly")
print("=" * 60)
