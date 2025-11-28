"""
This file demonstrates concepts covered in the Arrays and Data Frames Statistical Computing:
- Arrays and matrices
- Multi-dimensional data structures
- Array operations and functions
- Data frames (using DataFrames.jl)
- Data manipulation and analysis
"""

using LinearAlgebra
using Statistics
using DataFrames
using Random

# Arrays 
println("="^60)
println("ARRAYS AND MATRICES")
println("="^60)

# Creating a 2x2 matrix from a vector
x = [7, 8, 10, 45]
x_arr = reshape(x, 2, 2)  # Julia uses column-major order by default (like R)

println("Original vector: $(x)")
println("2x2 matrix:\n$(x_arr)")
println("Size: $(size(x_arr))")
println("Is array: $(x_arr isa Array)")
println("Dimensions: $(ndims(x_arr))")
println("Element type: $(eltype(x_arr))")

# Array Properties
println("\n" * "="^60)
println("ARRAY PROPERTIES")
println("="^60)

println("Size (rows, columns): $(size(x_arr))")
println("Number of elements: $(length(x_arr))")
println("Element type: $(eltype(x_arr))")

# Structure information
println("\nArray structure:")
println("  Type: $(typeof(x_arr))")
println("  Size: $(size(x_arr))")
println("  Element type: $(eltype(x_arr))")

# Accessing Array Elements
println("\n" * "="^60)
println("ACCESSING ARRAY ELEMENTS")
println("="^60)

# Access by indices (Julia uses 1-based indexing)
println("Element at [1,2]: $(x_arr[1, 2])")
println("Linear indexing [3]: $(x_arr[3])")  # Column-major order

# Slicing
println("All rows, column 2: $(x_arr[:, 2])")
println("Rows 1-2, column 2: $(x_arr[1:2, 2])")

# Boolean Indexing
println("\n" * "="^60)
println("BOOLEAN INDEXING")
println("="^60)

mask = x_arr .> 9
println("Elements > 9: $(x_arr[mask])")
println("Positions where > 9: $(findall(x_arr .> 9))")

# Array Operations
println("\n" * "="^60)
println("ARRAY OPERATIONS")
println("="^60)

y = -x
y_arr = reshape(y, 2, 2)

println("x_arr:\n$(x_arr)")
println("y_arr:\n$(y_arr)")
println("x_arr + y_arr:\n$(x_arr .+ y_arr)")

# Row and column operations
println("\nRow sums: $(sum(x_arr, dims=2))")
println("Column sums: $(sum(x_arr, dims=1))")
println("Row means: $(mean(x_arr, dims=2))")
println("Column means: $(mean(x_arr, dims=1))")

# Data Frames
println("\n" * "="^60)
println("DATA FRAMES")
println("="^60)

# Creating a DataFrame
df = DataFrame(
    Name = ["Alice", "Bob", "Charlie", "David"],
    Age = [25, 30, 35, 40],
    Income = [50000, 60000, 75000, 90000],
    City = ["New York", "Boston", "Chicago", "Seattle"]
)

println("DataFrame:")
println(df)

println("\n" * "="^60)
println("DATA FRAME PROPERTIES")
println("="^60)

println("Size: $(size(df))")
println("Columns: $(names(df))")
println("Data types:\n$(describe(df))")
println("\nFirst 2 rows:")
println(first(df, 2))

# Accessing DataFrame Elements
println("\n" * "="^60)
println("ACCESSING DATA FRAME ELEMENTS")
println("="^60)

# Access column
println("Income column:")
println(df.Income)

# Access multiple columns
println("\nName and Income:")
println(df[:, [:Name, :Income]])

# Access rows by index
println("\nFirst row:")
println(df[1, :])

# Access by condition
high_income = df[df.Income .> 60000, :]
println("\nHigh income individuals:")
println(high_income)

# Data Frame Operations
println("\n" * "="^60)
println("DATA FRAME OPERATIONS")
println("="^60)

# Add new column
df.Tax = df.Income .* 0.25
println("DataFrame with Tax column:")
println(df)

# Aggregate operations
println("\nAverage income: \$$(round(mean(df.Income), digits=2))")
println("Total income: \$$(sum(df.Income))")
println("Income by city:")
by_city = combine(groupby(df, :City), :Income => mean)
println(by_city)

# Example: Pennsylvania Housing Data (Simulated)
println("\n" * "="^60)
println("EXAMPLE: HOUSING DATA ANALYSIS")
println("="^60)

# Create simulated housing data
Random.seed!(42)
n_houses = 100

housing_data = DataFrame(
    Median_household_income = rand(30000:100000, n_houses),
    Median_house_value = rand(100000:400000, n_houses),
    Population = rand(1000:50000, n_houses)
)

println("Housing data summary:")
println(describe(housing_data))

# Simple linear regression
using GLM

model = lm(@formula(Median_house_value ~ Median_household_income), housing_data)

println("\nLinear Regression Results:")
println(model)

# Predict values
income_example = 50000
predicted_value = predict(model, DataFrame(Median_household_income = [income_example]))[1]
println("\nPredicted house value for \$$(income_example) income: \$$(round(predicted_value, digits=2))")

# Matrix Operations
println("\n" * "="^60)
println("MATRIX OPERATIONS")
println("="^60)

A = [1 2; 3 4]
B = [5 6; 7 8]

println("Matrix A:\n$(A)")
println("Matrix B:\n$(B)")
println("A + B:\n$(A .+ B)")
println("A .* B (element-wise):\n$(A .* B)")
println("A * B (matrix multiplication):\n$(A * B)")
println("Transpose of A:\n$(A')")

# Array Functions
println("\n" * "="^60)
println("USEFUL ARRAY FUNCTIONS")
println("="^60)

arr = [3, 7, 1, 9, 2, 8]
println("Array: $(arr)")
println("Min: $(minimum(arr))")
println("Max: $(maximum(arr))")
println("Mean: $(round(mean(arr), digits=2))")
println("Median: $(round(median(arr), digits=2))")
println("Std dev: $(round(std(arr), digits=2))")
println("Sorted: $(sort(arr))")
println("Arg max (index of max): $(argmax(arr))")

println("\n" * "="^60)
println("SUMMARY")
println("="^60)
println("- Julia arrays are similar to R matrices and numpy arrays")
println("- DataFrames.jl provides R-like data frame functionality")
println("- Julia uses 1-based indexing (like R)")
println("- Broadcasting with . enables element-wise operations")
println("- Powerful data manipulation capabilities")
println("="^60)
