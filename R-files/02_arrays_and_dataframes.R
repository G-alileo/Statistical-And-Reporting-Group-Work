# - Arrays and matrices
# - Multi-dimensional data structures
# - Array operations and functions
# - Data frames
# - Data manipulation and analysis


# Arrays (Matrices)
cat(rep("=", 60), "\n", sep = "")
cat("ARRAYS AND MATRICES\n")
cat(rep("=", 60), "\n", sep = "")

# Creating a 2x2 matrix from a vector
x <- c(7, 8, 10, 45)
x.arr <- array(x, c(2, 2))

cat("Original vector:", x, "\n")
cat("2x2 matrix:\n")
print(x.arr)
cat("Is array:", is.array(x.arr), "\n")
cat("Dimensions:", dim(x.arr), "\n")
cat("Type:", typeof(x.arr), "\n")

# Array Properties
cat("\n", rep("=", 60), "\n", sep = "")
cat("ARRAY PROPERTIES\n")
cat(rep("=", 60), "\n", sep = "")

cat("Shape (rows, columns):", dim(x.arr), "\n")
cat("Number of elements:", length(x.arr), "\n")
cat("Data type:", typeof(x.arr), "\n")

# Structure information
cat("\nArray structure:\n")
str(x.arr)

# Accessing Array Elements
cat("\n", rep("=", 60), "\n", sep = "")
cat("ACCESSING ARRAY ELEMENTS\n")
cat(rep("=", 60), "\n", sep = "")

# Access by indices (R uses 1-based indexing)
cat("Element at [1,2]:", x.arr[1, 2], "\n")
cat("Linear indexing [3]:", x.arr[3], "\n")  # Column-major order by default

# Slicing
cat("All rows, column 2:", x.arr[, 2], "\n")
cat("Rows 1-2, column 2:", x.arr[1:2, 2], "\n")

# Boolean Indexing
cat("\n", rep("=", 60), "\n", sep = "")
cat("BOOLEAN INDEXING\n")
cat(rep("=", 60), "\n", sep = "")

mask <- x.arr > 9
cat("Elements > 9:", x.arr[mask], "\n")
cat("Positions where > 9:\n")
print(which(x.arr > 9, arr.ind = TRUE))


# Array Operations
cat("\n", rep("=", 60), "\n", sep = "")
cat("ARRAY OPERATIONS\n")
cat(rep("=", 60), "\n", sep = "")

y <- -x
y.arr <- array(y, c(2, 2))

cat("x.arr:\n")
print(x.arr)
cat("y.arr:\n")
print(y.arr)
cat("x.arr + y.arr:\n")
print(x.arr + y.arr)

# Row and column operations
cat("\nRow sums:", rowSums(x.arr), "\n")
cat("Column sums:", colSums(x.arr), "\n")
cat("Row means:", rowMeans(x.arr), "\n")
cat("Column means:", colMeans(x.arr), "\n")

# Data Frames
cat("\n", rep("=", 60), "\n", sep = "")
cat("DATA FRAMES\n")
cat(rep("=", 60), "\n", sep = "")

# Creating a data frame
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, 30, 35, 40),
  Income = c(50000, 60000, 75000, 90000),
  City = c("New York", "Boston", "Chicago", "Seattle"),
  stringsAsFactors = FALSE
)

cat("DataFrame:\n")
print(df)

cat("\n", rep("=", 60), "\n", sep = "")
cat("DATA FRAME PROPERTIES\n")
cat(rep("=", 60), "\n", sep = "")

cat("Shape (rows, columns):", dim(df), "\n")
cat("Columns:", names(df), "\n")
cat("\nData types:\n")
str(df)

cat("\nFirst 2 rows:\n")
print(head(df, 2))

cat("\nSummary statistics:\n")
print(summary(df))

# Accessing Data Frame Elements

cat("\n", rep("=", 60), "\n", sep = "")
cat("ACCESSING DATA FRAME ELEMENTS\n")
cat(rep("=", 60), "\n", sep = "")

# Access column
cat("Income column:\n")
print(df$Income)

# Access multiple columns
cat("\nName and Income:\n")
print(df[c("Name", "Income")])

# Access rows by index
cat("\nFirst row:\n")
print(df[1, ])

# Access by condition
high_income <- df[df$Income > 60000, ]
cat("\nHigh income individuals:\n")
print(high_income)

# Data Frame Operations
cat("\n", rep("=", 60), "\n", sep = "")
cat("DATA FRAME OPERATIONS\n")
cat(rep("=", 60), "\n", sep = "")

# Add new column
df$Tax <- df$Income * 0.25
cat("DataFrame with Tax column:\n")
print(df)

# Aggregate operations
cat("\nAverage income: $", mean(df$Income), "\n", sep = "")
cat("Total income: $", sum(df$Income), "\n", sep = "")
cat("\nIncome by city:\n")
print(aggregate(Income ~ City, data = df, FUN = mean))

# Example: Pennsylvania Housing Data (Simulated)

cat("\n", rep("=", 60), "\n", sep = "")
cat("EXAMPLE: HOUSING DATA ANALYSIS\n")
cat(rep("=", 60), "\n", sep = "")

# Create simulated housing data
set.seed(42)
n_houses <- 100

housing_data <- data.frame(
  Median_household_income = sample(30000:100000, n_houses, replace = TRUE),
  Median_house_value = sample(100000:400000, n_houses, replace = TRUE),
  Population = sample(1000:50000, n_houses, replace = TRUE)
)

cat("Housing data summary:\n")
print(summary(housing_data))

# Simple linear regression
model <- lm(Median_house_value ~ Median_household_income, data = housing_data)

cat("\nLinear Regression Results:\n")
print(summary(model))

# Predict values
income_example <- 50000
predicted_value <- predict(model, newdata = data.frame(Median_household_income = income_example))
cat("\nPredicted house value for $", income_example, " income: $", 
    predicted_value, "\n", sep = "")

# Matrix Operations
cat("\n", rep("=", 60), "\n", sep = "")
cat("MATRIX OPERATIONS\n")
cat(rep("=", 60), "\n", sep = "")

A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), nrow = 2, byrow = TRUE)

cat("Matrix A:\n")
print(A)
cat("Matrix B:\n")
print(B)
cat("A + B:\n")
print(A + B)
cat("A * B (element-wise):\n")
print(A * B)
cat("A %*% B (matrix multiplication):\n")
print(A %*% B)
cat("Transpose of A:\n")
print(t(A))

# Array Functions
cat("\n", rep("=", 60), "\n", sep = "")
cat("USEFUL ARRAY FUNCTIONS\n")
cat(rep("=", 60), "\n", sep = "")

arr <- c(3, 7, 1, 9, 2, 8)
cat("Array:", arr, "\n")
cat("Min:", min(arr), "\n")
cat("Max:", max(arr), "\n")
cat("Mean:", mean(arr), "\n")
cat("Median:", median(arr), "\n")
cat("Std dev:", sd(arr), "\n")
cat("Sorted:", sort(arr), "\n")
cat("Arg max (index of max):", which.max(arr), "\n")

cat("\n", rep("=", 60), "\n", sep = "")
cat("SUMMARY\n")
cat(rep("=", 60), "\n", sep = "")
cat("- R arrays and matrices are native data structures\n")
cat("- Data frames are fundamental for tabular data\n")
cat("- R uses 1-based indexing\n")
cat("- R offers powerful data manipulation capabilities\n")
cat(rep("=", 60), "\n", sep = "")
