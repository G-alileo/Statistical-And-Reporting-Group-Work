"""
This file demonstrates concepts covered in the Control Flow and Strings folder:
- Conditional statements (if/elif/else)
- Loops (for, while)
- Control flow keywords (break, continue)
- String operations and methods
- String formatting
- Pattern matching and manipulation
"""

import re


# Conditional Statements
print("=" * 60)
print("CONDITIONAL STATEMENTS")
print("=" * 60)

# Simple if statement
x = 10
if x > 5:
    print(f"{x} is greater than 5")

# if-else statement
y = 3
if y % 2 == 0:
    print(f"{y} is even")
else:
    print(f"{y} is odd")

# if-elif-else statement
score = 85
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
elif score >= 60:
    grade = "D"
else:
    grade = "F"

print(f"Score: {score}, Grade: {grade}")

# Nested conditions
age = 25
has_license = True

if age >= 18:
    if has_license:
        print("You can drive")
    else:
        print("You need a license")
else:
    print("You are too young to drive")

# For Loops
print("\n" + "=" * 60)
print("FOR LOOPS")
print("=" * 60)

# Loop through a range
print("Numbers 1 to 5:")
for i in range(1, 6):
    print(i, end=" ")
print()

# Loop through a list
fruits = ["apple", "banana", "cherry", "date"]
print("\nFruits:")
for fruit in fruits:
    print(f"  - {fruit}")

# Loop with index
print("\nFruits with index:")
for idx, fruit in enumerate(fruits, start=1):
    print(f"  {idx}. {fruit}")

# Loop through a dictionary
person = {"name": "Alice", "age": 25, "city": "New York"}
print("\nPerson details:")
for key, value in person.items():
    print(f"  {key}: {value}")

# While Loops
print("\n" + "=" * 60)
print("WHILE LOOPS")
print("=" * 60)

# Simple while loop
count = 1
print("Counting to 5:")
while count <= 5:
    print(count, end=" ")
    count += 1
print()

# While loop with condition
total = 0
n = 1
print("\nSum until total > 20:")
while total <= 20:
    total += n
    print(f"  n={n}, total={total}")
    n += 1

# Break and Continue
print("\n" + "=" * 60)
print("BREAK AND CONTINUE")
print("=" * 60)

# Using break
print("Finding first number divisible by 7:")
for i in range(1, 50):
    if i % 7 == 0:
        print(f"  Found: {i}")
        break

# Using continue
print("\nOdd numbers from 1 to 10:")
for i in range(1, 11):
    if i % 2 == 0:
        continue  # Skip even numbers
    print(i, end=" ")
print()

# List Comprehensions (Pythonic Alternative to Loops)
print("\n" + "=" * 60)
print("LIST COMPREHENSIONS")
print("=" * 60)

# Basic list comprehension
squares = [x**2 for x in range(1, 11)]
print(f"Squares: {squares}")

# With condition
even_squares = [x**2 for x in range(1, 11) if x % 2 == 0]
print(f"Even squares: {even_squares}")

# Nested comprehension
matrix = [[i*j for j in range(1, 4)] for i in range(1, 4)]
print(f"Multiplication table:\n{matrix}")

# String Basics

print("\n" + "=" * 60)
print("STRING BASICS")
print("=" * 60)

# Creating strings
str1 = "Hello"
str2 = 'World'
str3 = """Multi-line
string"""

print(f"str1: {str1}")
print(f"str2: {str2}")
print(f"str3: {str3}")

# String concatenation
full_string = str1 + " " + str2
print(f"Concatenated: {full_string}")

# String repetition
repeated = "Ha" * 3
print(f"Repeated: {repeated}")

# String length
print(f"Length of '{full_string}': {len(full_string)}")

# String Indexing and Slicing
print("\n" + "=" * 60)
print("STRING INDEXING AND SLICING")
print("=" * 60)

text = "Python Programming"
print(f"Text: {text}")
print(f"First character: {text[0]}")
print(f"Last character: {text[-1]}")
print(f"Characters 0-5: {text[0:6]}")
print(f"Characters 7 onwards: {text[7:]}")
print(f"Every 2nd character: {text[::2]}")
print(f"Reversed: {text[::-1]}")

# String Methods
print("\n" + "=" * 60)
print("STRING METHODS")
print("=" * 60)

