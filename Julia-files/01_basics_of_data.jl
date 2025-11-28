"""
This file demonstrates fundamental concepts covered in the Basics of Data Statistical Computing:
- Data types (numbers, strings, booleans)
- Operators (arithmetic, comparison, logical)
- Variables and naming
- Vectors (arrays in Julia)
- Vector operations
- Functions on vectors
"""

using Statistics

# Data Types and Operators
println("="^60)
println("BASIC ARITHMETIC OPERATIONS")
println("="^60)

# Arithmetic operations
println("7 + 5 = $(7 + 5)")
println("7 - 5 = $(7 - 5)")
println("7 * 5 = $(7 * 5)")
println("7 ^ 5 = $(7 ^ 5)")  # Power operator
println("7 / 5 = $(7 / 5)")
println("7 % 5 = $(7 % 5)")  # Modulo operator
println("7 ÷ 5 = $(7 ÷ 5)")  # Integer division

println("\n" * "="^60)
println("COMPARISON OPERATORS")
println("="^60)

# Comparison operators
println("7 > 5: $(7 > 5)")
println("7 < 5: $(7 < 5)")
println("7 >= 7: $(7 >= 7)")
println("7 <= 5: $(7 <= 5)")
println("7 == 5: $(7 == 5)")
println("7 != 5: $(7 != 5)")

println("\n" * "="^60)
println("BOOLEAN OPERATORS")
println("="^60)

# Boolean operators
println("(5 > 7) && (6*7 == 42): $((5 > 7) && (6*7 == 42))")
println("(5 > 7) || (6*7 == 42): $((5 > 7) || (6*7 == 42))")

# Variables and Data Types
println("\n" * "="^60)
println("VARIABLES AND TYPE CHECKING")
println("="^60)

# Variables
approx_pi = 22/7
diameter_in_cubits = 10
circumference = approx_pi * diameter_in_cubits

println("Approximation of π: $(approx_pi)")
println("Diameter: $(diameter_in_cubits) cubits")
println("Circumference: $(round(circumference, digits=2)) cubits")

# Type checking
x = 7
println("\nType of 7: $(typeof(7))")
println("Is numeric: $(7 isa Number)")
println("Is string: $(7 isa String)")

# String types
println("\nIs '7' a string? $("7" isa String)")
println("Is 'seven' a string? $("seven" isa String)")

# Type conversion
println("\nConvert 5/6 to string: $(string(5/6))")
println("Convert back to number: $(parse(Float64, string(5/6)))")


# Vectors (Arrays in Julia)
println("\n" * "="^60)
println("WORKING WITH VECTORS (ARRAYS)")
println("="^60)

# Creating vectors
x = [7, 8, 10, 45]
println("Vector x: $(x)")
println("Length: $(length(x))")
println("First element x[1]: $(x[1])")  # Julia uses 1-based indexing
println("Fourth element x[4]: $(x[4])")

# Vector slicing
println("All but last element: $(x[1:end-1])")
println("Elements 1-3: $(x[1:3])")


# Vector Arithmetic
println("\n" * "="^60)
println("VECTOR ARITHMETIC")
println("="^60)

# Element-wise operations
x = [7, 8, 10, 45]
y = [-7, -8, -10, -45]

println("x: $(x)")
println("y: $(y)")
println("x + y: $(x .+ y)")  # Broadcasting with .
println("x * y (element-wise): $(x .* y)")

# Broadcasting
println("x + [-7, -8]: $(x .+ [-7, -8, -7, -8][1:length(x)])")
println("2 * x: $(2 .* x)")


# Vector Comparisons
println("\n" * "="^60)
println("VECTOR COMPARISONS")
println("="^60)

println("x .> 9: $(x .> 9)")
println("(x .> 9) .& (x .< 20): $((x .> 9) .& (x .< 20))")

# Boolean indexing
greater_than_9 = x[x .> 9]
println("Elements greater than 9: $(greater_than_9)")


# Functions on Vectors
println("\n" * "="^60)
println("FUNCTIONS ON VECTORS")
println("="^60)

data = [7, 8, 10, 45, 3, 12, 18]
println("Data: $(data)")
println("Mean: $(round(mean(data), digits=2))")
println("Median: $(round(median(data), digits=2))")
println("Standard deviation: $(round(std(data), digits=2))")
println("Variance: $(round(var(data), digits=2))")
println("Maximum: $(maximum(data))")
println("Minimum: $(minimum(data))")
println("Sum: $(sum(data))")
println("Sorted: $(sort(data))")


# Named Elements (Dictionaries)
println("\n" * "="^60)
println("NAMED ELEMENTS (DICTIONARY)")
println("="^60)

# Using dictionaries for named elements
named_values = Dict(
    "v1" => 7,
    "v2" => 8,
    "v3" => 10,
    "fred" => 45
)

println("Named values: $(named_values)")
println("Access 'fred': $(named_values["fred"])")
println("Access 'v1': $(named_values["v1"])")


# Floating Point Precision
println("\n" * "="^60)
println("FLOATING POINT PRECISION")
println("="^60)

println("0.45 == 3*0.15: $(0.45 == 3*0.15)")
println("0.45 - 3*0.15: $(0.45 - 3*0.15)")

# Better comparison
println("Close to equal (isapprox): $(isapprox(0.45, 3*0.15))")

println("\n" * "="^60)
println("SUMMARY")
println("="^60)
println("- Julia uses similar concepts to R and Python")
println("- Arrays are Julia's basic vector structure")
println("- Broadcasting with . enables element-wise operations")
println("- Julia uses 1-based indexing (like R)")
println("- Type checking and conversion work intuitively")
println("="^60)
