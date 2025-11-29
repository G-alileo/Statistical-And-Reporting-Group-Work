# Random Sampling
import numpy as np
import matplotlib.pyplot as plt

# Generate 100 random samples from normal distribution (mean=0, sd=1)
x = np.random.normal(loc=0, scale=1, size=100)

# Plot histogram
plt.hist(x, bins=10, color='skyblue', edgecolor='black')
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.title('Normal Distribution Samples')
plt.show()

# Probability Density Function (PDF)
from scipy.stats import norm

# Generate values
x = np.arange(-3, 3, 0.1)
y = norm.pdf(x)

# Plot normal density curve
plt.plot(x, y, color='darkblue')
plt.xlabel('x')
plt.ylabel('Density')
plt.title('Normal PDF')
plt.show()

# Cumulative Distribution Function (CDF)
# Probability that a normal variable <= 1.96
from scipy.stats import norm
prob = norm.cdf(1.96)
print(prob)  # ≈ 0.975

# Quantiles and Random Sampling
# Quantile (inverse of CDF)
quantile = norm.ppf(0.975)
print(quantile)  # ≈ 1.96

# 10 random samples from N(5, 2)
samples = np.random.normal(loc=5, scale=2, size=10)
print(samples)

# Comparing Distributions
from scipy.stats import t

x = np.arange(-3, 3, 0.1)
plt.plot(x, norm.pdf(x), label='Normal', color='blue')
plt.plot(x, t.pdf(x, df=5), label='t(5)', color='red')
plt.legend()
plt.title('Normal vs t Distribution')
plt.show()