sample = "  Hello World  "
print(f"Original: '{sample}'")
print(f"Upper: '{sample.upper()}'")
print(f"Lower: '{sample.lower()}'")
print(f"Title: '{sample.title()}'")
print(f"Strip: '{sample.strip()}'")
print(f"Replace: '{sample.replace('World', 'Python')}'")

# String queries
print(f"\nStarts with 'Hello': {sample.strip().startswith('Hello')}")
print(f"Ends with 'World': {sample.strip().endswith('World')}")
print(f"Contains 'World': {'World' in sample}")

# String splitting and joining
sentence = "Python is a powerful language"
words = sentence.split()
print(f"\nSplit: {words}")
print(f"Join: {'-'.join(words)}")

# String Formatting
print("\n" + "=" * 60)
print("STRING FORMATTING")
print("=" * 60)

name = "Alice"
age = 25
height = 5.6

# f-strings (Python 3.6+)
print(f"Name: {name}, Age: {age}, Height: {height:.1f}")

# format() method
print("Name: {}, Age: {}, Height: {:.1f}".format(name, age, height))

# % operator (old style)
print("Name: %s, Age: %d, Height: %.1f" % (name, age, height))


# String Searching and Manipulation
print("\n" + "=" * 60)
print("STRING SEARCHING AND MANIPULATION")
print("=" * 60)

text = "The quick brown fox jumps over the lazy dog"
print(f"Text: {text}")

# Finding substrings
print(f"Index of 'fox': {text.find('fox')}")
print(f"Index of 'cat': {text.find('cat')}")  # Returns -1 if not found
print(f"Count of 'the': {text.lower().count('the')}")

# Checking string content
print(f"\n'123'.isdigit(): {'123'.isdigit()}")
print(f"'abc'.isalpha(): {'abc'.isalpha()}")
print(f"'abc123'.isalnum(): {'abc123'.isalnum()}")
print(f"'   '.isspace(): {'   '.isspace()}")


# Regular Expressions
print("\n" + "=" * 60)
print("REGULAR EXPRESSIONS")
print("=" * 60)

text = "Contact us at support@example.com or sales@example.com"

# Find all email addresses
emails = re.findall(r'\b[\w.-]+@[\w.-]+\.\w+\b', text)
print(f"Email addresses found: {emails}")

# Pattern matching
phone = "Phone: 123-456-7890"
match = re.search(r'\d{3}-\d{3}-\d{4}', phone)
if match:
    print(f"Phone number: {match.group()}")

# Substitution
text = "The price is $100"
new_text = re.sub(r'\$(\d+)', r'£\1', text)
print(f"Original: {text}")
print(f"Modified: {new_text}")


# Practical Examples
print("\n" + "=" * 60)
print("PRACTICAL EXAMPLES")
print("=" * 60)

# Example 1: Validate email
def is_valid_email(email):
    pattern = r'^[\w.-]+@[\w.-]+\.\w+$'
    return bool(re.match(pattern, email))

test_emails = ["user@example.com", "invalid.email", "test@domain.co.uk"]
for email in test_emails:
    print(f"{email}: {'Valid' if is_valid_email(email) else 'Invalid'}")

# Example 2: Word counter
def count_words(text):
    words = text.split()
    word_count = {}
    for word in words:
        word = word.lower().strip('.,!?')
        word_count[word] = word_count.get(word, 0) + 1
    return word_count

text = "Hello world! Hello Python. Python is great."
word_counts = count_words(text)
print(f"\nWord counts: {word_counts}")

# Example 3: Palindrome checker
def is_palindrome(text):
    cleaned = re.sub(r'[^a-zA-Z0-9]', '', text.lower())
    return cleaned == cleaned[::-1]

test_strings = ["A man a plan a canal Panama", "Hello", "racecar"]
print("\nPalindrome checker:")
for s in test_strings:
    print(f"  '{s}': {is_palindrome(s)}")

# Example 4: FizzBuzz
print("\nFizzBuzz (1-20):")
for i in range(1, 21):
    if i % 15 == 0:
        print("FizzBuzz", end=" ")
    elif i % 3 == 0:
        print("Fizz", end=" ")
    elif i % 5 == 0:
        print("Buzz", end=" ")
    else:
        print(i, end=" ")
print()

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print("- Python uses if/elif/else for conditionals")
print("- for and while loops for iteration")
print("- break exits loops, continue skips to next iteration")
print("- Rich string manipulation methods")
print("- Regular expressions for pattern matching")
print("=" * 60)
