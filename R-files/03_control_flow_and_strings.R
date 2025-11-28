# This file demonstrates concepts covered in the Control Flow and Strings folder:
# - Conditional statements (if/else)
# - Loops (for, while)
# - Control flow keywords (break, next)
# - String operations and functions
# - String formatting
# - Pattern matching and manipulation


# Conditional Statements
cat(rep("=", 60), "\n", sep = "")
cat("CONDITIONAL STATEMENTS\n")
cat(rep("=", 60), "\n", sep = "")

# Simple if statement
x <- 10
if (x > 5) {
  cat(x, "is greater than 5\n")
}

# if-else statement
y <- 3
if (y %% 2 == 0) {
  cat(y, "is even\n")
} else {
  cat(y, "is odd\n")
}

# if-else if-else statement
score <- 85
if (score >= 90) {
  grade <- "A"
} else if (score >= 80) {
  grade <- "B"
} else if (score >= 70) {
  grade <- "C"
} else if (score >= 60) {
  grade <- "D"
} else {
  grade <- "F"
}

cat("Score:", score, ", Grade:", grade, "\n")

# Nested conditions
age <- 25
has_license <- TRUE

if (age >= 18) {
  if (has_license) {
    cat("You can drive\n")
  } else {
    cat("You need a license\n")
  }
} else {
  cat("You are too young to drive\n")
}

# ifelse() function (vectorized)
ages <- c(15, 20, 30, 10)
status <- ifelse(ages >= 18, "Adult", "Minor")
cat("\nAges:", ages, "\n")
cat("Status:", status, "\n")


# For Loops
cat("\n", rep("=", 60), "\n", sep = "")
cat("FOR LOOPS\n")
cat(rep("=", 60), "\n", sep = "")

# Loop through a sequence
cat("Numbers 1 to 5:\n")
for (i in 1:5) {
  cat(i, " ", sep = "")
}
cat("\n")

# Loop through a vector
fruits <- c("apple", "banana", "cherry", "date")
cat("\nFruits:\n")
for (fruit in fruits) {
  cat("  -", fruit, "\n")
}

# Loop with index
cat("\nFruits with index:\n")
for (idx in seq_along(fruits)) {
  cat(" ", idx, ".", fruits[idx], "\n")
}

# Loop through a list
person <- list(name = "Alice", age = 25, city = "New York")
cat("\nPerson details:\n")
for (key in names(person)) {
  cat(" ", key, ":", person[[key]], "\n")
}


# While Loops
cat("\n", rep("=", 60), "\n", sep = "")
cat("WHILE LOOPS\n")
cat(rep("=", 60), "\n", sep = "")

# Simple while loop
count <- 1
cat("Counting to 5:\n")
while (count <= 5) {
  cat(count, " ", sep = "")
  count <- count + 1
}
cat("\n")

# While loop with condition
total <- 0
n <- 1
cat("\nSum until total > 20:\n")
while (total <= 20) {
  total <- total + n
  cat("  n=", n, ", total=", total, "\n", sep = "")
  n <- n + 1
}


# Break and Next 
cat("\n", rep("=", 60), "\n", sep = "")
cat("BREAK AND NEXT\n")
cat(rep("=", 60), "\n", sep = "")

# Using break
cat("Finding first number divisible by 7:\n")
for (i in 1:49) {
  if (i %% 7 == 0) {
    cat("  Found:", i, "\n")
    break
  }
}

# Using next (equivalent to continue in Python)
cat("\nOdd numbers from 1 to 10:\n")
for (i in 1:10) {
  if (i %% 2 == 0) {
    next  # Skip even numbers
  }
  cat(i, " ", sep = "")
}
cat("\n")


# Vectorized Operations (Alternative to Loops)
cat("\n", rep("=", 60), "\n", sep = "")
cat("VECTORIZED OPERATIONS\n")
cat(rep("=", 60), "\n", sep = "")

# sapply - apply function to each element
squares <- sapply(1:10, function(x) x^2)
cat("Squares:", squares, "\n")

# Filter with vectorization
even_squares <- squares[1:10 %% 2 == 0]
cat("Even squares:", even_squares, "\n")

# Apply to create matrix
matrix_result <- sapply(1:3, function(i) sapply(1:3, function(j) i*j))
cat("Multiplication table:\n")
print(matrix_result)


# String Basics
cat("\n", rep("=", 60), "\n", sep = "")
cat("STRING BASICS\n")
cat(rep("=", 60), "\n", sep = "")

# Creating strings
str1 <- "Hello"
str2 <- 'World'
str3 <- "Multi-line
string"

cat("str1:", str1, "\n")
cat("str2:", str2, "\n")
cat("str3:", str3, "\n")

# String concatenation
full_string <- paste(str1, str2)
cat("Concatenated:", full_string, "\n")

# String repetition
repeated <- paste(rep("Ha", 3), collapse = "")
cat("Repeated:", repeated, "\n")

# String length
cat("Length of '", full_string, "':", nchar(full_string), "\n", sep = "")


# String Indexing and Slicing
cat("\n", rep("=", 60), "\n", sep = "")
cat("STRING INDEXING AND SLICING\n")
cat(rep("=", 60), "\n", sep = "")

text <- "Python Programming"
cat("Text:", text, "\n")
cat("First character:", substr(text, 1, 1), "\n")
cat("Last character:", substr(text, nchar(text), nchar(text)), "\n")
cat("Characters 1-6:", substr(text, 1, 6), "\n")
cat("Characters 7 onwards:", substr(text, 7, nchar(text)), "\n")


