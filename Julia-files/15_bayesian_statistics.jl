# Julia versions using Distributions.jl for conjugate examples
using Random
using Distributions
using Statistics

# Beta-Binomial 
alpha1 = 2
alpha2 = 2
n = 20
x = 13
post_a = x + alpha1
post_b = n - x + alpha2
println("Beta-Binomial posterior parameters: a=", post_a, " b=", post_b)

xs = range(0, stop=1, length=200)
prior = pdf.(Beta(alpha1, alpha2), xs)
posterior = pdf.(Beta(post_a, post_b), xs)
# Plotting can be done with Plots.jl if installed

post_mean = post_a / (post_a + post_b)
ci_lower = quantile(Beta(post_a, post_b), 0.025)
ci_upper = quantile(Beta(post_a, post_b), 0.975)
println("Posterior mean: ", round(post_mean, digits=3))
println("95% credible interval: [", round(ci_lower,digits=3), ", ", round(ci_upper,digits=3), "]")

# Normal-Normal conjugate (known variance)
sigma2 = 4.0
mu0 = 0.0
tau2 = 1.0
n2 = 30
Random.seed!(123)
data_sample = rand(Normal(2.0, sqrt(sigma2)), n2)

xbar = mean(data_sample)
mu_n = (mu0 / tau2 + n2 * xbar / sigma2) / (1 / tau2 + n2 / sigma2)
tau2_n = 1.0 / (1.0 / tau2 + n2 / sigma2)
println("Posterior mean (mu_n): ", round(mu_n,digits=3))
println("Posterior sd (sqrt tau2_n): ", round(sqrt(tau2_n),digits=3))
ci_lo = mu_n - 1.96 * sqrt(tau2_n)
ci_hi = mu_n + 1.96 * sqrt(tau2_n)
println("95% credible interval for theta: [", round(ci_lo,digits=3), ", ", round(ci_hi,digits=3), "]")
