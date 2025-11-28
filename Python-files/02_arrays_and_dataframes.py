"""
This file demonstrates concepts covered in the Arrays and Data Frames Statistical Computing:
- Arrays and matrices (using NumPy)
- Multi-dimensional data structures
- Array operations and functions
- Data frames (using Pandas)
- Data manipulation and analysis
"""

import numpy as np
import pandas as pd

# Arrays 
print("=" * 60)
print("ARRAYS AND MATRICES")
print("=" * 60)

# Creating a 2x2 matrix from a vector
x = np.array([7, 8, 10, 45])
x_arr = x.reshape(2, 2, order='F')  # 'F' for Fortran/column-major order (like R)

print(f"Original vector: {x}")
print(f"2x2 matrix:\n{x_arr}")
print(f"Shape: {x_arr.shape}")
print(f"Is array: {isinstance(x_arr, np.ndarray)}")
print(f"Dimensions: {x_arr.ndim}")
print(f"Data type: {x_arr.dtype}")

# Array Properties
print("\n" + "=" * 60)
print("ARRAY PROPERTIES")
print("=" * 60)

print(f"Shape (rows, columns): {x_arr.shape}")
print(f"Number of elements: {x_arr.size}")
print(f"Data type: {x_arr.dtype}")

# Structure information
print(f"\nArray structure:")
print(f"  Type: {type(x_arr)}")
print(f"  Shape: {x_arr.shape}")
print(f"  Dtype: {x_arr.dtype}")

# Accessing Array Elements
print("\n" + "=" * 60)
print("ACCESSING ARRAY ELEMENTS")
print("=" * 60)

# Access by indices (Python uses 0-based indexing)
print(f"Element at [0,1]: {x_arr[0, 1]}")
print(f"Linear indexing [2]: {x_arr.ravel(order='F')[2]}")  # Column-major order

# Slicing
print(f"All rows, column 1: {x_arr[:, 1]}")
print(f"Rows 0-1, column 1: {x_arr[0:2, 1]}")

# Boolean Indexing
print("\n" + "=" * 60)
print("BOOLEAN INDEXING")
print("=" * 60)

mask = x_arr > 9
print(f"Elements > 9: {x_arr[mask]}")
print(f"Positions where > 9: {np.where(x_arr > 9)}")

# Array Operations
print("\n" + "=" * 60)
print("ARRAY OPERATIONS")
print("=" * 60)

y = -x
y_arr = y.reshape(2, 2, order='F')

print(f"x_arr:\n{x_arr}")
print(f"y_arr:\n{y_arr}")
print(f"x_arr + y_arr:\n{x_arr + y_arr}")

# Row and column operations
print(f"\nRow sums: {x_arr.sum(axis=1)}")
print(f"Column sums: {x_arr.sum(axis=0)}")
print(f"Row means: {x_arr.mean(axis=1)}")
print(f"Column means: {x_arr.mean(axis=0)}")

# Data Frames
print("\n" + "=" * 60)
print("DATA FRAMES (PANDAS)")
print("=" * 60)

# Creating a DataFrame from dictionary
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David'],
    'Age': [25, 30, 35, 40],
    'Income': [50000, 60000, 75000, 90000],
    'City': ['New York', 'Boston', 'Chicago', 'Seattle']
}

df = pd.DataFrame(data)
print("DataFrame:")
print(df)

print("\n" + "=" * 60)
print("DATA FRAME PROPERTIES")
print("=" * 60)

print(f"Shape: {df.shape}")
print(f"Columns: {list(df.columns)}")
print(f"Data types:\n{df.dtypes}")
print(f"\nFirst 2 rows:\n{df.head(2)}")
print(f"\nSummary statistics:\n{df.describe()}")

# Accessing DataFrame Elements
print("\n" + "=" * 60)
print("ACCESSING DATA FRAME ELEMENTS")
print("=" * 60)

# Access column
print(f"Income column:\n{df['Income']}")

# Access multiple columns
print(f"\nName and Income:\n{df[['Name', 'Income']]}")

# Access rows by index
print(f"\nFirst row:\n{df.iloc[0]}")

# Access by condition
high_income = df[df['Income'] > 60000]
print(f"\nHigh income individuals:\n{high_income}")

# Data Frame Operations
print("\n" + "=" * 60)
print("DATA FRAME OPERATIONS")
print("=" * 60)

# Add new column
df['Tax'] = df['Income'] * 0.25
print(f"DataFrame with Tax column:\n{df}")

# Aggregate operations
print(f"\nAverage income: ${df['Income'].mean():.2f}")
print(f"Total income: ${df['Income'].sum():.2f}")
print(f"Income by city:\n{df.groupby('City')['Income'].mean()}")

# Example: Pennsylvania Housing Data (Simulated)
print("\n" + "=" * 60)
print("EXAMPLE: HOUSING DATA ANALYSIS")
print("=" * 60)

# Create simulated housing data
np.random.seed(42)
n_houses = 100

housing_data = pd.DataFrame({
    'Median_household_income': np.random.randint(30000, 100000, n_houses),
    'Median_house_value': np.random.randint(100000, 400000, n_houses),
    'Population': np.random.randint(1000, 50000, n_houses)
})

print(f"Housing data summary:\n{housing_data.describe()}")

# Simple linear regression
from scipy import stats

slope, intercept, r_value, p_value, std_err = stats.linregress(
    housing_data['Median_household_income'],
    housing_data['Median_house_value']
)

print(f"\nLinear Regression Results:")
print(f"Intercept: ${intercept:.2f}")
print(f"Slope: {slope:.4f}")
print(f"R-squared: {r_value**2:.4f}")

# Predict values
income_example = 50000
predicted_value = intercept + slope * income_example
print(f"\nPredicted house value for ${income_example} income: ${predicted_value:.2f}")

# Matrix Operations
print("\n" + "=" * 60)
print("MATRIX OPERATIONS")
print("=" * 60)

A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

print(f"Matrix A:\n{A}")
print(f"Matrix B:\n{B}")
print(f"A + B:\n{A + B}")
print(f"A * B (element-wise):\n{A * B}")
print(f"A @ B (matrix multiplication):\n{A @ B}")
print(f"Transpose of A:\n{A.T}")

# Array Functions
print("\n" + "=" * 60)
print("USEFUL ARRAY FUNCTIONS")
print("=" * 60)

arr = np.array([3, 7, 1, 9, 2, 8])
print(f"Array: {arr}")
print(f"Min: {arr.min()}")
print(f"Max: {arr.max()}")
print(f"Mean: {arr.mean():.2f}")
print(f"Median: {np.median(arr):.2f}")
print(f"Std dev: {arr.std():.2f}")
print(f"Sorted: {np.sort(arr)}")
print(f"Arg max (index of max): {arr.argmax()}")

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print("- NumPy arrays are similar to R matrices")
print("- Pandas DataFrames are similar to R data frames")
print("- Python uses 0-based indexing (R uses 1-based)")
print("- Both offer powerful data manipulation capabilities")
print("=" * 60)
