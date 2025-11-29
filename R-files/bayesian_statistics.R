# Beta-Binomial (coin flips) 
# Suppose we flip a coin n times and get x heads. Prior ~ Beta(alpha1, alpha2).
alpha1 <- 2  # prior successes + 1 (example)
alpha2 <- 2  # prior failures + 1
n <- 20
x <- 13  # observed heads

# Posterior parameters (conjugate update)
post_a <- x + alpha1
post_b <- n - x + alpha2

cat('Beta-Binomial posterior parameters: a=', post_a, ' b=', post_b, '\n')

# Plot prior and posterior
xs <- seq(0,1,length=200)
prior <- dbeta(xs, alpha1, alpha2)
posterior <- dbeta(xs, post_a, post_b)
plot(xs, prior, type='l', lty=2, ylim=c(0, max(c(prior,posterior))),
     main='Beta Prior and Posterior', ylab='Density', xlab='p (prob of heads)')
lines(xs, posterior, col='blue')
legend('topright', legend=c('Prior','Posterior'), lty=c(2,1), col=c('black','blue'))

# Posterior mean and 95% credible interval
post_mean <- post_a / (post_a + post_b)
ci_lower <- qbeta(0.025, post_a, post_b)
ci_upper <- qbeta(0.975, post_a, post_b)
cat('Posterior mean:', round(post_mean,3), '\n')
cat('95% credible interval: [', round(ci_lower,3), ',', round(ci_upper,3), ']\n')


# Normal-Normal conjugate (known sigma^2) 
# Data: x1,...,xn ~ N(theta, sigma2) with known sigma2
sigma2 <- 4.0  # known variance
sigma <- sqrt(sigma2)
mu0 <- 0.0     # prior mean
tau2 <- 1.0    # prior variance
n2 <- 30
set.seed(123)
data_sample <- rnorm(n2, mean=2.0, sd=sigma)

# Posterior parameters
xbar <- mean(data_sample)
mu_n <- (mu0 / tau2 + n2 * xbar / sigma2) / (1 / tau2 + n2 / sigma2)
tau2_n <- 1 / (1 / tau2 + n2 / sigma2)

cat('Posterior mean (mu_n):', round(mu_n,3), '\n')
cat('Posterior sd (sqrt tau2_n):', round(sqrt(tau2_n),3), '\n')

# 95% credible interval for theta
ci_lo <- mu_n - 1.96 * sqrt(tau2_n)
ci_hi <- mu_n + 1.96 * sqrt(tau2_n)
cat('95% credible interval for theta: [', round(ci_lo,3), ',', round(ci_hi,3), ']\n')
