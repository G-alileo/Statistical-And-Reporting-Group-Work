"""
This file demonstrates concepts covered in the Control Flow and Strings Statistical Computingr:
- Conditional statements (if/elseif/else)
- Loops (for, while)
- Control flow keywords (break, continue)
- String operations and methods
- String formatting
- Pattern matching and manipulation
"""

# Conditional Statements
println("="^60)
println("CONDITIONAL STATEMENTS")
println("="^60)

# Simple if statement
x = 10
if x > 5
    println("$(x) is greater than 5")
end

# if-else statement
y = 3
if y % 2 == 0
    println("$(y) is even")
else
    println("$(y) is odd")
end

# if-elseif-else statement
score = 85
if score >= 90
    grade = "A"
elseif score >= 80
    grade = "B"
elseif score >= 70
    grade = "C"
elseif score >= 60
    grade = "D"
else
    grade = "F"
end

println("Score: $(score), Grade: $(grade)")

# Nested conditions
age = 25
has_license = true

if age >= 18
    if has_license
        println("You can drive")
    else
        println("You need a license")
    end
else
    println("You are too young to drive")
end

# For Loops
println("\n" * "="^60)
println("FOR LOOPS")
println("="^60)

# Loop through a range
println("Numbers 1 to 5:")
for i in 1:5
    print(i, " ")
end
println()

# Loop through an array
fruits = ["apple", "banana", "cherry", "date"]
println("\nFruits:")
for fruit in fruits
    println("  - $(fruit)")
end

# Loop with index
println("\nFruits with index:")
for (idx, fruit) in enumerate(fruits)
    println("  $(idx). $(fruit)")
end

# Loop through a dictionary
person = Dict("name" => "Alice", "age" => 25, "city" => "New York")
println("\nPerson details:")
for (key, value) in person
    println("  $(key): $(value)")
end

# While Loops
println("\n" * "="^60)
println("WHILE LOOPS")
println("="^60)

# Simple while loop
count = 1
println("Counting to 5:")
while count <= 5
    print(count, " ")
    count += 1
end
println()

# While loop with condition
total = 0
n = 1
println("\nSum until total > 20:")
while total <= 20
    total += n
    println("  n=$(n), total=$(total)")
    n += 1
end

# Break and Continue
println("\n" * "="^60)
println("BREAK AND CONTINUE")
println("="^60)

# Using break
println("Finding first number divisible by 7:")
for i in 1:49
    if i % 7 == 0
        println("  Found: $(i)")
        break
    end
end

# Using continue
println("\nOdd numbers from 1 to 10:")
for i in 1:10
    if i % 2 == 0
        continue  # Skip even numbers
    end
    print(i, " ")
end
println()

# Array Comprehensions (Julia's Alternative to Loops)
println("\n" * "="^60)
println("ARRAY COMPREHENSIONS")
println("="^60)

# Basic array comprehension
squares = [x^2 for x in 1:10]
println("Squares: $(squares)")

# With condition
even_squares = [x^2 for x in 1:10 if x % 2 == 0]
println("Even squares: $(even_squares)")

# Nested comprehension
matrix = [[i*j for j in 1:3] for i in 1:3]
println("Multiplication table:")
for row in matrix
    println(row)
end

# String Basics
println("\n" * "="^60)
println("STRING BASICS")
println("="^60)

# Creating strings
str1 = "Hello"
str2 = "World"
str3 = """Multi-line
string"""

println("str1: $(str1)")
println("str2: $(str2)")
println("str3: $(str3)")

# String concatenation
full_string = str1 * " " * str2
println("Concatenated: $(full_string)")

# String repetition
repeated = "Ha"^3
println("Repeated: $(repeated)")

# String length
println("Length of '$(full_string)': $(length(full_string))")

# String Indexing and Slicing
println("\n" * "="^60)
println("STRING INDEXING AND SLICING")
println("="^60)

text = "Julia Programming"
println("Text: $(text)")
println("First character: $(text[1])")
println("Last character: $(text[end])")
println("Characters 1-5: $(text[1:5])")
println("Characters 7 onwards: $(text[7:end])")
println("Reversed: $(reverse(text))")

# String Methods
println("\n" * "="^60)
println("STRING METHODS")
println("="^60)

sample = "  Hello World  "
println("Original: '$(sample)'")
println("Upper: '$(uppercase(sample))'")
println("Lower: '$(lowercase(sample))'")
println("Title: '$(titlecase(sample))'")
println("Strip: '$(strip(sample))'")
println("Replace: '$(replace(sample, "World" => "Julia"))'")

