import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import nbinom, beta, t # Import necessary statistical functions

# --- Data Setup ---
# Number of previously captured individuals observed in each subsequent capture event (M_i)
captured = np.array([30, 22, 29, 26, 31, 32, 35])
new_captures = np.array([30, 8, 17, 7, 9, 8, 5])

# Total number of unique individuals captured at least once (R or total_caught).
# R is calculated as the sum of all new captures (including the first 'new' capture of 30).
total_caught = np.sum(new_captures) 

# The size parameter for the Negative Binomial distribution is TotalCaught + 1 (R + 1).
# This corresponds to the total number of individuals that have been marked/caught.

print(f"Total Unique Individuals Captured (R): {total_caught}")


# --- Gibbs Sampler Function ---
def gibbs_chain(n_iterations, N_start=200, alpha_start=None):
    """
    Implements the Gibbs sampler for the Capture-Recapture model (Schnabel Census).

    Returns:
    - np.array: A matrix where column 1 is N, and columns 2-8 are alpha_1 to alpha_7.
    """
    if alpha_start is None:
        alpha_start = np.full(7, 0.5)

    output = np.zeros((n_iterations, 8))
    N_current = N_start
    alpha_current = alpha_start

    for i in range(n_iterations):
        # 1. Update N (Population Size)
        # N | alpha, data ~ TotalCaught + NegativeBinomial(TotalCaught + 1, p)
        # where p is the probability of being captured at least once.
        
        prob_capture_at_least_once = 1.0 - np.prod(1.0 - alpha_current)
        
        # Sample the number of *failures* (unobserved individuals)
        n_failures = nbinom.rvs(total_caught + 1, prob_capture_at_least_once, size=1)[0]
        
        # Calculate new population size
        N_new = total_caught + n_failures

        # 2. Update Alpha (Capture Probabilities)
        # alpha_i | N, data ~ Beta(captured_i + 0.5, N - captured_i + 0.5)
        
        # Beta prior parameters (Beta(0.5, 0.5) corresponds to the prior)
        beta1 = captured + 0.5
        beta2 = N_new - captured + 0.5
        
        # Sample new alpha values
        alpha_new = beta.rvs(beta1, beta2, size=7)

        # 3. Store and Update State
        output[i, 0] = N_new
        output[i, 1:] = alpha_new
        N_current = N_new
        alpha_current = alpha_new

    return output


# --- Preliminary Simulations and Analysis (1,000 Iterations) ---
print("\nRunning preliminary simulation (1,000 iterations)...")
trial = gibbs_chain(1000, N_start=200) 
N_trial = trial[:, 0]
alpha_trial = trial[:, 1:]

# Plotting Trace Plots to assess chain mixing
plt.figure(figsize=(12, 12))
plt.suptitle("Trace Plots (1,000 Iterations)", fontsize=16)

plt.subplot(4, 2, 1)
plt.plot(N_trial)
plt.title("Trace Plot for N")

for i in range(7):
    plt.subplot(4, 2, i + 2)
    plt.plot(alpha_trial[:, i])
    plt.title(f"Trace Plot for Alpha {i + 1}")

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()


# Plotting Autocorrelation (Lag) Plots to check dependence between samples
plt.figure(figsize=(12, 12))
plt.suptitle("Autocorrelation Plots (Lag Plots) (1,000 Iterations)", fontsize=16)

plt.subplot(4, 2, 1)
plt.acorr(N_trial - np.mean(N_trial), maxlags=50, usevlines=False, marker='.')
plt.title("ACF Plot for N")

for i in range(7):
    plt.subplot(4, 2, i + 2)
    alpha_i = alpha_trial[:, i]
    plt.acorr(alpha_i - np.mean(alpha_i), maxlags=50, usevlines=False, marker='.')
    plt.title(f"ACF Plot for Alpha {i + 1}")

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()