# String Functions
cat("\n", rep("=", 60), "\n", sep = "")
cat("STRING FUNCTIONS\n")
cat(rep("=", 60), "\n", sep = "")

sample <- "  Hello World  "
cat("Original: '", sample, "'\n", sep = "")
cat("Upper: '", toupper(sample), "'\n", sep = "")
cat("Lower: '", tolower(sample), "'\n", sep = "")
cat("Strip: '", trimws(sample), "'\n", sep = "")
cat("Replace: '", gsub("World", "R", sample), "'\n", sep = "")

# String queries
cat("\nStarts with 'Hello':", startsWith(trimws(sample), "Hello"), "\n")
cat("Ends with 'World':", endsWith(trimws(sample), "World"), "\n")
cat("Contains 'World':", grepl("World", sample), "\n")

# String splitting and joining
sentence <- "R is a powerful language"
words <- strsplit(sentence, " ")[[1]]
cat("\nSplit:", words, "\n")
cat("Join:", paste(words, collapse = "-"), "\n")


# String Formatting
cat("\n", rep("=", 60), "\n", sep = "")
cat("STRING FORMATTING\n")
cat(rep("=", 60), "\n", sep = "")

name <- "Alice"
age <- 25
height <- 5.6

# Using paste
cat(paste("Name:", name, ", Age:", age, ", Height:", height), "\n")

# Using sprintf
cat(sprintf("Name: %s, Age: %d, Height: %.1f\n", name, age, height))

# Using paste0 (no separator)
cat(paste0("Name: ", name, ", Age: ", age, ", Height: ", height), "\n")


# String Searching and Manipulation
cat("\n", rep("=", 60), "\n", sep = "")
cat("STRING SEARCHING AND MANIPULATION\n")
cat(rep("=", 60), "\n", sep = "")

text <- "The quick brown fox jumps over the lazy dog"
cat("Text:", text, "\n")

# Finding substrings
cat("Position of 'fox':", regexpr("fox", text)[1], "\n")
cat("Count of 'the':", length(gregexpr("the", tolower(text))[[1]]), "\n")

# Checking string content
cat("\ngrepl('[0-9]', '123'):", grepl('[0-9]', '123'), "\n")
cat("grepl('[a-zA-Z]', 'abc'):", grepl('[a-zA-Z]', 'abc'), "\n")


# Regular Expressions
cat("\n", rep("=", 60), "\n", sep = "")
cat("REGULAR EXPRESSIONS\n")
cat(rep("=", 60), "\n", sep = "")

text <- "Contact us at support@example.com or sales@example.com"

# Find all email addresses
emails <- regmatches(text, gregexpr("\\b[\\w.-]+@[\\w.-]+\\.\\w+\\b", text))[[1]]
cat("Email addresses found:", emails, "\n")

# Pattern matching
phone <- "Phone: 123-456-7890"
match <- regexpr("\\d{3}-\\d{3}-\\d{4}", phone)
if (match[1] != -1) {
  cat("Phone number:", regmatches(phone, match)[[1]], "\n")
}

# Substitution
text <- "The price is $100"
new_text <- gsub("\\$(\\d+)", "£\\1", text)
cat("Original:", text, "\n")
cat("Modified:", new_text, "\n")


# Practical Examples
cat("\n", rep("=", 60), "\n", sep = "")
cat("PRACTICAL EXAMPLES\n")
cat(rep("=", 60), "\n", sep = "")

# Example 1: Validate email
is_valid_email <- function(email) {
  pattern <- "^[\\w.-]+@[\\w.-]+\\.\\w+$"
  grepl(pattern, email)
}

test_emails <- c("user@example.com", "invalid.email", "test@domain.co.uk")
for (email in test_emails) {
  cat(email, ":", ifelse(is_valid_email(email), "Valid", "Invalid"), "\n")
}

# Example 2: Word counter
count_words <- function(text) {
  words <- strsplit(text, " ")[[1]]
  words <- tolower(gsub("[.,!?]", "", words))
  table(words)
}

text <- "Hello world! Hello R. R is great."
word_counts <- count_words(text)
cat("\nWord counts:\n")
print(word_counts)

# Example 3: Palindrome checker
is_palindrome <- function(text) {
  cleaned <- tolower(gsub("[^a-zA-Z0-9]", "", text))
  cleaned == paste(rev(strsplit(cleaned, "")[[1]]), collapse = "")
}

test_strings <- c("A man a plan a canal Panama", "Hello", "racecar")
cat("\nPalindrome checker:\n")
for (s in test_strings) {
  cat("  '", s, "': ", is_palindrome(s), "\n", sep = "")
}

# Example 4: FizzBuzz
cat("\nFizzBuzz (1-20):\n")
for (i in 1:20) {
  if (i %% 15 == 0) {
    cat("FizzBuzz ")
  } else if (i %% 3 == 0) {
    cat("Fizz ")
  } else if (i %% 5 == 0) {
    cat("Buzz ")
  } else {
    cat(i, " ", sep = "")
  }
}
cat("\n")

cat("\n", rep("=", 60), "\n", sep = "")
cat("SUMMARY\n")
cat(rep("=", 60), "\n", sep = "")
cat("- R uses if/else if/else for conditionals\n")
cat("- for and while loops for iteration\n")
cat("- break exits loops, next skips to next iteration\n")
cat("- Rich string manipulation functions\n")
cat("- Regular expressions with grepl, gsub, regexpr\n")
cat(rep("=", 60), "\n", sep = "")
