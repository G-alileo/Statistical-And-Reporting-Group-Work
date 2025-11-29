# Python versions of Beta-Binomial and Normal-Normal conjugate examples
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import beta, norm

#  Beta-Binomial example
alpha1 = 2
alpha2 = 2
n = 20
x = 13
post_a = x + alpha1
post_b = n - x + alpha2
print('Beta-Binomial posterior parameters: a=', post_a, ' b=', post_b)

xs = np.linspace(0,1,200)
prior = beta.pdf(xs, alpha1, alpha2)
posterior = beta.pdf(xs, post_a, post_b)
plt.plot(xs, prior, linestyle='--', label='Prior')
plt.plot(xs, posterior, color='blue', label='Posterior')
plt.title('Beta Prior and Posterior')
plt.xlabel('p (prob of heads)')
plt.ylabel('Density')
plt.legend()
plt.show()

# Posterior mean and 95% credible interval
post_mean = post_a / (post_a + post_b)
ci_lower = beta.ppf(0.025, post_a, post_b)
ci_upper = beta.ppf(0.975, post_a, post_b)
print('Posterior mean:', round(post_mean,3))
print('95% credible interval: [{:.3f}, {:.3f}]'.format(ci_lower, ci_upper))

# Normal-Normal conjugate (known sigma^2)
sigma2 = 4.0
mu0 = 0.0
tau2 = 1.0
n2 = 30
np.random.seed(123)
data_sample = np.random.normal(loc=2.0, scale=np.sqrt(sigma2), size=n2)

xbar = data_sample.mean()
mu_n = (mu0 / tau2 + n2 * xbar / sigma2) / (1 / tau2 + n2 / sigma2)
tau2_n = 1.0 / (1.0 / tau2 + n2 / sigma2)

print('Posterior mean (mu_n):', round(mu_n,3))
print('Posterior sd (sqrt tau2_n):', round(np.sqrt(tau2_n),3))
ci_lo = mu_n - 1.96 * np.sqrt(tau2_n)
ci_hi = mu_n + 1.96 * np.sqrt(tau2_n)
print('95% credible interval for theta: [{:.3f}, {:.3f}]'.format(ci_lo, ci_hi))

