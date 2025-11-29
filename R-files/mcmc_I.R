# Simple MCMC demos: AR(1) generator, batch means MCSE, and a basic Metropolis-Hastings sampler

# AR(1) generator and batch means example
ar1 <- function(m, rho, tau) {
  rho * m + rnorm(1, 0, tau)
}

ar1.gen <- function(mc, p, rho, tau) {
  loc <- length(mc)
  junk <- double(p)
  mc <- append(mc, junk)
  for(i in 1:p){
    j <- i + loc - 1
    mc[(j+1)] <- ar1(mc[j], rho, tau)
  }
  return(mc)
}

# Example use: simulate and compute batch means-based MCSE
set.seed(20)
rho <- 0.95
tau <- 1
out <- 0
start <- 1000
r <- 1000
out <- ar1.gen(out, start, rho, tau)

# compute batch means manually
batch_means <- function(x, b){
  n <- length(x)
  a <- floor(n / b)
  means <- sapply(0:(a-1), function(k) mean(x[(k*b + 1):((k+1)*b)]))
  return(list(means = means, a = a))
}

b <- 50  # batch size (example)
bm <- batch_means(out, b)
emp_var <- var(bm$means)
# est of asymptotic variance sigma^2 approx = b * emp_var
sigma2_hat <- b * emp_var
cat('Estimated asymptotic variance sigma^2_hat =', sigma2_hat, '\n')

# Basic Metropolis-Hastings sampler for a target density f (unnormalized)
metropolis_hastings <- function(n_iter, x0, prop_sd, log_target){
  x <- numeric(n_iter)
  x[1] <- x0
  for(t in 2:n_iter){
    cand <- rnorm(1, mean = x[t-1], sd = prop_sd)
    log_r <- log_target(cand) - log_target(x[t-1])  # symmetric proposal cancels
    if(log(runif(1)) < log_r){
      x[t] <- cand
    } else {
      x[t] <- x[t-1]
    }
  }
  return(x)
}

# Example: sample from a bimodal target f(x) = 0.3*N(-3,1) + 0.7*N(3,1)
log_target_bimodal <- function(x){
  log(0.3 * dnorm(x, -3, 1) + 0.7 * dnorm(x, 3, 1))
}

set.seed(1)
samps <- metropolis_hastings(10000, 0, 1.0, log_target_bimodal)
cat('Acceptance rate (approx):', mean(diff(samps) != 0), '\n')

# quick diagnostic: trace and histogram
par(mfrow = c(1,2))
plot(samps, type='l', main='Trace of MH samples')
hist(samps, breaks = 50, main='Histogram of MH samples', xlab='x')
par(mfrow = c(1,1))