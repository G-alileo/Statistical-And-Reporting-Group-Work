# Random Sampling

# Generate 100 random samples from normal distribution (mean=0, sd=1)
x <- rnorm(n=100, mean=0, sd=1)

# Plot histogram
hist(x, breaks=10, col='skyblue', border='black',
     xlab='Value', ylab='Frequency', 
     main='Normal Distribution Samples')

# Probability Density Function (PDF)

# Generate values
x <- seq(-3, 3, by=0.1)
y <- dnorm(x)

# Plot normal density curve
plot(x, y, type='l', col='darkblue',
     xlab='x', ylab='Density',
     main='Normal PDF')

# Cumulative Distribution Function (CDF)
# Probability that a normal variable <= 1.96
prob <- pnorm(1.96)
print(prob)  # ≈ 0.975

# Quantiles and Random Sampling
# Quantile (inverse of CDF)
quantile <- qnorm(0.975)
print(quantile)  # ≈ 1.96

# 10 random samples from N(5, 2)
samples <- rnorm(n=10, mean=5, sd=2)
print(samples)

# Comparing Distributions

x <- seq(-3, 3, by=0.1)
plot(x, dnorm(x), type='l', col='blue', lwd=2,
     xlab='x', ylab='Density',
     main='Normal vs t Distribution')
lines(x, dt(x, df=5), col='red', lwd=2)
legend('topright', legend=c('Normal', 't(5)'), 
       col=c('blue', 'red'), lwd=2)