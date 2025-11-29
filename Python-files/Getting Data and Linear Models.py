# Reading data from CSV
import pandas as pd

# Read a CSV file into a DataFrame
data = pd.read_csv("data.csv")

# Display the first few rows
print(data.head())

# Check data structure and info
print(data.info())

# Get summary statistics for numerical columns
print(data.describe())

# Fitting a linear Model
import statsmodels.api as sm

# Define independent (x) and dependent (y) variables
X = data['x']
y = data['y']

# Add a constant term (intercept)
X = sm.add_constant(X)

# Fit linear regression model
model = sm.OLS(y, X).fit()

# Display model summary
print(model.summary())

# Predict for new x values
new_x = pd.DataFrame({'x': [2, 5, 8]})
new_x = sm.add_constant(new_x)

predictions = model.predict(new_x)
print(predictions)

# Plotting Regression Line
import matplotlib.pyplot as plt

plt.scatter(data['x'], data['y'], label='Data', color='gray')
plt.plot(data['x'], model.predict(X), color='blue', label='Regression Line')
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.show()