# String queries
println("\nStarts with 'Hello': $(startswith(strip(sample), "Hello"))")
println("Ends with 'World': $(endswith(strip(sample), "World"))")
println("Contains 'World': $(occursin("World", sample))")

# String splitting and joining
sentence = "Julia is a powerful language"
words = split(sentence)
println("\nSplit: $(words)")
println("Join: $(join(words, "-"))")

# String Formatting
println("\n" * "="^60)
println("STRING FORMATTING")
println("="^60)

name = "Alice"
age = 25
height = 5.6

# String interpolation
println("Name: $(name), Age: $(age), Height: $(round(height, digits=1))")

# @sprintf macro for formatted output
using Printf
println(@sprintf("Name: %s, Age: %d, Height: %.1f", name, age, height))

# String Searching and Manipulation
println("\n" * "="^60)
println("STRING SEARCHING AND MANIPULATION")
println("="^60)

text = "The quick brown fox jumps over the lazy dog"
println("Text: $(text)")

# Finding substrings
fox_index = findfirst("fox", text)
println("Index of 'fox': $(fox_index)")
cat_index = findfirst("cat", text)
println("Index of 'cat': $(cat_index)")  # Returns nothing if not found

# Count occurrences
the_count = length(collect(eachmatch(r"the"i, text)))
println("Count of 'the': $(the_count)")

# Checking string content
println("\nisdigit('123'): $(all(isdigit, "123"))")
println("isalpha('abc'): $(all(isletter, "abc"))")
println("isalnum('abc123'): $(all(c -> isletter(c) || isdigit(c), "abc123"))")
println("isspace('   '): $(all(isspace, "   "))")


# Regular Expressions
println("\n" * "="^60)
println("REGULAR EXPRESSIONS")
println("="^60)

text = "Contact us at support@example.com or sales@example.com"

# Find all email addresses
emails = [m.match for m in eachmatch(r"\b[\w.-]+@[\w.-]+\.\w+\b", text)]
println("Email addresses found: $(emails)")

# Pattern matching
phone = "Phone: 123-456-7890"
m = match(r"\d{3}-\d{3}-\d{4}", phone)
if m !== nothing
    println("Phone number: $(m.match)")
end

# Substitution
text = "The price is \$100"
new_text = replace(text, r"\$(\d+)" => s"£\1")
println("Original: $(text)")
println("Modified: $(new_text)")


# Practical Examples
println("\n" * "="^60)
println("PRACTICAL EXAMPLES")
println("="^60)

# Example 1: Validate email
function is_valid_email(email)
    pattern = r"^[\w.-]+@[\w.-]+\.\w+$"
    return occursin(pattern, email)
end

test_emails = ["user@example.com", "invalid.email", "test@domain.co.uk"]
for email in test_emails
    println("$(email): $(is_valid_email(email) ? "Valid" : "Invalid")")
end

# Example 2: Word counter
function count_words(text)
    words = split(text)
    word_count = Dict{String, Int}()
    for word in words
        word = lowercase(strip(word, ['.', ',', '!', '?']))
        word_count[word] = get(word_count, word, 0) + 1
    end
    return word_count
end

text = "Hello world! Hello Julia. Julia is great."
word_counts = count_words(text)
println("\nWord counts: $(word_counts)")

# Example 3: Palindrome checker
function is_palindrome(text)
    cleaned = lowercase(replace(text, r"[^a-zA-Z0-9]" => ""))
    return cleaned == reverse(cleaned)
end

test_strings = ["A man a plan a canal Panama", "Hello", "racecar"]
println("\nPalindrome checker:")
for s in test_strings
    println("  '$(s)': $(is_palindrome(s))")
end

# Example 4: FizzBuzz
println("\nFizzBuzz (1-20):")
for i in 1:20
    if i % 15 == 0
        print("FizzBuzz ")
    elseif i % 3 == 0
        print("Fizz ")
    elseif i % 5 == 0
        print("Buzz ")
    else
        print(i, " ")
    end
end
println()

println("\n" * "="^60)
println("SUMMARY")
println("="^60)
println("- Julia uses if/elseif/else for conditionals")
println("- for and while loops for iteration")
println("- break exits loops, continue skips to next iteration")
println("- Rich string manipulation functions")
println("- Regular expressions for pattern matching")
println("="^60)