# --- Complete Simulation and Posterior Analysis (10,000 Iterations) ---
print("\nRunning complete simulation (10,000 iterations)...")
sim = gibbs_chain(10000, N_start=200)

N = sim[:, 0]
alpha1 = sim[:, 1]

# Calculate Posterior Statistics after burn-in
burn_in = 1000
N_final = N[burn_in:]
alpha1_final = alpha1[burn_in:]

mean_N = np.mean(N_final)
ci_N = np.percentile(N_final, [5, 95])

mean_alpha1 = np.mean(alpha1_final)
ci_alpha1 = np.percentile(alpha1_final, [5, 95])


print("\n--- Posterior Estimates (Burn-in = 1,000) ---")
print(f"Estimated Posterior Mean for N: {mean_N:.2f}")
print(f"90% Credible Interval for N: ({ci_N[0]:.0f}, {ci_N[1]:.0f})")
print(f"Estimated Posterior Mean for Alpha 1: {mean_alpha1:.4f}")
print(f"90% Credible Interval for Alpha 1: ({ci_alpha1[0]:.4f}, {ci_alpha1[1]:.4f})")

# Plotting Histograms of Marginal Posteriors
plt.figure(figsize=(10, 5))

# Marginal Posterior for N
plt.subplot(1, 2, 1)
plt.hist(N_final, bins=30, density=True, color='skyblue', edgecolor='black')
plt.axvline(mean_N, color='red', linestyle='dashed', linewidth=1, label=f'Mean: {mean_N:.2f}')
plt.axvline(ci_N[0], color='green', linestyle='dotted', linewidth=1, label='90% CI')
plt.axvline(ci_N[1], color='green', linestyle='dotted', linewidth=1)
plt.title("Estimated Marginal Posterior for N")
plt.xlabel("N (Population Size)")
plt.ylabel("Density")
plt.legend()

# Marginal Posterior for Alpha 1
plt.subplot(1, 2, 2)
plt.hist(alpha1_final, bins=30, density=True, color='lightcoral', edgecolor='black')
plt.axvline(mean_alpha1, color='red', linestyle='dashed', linewidth=1, label=f'Mean: {mean_alpha1:.4f}')
plt.axvline(ci_alpha1[0], color='green', linestyle='dotted', linewidth=1, label='90% CI')
plt.axvline(ci_alpha1[1], color='green', linestyle='dotted', linewidth=1)
plt.title("Estimated Marginal Posterior for Alpha 1")
plt.xlabel(r"$\alpha_1$ (Capture Probability)")
plt.ylabel("Density")
plt.legend()

plt.tight_layout()
plt.show()

# --- Optional Continuation Simulation (for demonstration) ---
print("\nRunning a further 10,000 iterations starting from the end of the previous chain...")
current_N = sim[-1, 0]
current_alpha = sim[-1, 1:]

sim_continued = gibbs_chain(10000, N_start=current_N, alpha_start=current_alpha)

# Combine results for a larger sample size
sim_full = np.vstack((sim, sim_continued))
N_big = sim_full[:, 0]

# Plot final combined N histogram
plt.figure(figsize=(6, 5))
plt.hist(N_big[burn_in:], bins=50, density=True, color='mediumpurple', edgecolor='black')
mean_N_big = np.mean(N_big[burn_in:])
ci_N_big = np.percentile(N_big[burn_in:], [5, 95])
plt.axvline(mean_N_big, color='red', linestyle='dashed', linewidth=1, label=f'Mean: {mean_N_big:.2f}')
plt.axvline(ci_N_big[0], color='green', linestyle='dotted', linewidth=1, label='90% CI')
plt.axvline(ci_N_big[1], color='green', linestyle='dotted', linewidth=1)
plt.title("Estimated Marginal Posterior for N (Full 20k Chain)")
plt.xlabel("N (Population Size)")
plt.ylabel("Density")
plt.legend()
plt.tight_layout()
plt.show()