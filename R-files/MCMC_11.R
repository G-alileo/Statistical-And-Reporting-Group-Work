

captured <- c(30, 22, 29, 26, 31, 32, 35)
new.captures <- c(30, 8, 17, 7, 9, 8, 5)
# Total number of unique individuals captured at least once (R)
total.r <- sum(new.captures)

# --- Gibbs Sampler Function ---

gibbs.chain <- function(n, N.start = 94, alpha.start = rep(.5,7)) {
    output <- matrix(0, nrow=n, ncol=8)
    
    for(i in 1:n){
        # 1. Update N (Population Size)
        # Calculate probability of being captured at least once (p for NegBinom)
        neg.binom.prob <- 1 - prod(1-alpha.start)
        
        # Sample the number of unobserved individuals (k) from NegBinom(R+1, p)
        # N = R + k
        N.new <- stats::rnbinom(1, 85, neg.binom.prob) + total.r
        
        # 2. Update Alpha (Capture Probabilities)
        # Sample alpha_i from Beta(captured_i + 0.5, N - captured_i + 0.5)
        beta1 <- captured + .5
        beta2 <- N.new - captured + .5
        alpha.new <- stats::rbeta(7, beta1, beta2)
        
        # Store results
        output[i,] <- c(N.new, alpha.new)
        
        # Update current values
        N.start <- N.new
        alpha.start <- alpha.new    
    }
    return(output)
}

# --- Preliminary Simulations and Trace Plots ---
trial <- gibbs.chain(1000)

# Trace Plots for N and the 7 alpha parameters
plot.ts(trial[,1], main = "Trace Plot for N")
for(i in 1:7){
    plot.ts(trial[,(i+1)], main = paste("Alpha", i))
}

# Autocorrelation (Lag) Plots for N and alpha
stats::acf(trial[,1], main = "Lag Plot for N")
for(i in 1:7){
    stats::acf(trial[,(i+1)], main = paste("Lag Alpha", i))
}

# --- Complete Simulation and Posterior Analysis ---
sim <- gibbs.chain(10000)
N <- sim[,1]
alpha1 <- sim[,2]

# Histograms of marginal posteriors for N and Alpha 1
par(mfrow=c(1,2))
hist(N, freq=F, main="Estimated Marginal Posterior for N")
hist(alpha1, freq=F, main ="Estimating Marginal Posterior for Alpha 1")

# The original code attempts to run it here.
par(mfrow=c(1,2))
# estvssamp(N) 
# estvssamp(alpha1) 

# --- Continuation Simulation (Combining Chains) ---
# Start from the last state of the first chain
current <- sim[10000,] 
# Run another 10,000 simulations and append them
sim <- rbind(sim, gibbs.chain(10000, N.start = current[1], alpha.start = current[2:8]))
N.big <- sim[,1]

# Final Histogram for the large N sample
hist(N.big, freq=F, main="Estimated Marginal Posterior for N")