# This file demonstrates fundamental concepts covered in the Basics of Data Statistical computing and reporting:
# - Data types (numbers, strings, booleans)
# - Operators (arithmetic, comparison, logical)
# - Variables and naming
# - Vectors
# - Vector operations
# - Functions on vectors

cat("============================================================\n")
cat("BASIC ARITHMETIC OPERATIONS\n")
cat("============================================================\n")

# Arithmetic operations
7+5
7-5
7*5
7^5  # Power operator in R
7/5
7 %% 5  # Modulo operator
7 %/% 5  # Integer division

cat("\n============================================================\n")
cat("COMPARISON OPERATORS\n")
cat("============================================================\n")

# Comparison operators
7 > 5
7 < 5
7 >= 7
7 <= 5
7 == 5
7 != 5

cat("\n============================================================\n")
cat("BOOLEAN OPERATORS\n")
cat("============================================================\n")

# Boolean operators
(5 > 7) & (6*7 == 42)
(5 > 7) | (6*7 == 42)

# Variables and Data Types
cat("\n============================================================\n")
cat("VARIABLES AND TYPE CHECKING\n")
cat("============================================================\n")

# Variables
approx.pi <- 22/7
diameter.in.cubits <- 10
circumference.in.cubits <- approx.pi * diameter.in.cubits

cat("Approximation of π:", approx.pi, "\n")
cat("Diameter:", diameter.in.cubits, "cubits\n")
cat("Circumference:", circumference.in.cubits, "cubits\n")

# Type checking
typeof(7)
is.numeric(7)
is.character(7)

# String types
is.character("7")
is.character("seven")
is.na("seven")

# Type conversion
as.character(5/6)
as.numeric(as.character(5/6))
6*as.numeric(as.character(5/6))

# Vectors
cat("\n============================================================\n")
cat("WORKING WITH VECTORS\n")
cat("============================================================\n")

# Creating vectors
x <- c(7, 8, 10, 45)
x
is.vector(x)

# Accessing elements (R uses 1-based indexing)
x[1]  # First element
x[4]  # Fourth element
x[-4]  # All but fourth element

# Empty vector
weekly.hours <- vector(length=5)
weekly.hours[5] <- 8
weekly.hours

# Vector Arithmetic
cat("\n============================================================\n")
cat("VECTOR ARITHMETIC\n")
cat("============================================================\n")

y <- c(-7, -8, -10, -45)
x+y
x*y

# Recycling
x + c(-7,-8)
x^c(1,0,-1,0.5)

# Single number recycling
2*x

# Vector Comparisons
cat("\n============================================================\n")
cat("VECTOR COMPARISONS\n")
cat("============================================================\n")

x > 9
(x > 9) & (x < 20)

# Boolean indexing
x[x>9]
y[x>9]

# which() function
places <- which(x > 9)
places
y[places]

# Named Components
cat("\n============================================================\n")
cat("NAMED COMPONENTS\n")
cat("============================================================\n")

# Assigning names
names(x) <- c("v1","v2","v3","fred")
names(x)
x[c("fred","v1")]

# Names as vectors
names(y) <- names(x)
sort(names(x))
which(names(x)=="fred")

# Functions on Vectors
cat("\n============================================================\n")
cat("FUNCTIONS ON VECTORS\n")
cat("============================================================\n")

data <- c(7, 8, 10, 45, 3, 12, 18)
mean(data)
median(data)
sd(data)
var(data)
max(data)
min(data)
length(data)
sum(data)
sort(data)

# Summary statistics
summary(data)

# any() and all()
any(data > 40)
all(data > 0)

# Vector Comparison
cat("\n============================================================\n")
cat("VECTOR COMPARISON\n")
cat("============================================================\n")

# Element-wise comparison
x == -y

# Whole vector comparison
identical(x,-y)

# Floating point comparison
identical(c(0.5-0.3,0.3-0.1),c(0.3-0.1,0.5-0.3))
all.equal(c(0.5-0.3,0.3-0.1),c(0.3-0.1,0.5-0.3))

# Floating Point Precision
cat("\n============================================================\n")
cat("FLOATING POINT PRECISION\n")
cat("============================================================\n")

0.45 == 3*0.15
0.45 - 3*0.15

# Better comparison
all.equal(0.45, 3*0.15)

# Another example
(0.5 - 0.3) == (0.3 - 0.1)
all.equal(0.5-0.3, 0.3-0.1)

# Integer vs Numeric
cat("\n============================================================\n")
cat("INTEGER VS NUMERIC\n")
cat("============================================================\n")

is.integer(7)  # FALSE - it's numeric (double)
as.integer(7)  # Create an integer
round(7) == 7  # Test for whole number

cat("\n============================================================\n")
cat("SUMMARY\n")
cat("============================================================\n")
cat("- R vectors are fundamental data structures\n")
cat("- R uses 1-based indexing\n")
cat("- Vectorized operations are efficient in R\n")
cat("- Use identical() or all.equal() for comparisons\n")
cat("- Avoid magic constants, use named variables\n")
cat("============================================================\n")
