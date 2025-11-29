import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind, ks_2samp

# --- Example 1: Permutation Test for Difference in Means (Reading Data) ---

# Data
T = np.array([24, 43, 58, 71, 61, 44, 67, 49, 59, 52, 62, 54, 46, 43, 57, 
              43, 57, 56, 53, 49, 33])
C = np.array([42, 43, 55, 26, 33, 41, 19, 54, 46, 10, 17, 60, 37, 42, 55, 
              28, 62, 53, 37, 42, 20, 48, 85])
n1 = len(T)
Z = np.concatenate((T, C))
N = len(Z)
obs_stat = np.mean(T) - np.mean(C)
B = 1000
new_stats = np.zeros(B)

# Perform permutation test
for i in range(B):
    # Permute the combined data (Z) and select the first n1 for newT
    permuted_Z = np.random.permutation(Z)
    newT = permuted_Z[:n1]
    newC = permuted_Z[n1:] # The remaining elements form newC
    new_stats[i] = np.mean(newT) - np.mean(newC)

# Calculate p-value (observed statistic included in the null distribution count)
pvalue = np.mean(np.concatenate(([obs_stat], new_stats)) >= obs_stat)
print(f"Example 1: Difference in Means P-value: {pvalue:.4f}")

# Visualize the permutation distribution
plt.figure(figsize=(6, 5))
plt.hist(new_stats, bins=30, edgecolor='black', color='lightblue')
plt.axvline(obs_stat, color='red', linestyle='dashed', linewidth=2, label='Observed Stat')
plt.title("Permutation Distribution (Difference in Means)")
plt.xlabel("Mean(T) - Mean(C)")
plt.ylabel("Frequency")
plt.legend()
plt.show()


# --- Example 2: Permutation Test for t-statistic (chickwts Data) ---

X = np.array([227, 215, 223, 197, 207, 246, 230, 234, 213, 227, 239, 238, 248, 250]) # Soybean (n=14)
Y = np.array([141, 169, 213, 243, 249, 221, 232, 247, 217, 252, 277, 280]) # Linseed (n=12)

n_x = len(X)
Z = np.concatenate((X, Y))
K = len(Z)
B = 999
reps = np.zeros(B)

# Calculate observed t-statistic (using the same 'equal_var=False' as R's default)
t0 = ttest_ind(X, Y, equal_var=False).statistic

# Permutation loop: shuffle labels and calculate new t-statistic
for i in range(B):
    permuted_Z = np.random.permutation(Z)
    x1 = permuted_Z[:n_x]
    y1 = permuted_Z[n_x:]
    # Calculate the t-statistic for the permuted data
    reps[i] = ttest_ind(x1, y1, equal_var=False).statistic

p = np.mean(np.concatenate(([t0], reps)) >= t0)
print(f"\nExample 2: t-statistic P-value: {p:.4f} (Observed t-stat: {t0:.3f})")

# Visualize the permutation distribution
plt.figure(figsize=(6, 5))
plt.hist(reps, bins=30, edgecolor='black', color='lightcoral')
plt.axvline(t0, color='red', linestyle='dashed', linewidth=2, label='Observed t-stat')
plt.title("Permutation Distribution (t-statistic)")
plt.xlabel("t-statistic")
plt.ylabel("Frequency")
plt.legend()
plt.show()


# --- Example 3: Permutation Test for K-S statistic (chickwts Data) ---
# X, Y, Z, K, B are carried over from Example 2

# Calculate observed K-S statistic (D)
DO = ks_2samp(X, Y).statistic
D = np.zeros(B)

# Permutation loop: shuffle labels and calculate new K-S statistic
for i in range(B):
    permuted_Z = np.random.permutation(Z)
    x1 = permuted_Z[:n_x]
    y1 = permuted_Z[n_x:]
    # Calculate K-S statistic for permuted data
    D[i] = ks_2samp(x1, y1).statistic

p_ks = np.mean(np.concatenate(([DO], D)) >= DO)
print(f"\nExample 3: K-S statistic P-value: {p_ks:.4f} (Observed K-S: {DO:.3f})")

# Visualize the permutation distribution
plt.figure(figsize=(6, 5))
plt.hist(D, bins=30, edgecolor='black', color='lightgreen')
plt.axvline(DO, color='red', linestyle='dashed', linewidth=2, label='Observed K-S Stat')
plt.title("Permutation Distribution (K-S Statistic)")
plt.xlabel("K-S D Statistic")
plt.ylabel("Frequency")
plt.legend()
plt.show()


# --- Example 4: Randomization Test for Correlation Coefficients ---

# Data
Score = np.array([58, 48, 48, 41, 34, 43, 38, 53, 41, 60, 55, 44, 
                  43, 49, 47, 33, 47, 40, 46, 53, 40, 45, 39, 47, 
                  50, 53, 46, 53])
SAT = np.array([590, 590, 580, 490, 550, 580, 550, 700, 560, 690, 800, 600, 
                650, 580, 660, 590, 600, 540, 610, 580, 620, 600, 560, 560, 
                570, 630, 510, 620])

r_obt = np.corrcoef(Score, SAT)[0, 1]
print(f"\nExample 4: The obtained correlation is {r_obt:.4f}")

nreps = 5000
r_random = np.zeros(nreps)
n_data = len(Score)

# Randomization loop: Permuting SAT scores relative to fixed Score values
for i in range(nreps):
    # Shuffle SAT while keeping Score fixed
    X_permuted = np.random.permutation(SAT)
    # Calculate correlation between fixed Score and permuted SAT
    r_random[i] = np.corrcoef(Score, X_permuted)[0, 1]

prob = np.mean(r_random >= r_obt)
print(f"Example 4: Probability randomized r >= r_obt: {prob:.4f}")

# Visualize the randomization distribution
plt.figure(figsize=(6, 5))
plt.hist(r_random, bins=30, edgecolor='black', color='gold')
plt.axvline(r_obt, color='red', linestyle='dashed', linewidth=2, label='Observed r')
plt.title("Randomization Distribution for Correlation")
plt.xlabel("Correlation Coefficient (r)")
plt.ylabel("Frequency")
plt.legend()
plt.show()


# --- Comparison: Bootstrap versus Randomization ---
x = np.array([45, 53, 73, 80])
y = np.array([22, 30, 29, 38])
n_pairs = len(x)

print("\nExample 5: Comparison of Sampling Schemes")
print("Original Data:\n", np.vstack((x, y)))

# Randomization (Permuting Y, holding X fixed)
perm_y1 = np.random.permutation(y)
print("\nExample 1 of Randomization (Permuting Y, holding X fixed):\n", np.vstack((x, perm_y1)))
perm_y2 = np.random.permutation(y)
print("Example 2 of Randomization (Permuting Y, holding X fixed):\n", np.vstack((x, perm_y2)))

# Bootstrap Resampling (Sampling pairs with replacement)
indices = np.arange(n_pairs)
boot_idx = np.random.choice(indices, size=n_pairs, replace=True)

boot_x = x[boot_idx]
boot_y = y[boot_idx]

print("\nExample of Bootstrap Resampling (Sampling pairs with replacement):\n", np.vstack((boot_x, boot_y)))
