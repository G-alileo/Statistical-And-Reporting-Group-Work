# Python versions: AR(1) generator, batch means, and simple Metropolis-Hastings
import numpy as np
import matplotlib.pyplot as plt

# AR(1) step and generator
def ar1_step(m, rho, tau):
    return rho * m + np.random.normal(0, tau)

def ar1_gen(mc, p, rho, tau):
    mc = list(mc)
    for _ in range(p):
        mc.append(ar1_step(mc[-1], rho, tau))
    return np.array(mc)

# batch means
def batch_means(x, b):
    n = len(x)
    a = n // b
    means = np.array([x[k*b:(k+1)*b].mean() for k in range(a)])
    return means

# Metropolis-Hastings (symmetric normal proposal)
def metropolis_hastings(n_iter, x0, prop_sd, log_target):
    x = np.zeros(n_iter)
    x[0] = x0
    for t in range(1, n_iter):
        cand = np.random.normal(x[t-1], prop_sd)
        log_r = log_target(cand) - log_target(x[t-1])
        if np.log(np.random.rand()) < log_r:
            x[t] = cand
        else:
            x[t] = x[t-1]
    return x

# Example usage
np.random.seed(20)
rho = 0.95
tau = 1.0
out = np.array([0.0])
out = ar1_gen(out, 1000, rho, tau)

b = 50
means = batch_means(out, b)
emp_var = means.var(ddof=1)
sigma2_hat = b * emp_var
print('Estimated asymptotic variance sigma^2_hat =', sigma2_hat)

# MH example with bimodal target
import math

def log_target_bimodal(x):
    return math.log(0.3 * (1/math.sqrt(2*math.pi)) * math.exp(-(x+3)**2 / 2) + 0.7 * (1/math.sqrt(2*math.pi)) * math.exp(-(x-3)**2 / 2))

samps = metropolis_hastings(10000, 0.0, 1.0, log_target_bimodal)
print('Acceptance rate (approx):', np.mean(np.diff(samps) != 0))

plt.figure(figsize=(10,4))
plt.subplot(1,2,1)
plt.plot(samps)
plt.title('Trace of MH samples')
plt.subplot(1,2,2)
plt.hist(samps, bins=50)
plt.title('Histogram of MH samples')
plt.show()