using Statistics
using StatsBase
using HypothesisTests
using Plots
using LinearAlgebra # For cor()

# --- Example 1: Permutation Test for Difference in Means (Reading Data) ---

# Data
T = [24, 43, 58, 71, 61, 44, 67, 49, 59, 52, 62, 54, 46, 43, 57, 
     43, 57, 56, 53, 49, 33]
C = [42, 43, 55, 26, 33, 41, 19, 54, 46, 10, 17, 60, 37, 42, 55, 
     28, 62, 53, 37, 42, 20, 48, 85]
n1 = length(T)
Z = vcat(T, C)
N = length(Z)
obs_stat = mean(T) - mean(C)
B = 1000
new_stats = zeros(B)

# Perform permutation test
for i in 1:B
    # Sample n1 indices without replacement
    idx = sample(1:N, n1, replace=false)
    newT = Z[idx]
    # The remaining elements form newC (using set difference)
    newC_indices = setdiff(1:N, idx)
    newC = Z[newC_indices]
    new_stats[i] = mean(newT) - mean(newC)
end

# Calculate p-value
pvalue = mean(vcat([obs_stat], new_stats) .>= obs_stat)
println("Example 1: Difference in Means P-value: $(round(pvalue, digits=4))")

# Visualize the permutation distribution
p1 = histogram(new_stats, bins=30, normalize=:probability, color=:lightblue, legend=false, 
               title="Permutation Distribution (Difference in Means)", 
               xlabel="Mean(T) - Mean(C)", ylabel="Density")
vline!([obs_stat], color=:red, linestyle=:dash, label="Observed Stat")
display(p1)


# --- Example 2: Permutation Test for t-statistic (chickwts Data) ---

X = [227, 215, 223, 197, 207, 246, 230, 234, 213, 227, 239, 238, 248, 250] # Soybean (n=14)
Y = [141, 169, 213, 243, 249, 221, 232, 247, 217, 252, 277, 280] # Linseed (n=12)

n_x = length(X)
Z = vcat(X, Y)
K = length(Z)
B = 999
reps = zeros(B)

# Calculate observed t-statistic (using Welch's t-test which assumes unequal variance)
t0 = UnequalVarianceTTest(X, Y) |> x -> x.t
println("\nObserved t-statistic: $(round(t0, digits=3))")

# Permutation loop
for i in 1:B
    k = sample(1:K, n_x, replace=false)
    x1 = Z[k]
    y1_indices = setdiff(1:K, k)
    y1 = Z[y1_indices]
    # Calculate the t-statistic for the permuted data
    reps[i] = UnequalVarianceTTest(x1, y1) |> x -> x.t
end

p = mean(vcat([t0], reps) .>= t0)
println("Example 2: t-statistic P-value: $(round(p, digits=4))")

# Visualize the permutation distribution
p2 = histogram(reps, bins=30, normalize=:probability, color=:lightcoral, legend=false,
               title="Permutation Distribution (t-statistic)", 
               xlabel="t-statistic", ylabel="Density")
vline!([t0], color=:red, linestyle=:dash, label="Observed t-stat")
display(p2)


# --- Example 3: Permutation Test for K-S Statistic (chickwts Data) ---
# X, Y, Z, K, B are carried over from Example 2

# Calculate observed K-S statistic (D)
DO = ApproximateTwoSampleKSTest(X, Y) |> x -> x.D
D = zeros(B)

# Permutation loop
for i in 1:B
    k = sample(1:K, n_x, replace=false)
    x1 = Z[k]
    y1_indices = setdiff(1:K, k)
    y1 = Z[y1_indices]
    
    # Calculate K-S statistic for permuted data
    D[i] = ApproximateTwoSampleKSTest(x1, y1) |> x -> x.D
end

p_ks = mean(vcat([DO], D) .>= DO)
println("\nExample 3: K-S statistic P-value: $(round(p_ks, digits=4)) (Observed K-S: $(round(DO, digits=3)))")

# Visualize the permutation distribution
p3 = histogram(D, bins=30, normalize=:probability, color=:lightgreen, legend=false,
               title="Permutation Distribution (K-S Statistic)", 
               xlabel="K-S D Statistic", ylabel="Density")
vline!([DO], color=:red, linestyle=:dash, label="Observed K-S Stat")
display(p3)


# --- Example 4: Randomization Test for Correlation Coefficients ---

# Data
Score = [58, 48, 48, 41, 34, 43, 38, 53, 41, 60, 55, 44, 
         43, 49, 47, 33, 47, 40, 46, 53, 40, 45, 39, 47, 
         50, 53, 46, 53]
SAT = [590, 590, 580, 490, 550, 580, 550, 700, 560, 690, 800, 600, 
       650, 580, 660, 590, 600, 540, 610, 580, 620, 600, 560, 560, 
       570, 630, 510, 620]

r_obt = cor(Score, SAT)
println("\nExample 4: The obtained correlation is $(round(r_obt, digits=4))")

nreps = 5000
r_random = zeros(nreps)
n_data = length(Score)

# Randomization loop: Permuting SAT scores relative to fixed Score values
for i in 1:nreps
    # Shuffle SAT while keeping Score fixed
    X_permuted = sample(SAT, n_data, replace = false) 
    # Calculate correlation between fixed Score and permuted SAT
    r_random[i] = cor(Score, X_permuted)
end

prob = mean(r_random .>= r_obt)
println("Example 4: Probability randomized r >= r.obt: $(round(prob, digits=4))")

# Visualize the randomization distribution
p4 = histogram(r_random, bins=30, normalize=:probability, color=:gold, legend=false,
               title="Randomization Distribution for Correlation", 
               xlabel="Correlation Coefficient (r)", ylabel="Density")
vline!([r_obt], color=:red, linestyle=:dash, label="Observed r")
display(p4)


# --- Comparison: Bootstrap versus Randomization ---
x = [45, 53, 73, 80]
y = [22, 30, 29, 38]
n_pairs = length(x)

println("\nExample 5: Comparison of Sampling Schemes")
println("Original Data:\n", [x y]') # Transpose to match R's rbind output format

# Randomization (Permuting Y, holding X fixed)
perm_y1 = sample(y, n_pairs, replace=false)
println("\nExample 1 of Randomization (Permuting Y, holding X fixed):\n", [x perm_y1]')
perm_y2 = sample(y, n_pairs, replace=false)
println("Example 2 of Randomization (Permuting Y, holding X fixed):\n", [x perm_y2]')

# Bootstrap Resampling (Sampling pairs with replacement)
indices = 1:n_pairs
boot_idx = sample(indices, n_pairs, replace=true)

boot_x = x[boot_idx]
boot_y = y[boot_idx]
println("\nExample of Bootstrap Resampling (Sampling pairs with replacement):\n", [boot_x boot_y]')