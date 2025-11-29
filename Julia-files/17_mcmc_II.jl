using Distributions
using Plots
using StatsBase
using LinearAlgebra

# --- Data Setup ---
# Number of previously captured individuals observed in the subsequent capture events
captured = [30, 22, 29, 26, 31, 32, 35]
new_captures = [30, 8, 17, 7, 9, 8, 5]
# Total number of unique individuals captured at least once (R).
total_caught = sum(new_captures)
# Negative Binomial size parameter (R + 1)
r_nb = total_caught + 1

println("Total Unique Individuals Captured (Total 'R' in R context): $total_caught")


# --- Gibbs Sampler Function ---
function gibbs_chain(n_iterations::Int; N_start::Int = 200, alpha_start::Vector{Float64} = fill(0.5, 7))
    """
    Implements the Gibbs sampler for the Capture-Recapture model.

    Returns:
    - Matrix{Float64}: A matrix where column 1 is N, and columns 2-8 are alpha_1 to alpha_7.
    """
    output = zeros(Float64, n_iterations, 8)
    N_current = N_start
    alpha_current = alpha_start

    for i in 1:n_iterations
        # 1. Update N (Population Size)
        # N | alpha, data ~ TotalCaught + NegativeBinomial(R + 1, p)
        prob_capture_at_least_once = 1.0 - prod(1.0 .- alpha_current)
        dist_nb = NegativeBinomial(r_nb, prob_capture_at_least_once)
        n_failures = rand(dist_nb)

        N_new = total_caught + n_failures

        # 2. Update Alpha (Capture Probabilities)
        # alpha_i | N, data ~ Beta(captured_i + 0.5, N - captured_i + 0.5)
        beta1 = captured .+ 0.5
        beta2 = N_new .- captured .+ 0.5

        alpha_new = [rand(Beta(a, b)) for (a, b) in zip(beta1, beta2)]

        # 3. Store and Update
        output[i, 1] = N_new
        output[i, 2:8] = alpha_new
        
        N_current = N_new
        alpha_current = alpha_new
    end
    return output
end


# --- Preliminary Simulations and Analysis ---
println("\nRunning preliminary simulation (1,000 iterations)...")
trial = gibbs_chain(1000)
N_trial = trial[:, 1]
alpha_trial = trial[:, 2:8]

# Plotting Trace Plots
p_trace = plot(layout = (4, 2), size = (1000, 1000), legend = false, title = "Trace Plots (1,000 Iterations)")

# Trace Plot for N
plot!(p_trace, N_trial, subplot = 1, title = "Trace Plot for N", xlabel = "Iteration", ylabel = "N")

# Trace Plots for Alpha 1 to 7
for i in 1:7
    plot!(p_trace, alpha_trial[:, i], subplot = i + 1, title = "Trace Plot for Alpha $i", xlabel = "Iteration", ylabel = "Alpha")
end
display(p_trace)

# Plotting Autocorrelation (Lag) Plots
p_acf = plot(layout = (4, 2), size = (1000, 1000), legend = false, title = "Autocorrelation Plots (1,000 Iterations)")

# ACF Plot for N
lags_N = autocor(N_trial, 1:50)
scatter!(p_acf, 1:50, lags_N, subplot = 1, title = "ACF Plot for N", xlabel = "Lag", ylabel = "ACF", marker = :circle, markersize=3)
hline!([0], subplot = 1, linecolor = :red, linestyle = :dash)

# ACF Plots for Alpha 1 to 7
for i in 1:7
    lags_alpha = autocor(alpha_trial[:, i], 1:50)
    scatter!(p_acf, 1:50, lags_alpha, subplot = i + 1, title = "ACF Plot for Alpha $i", xlabel = "Lag", ylabel = "ACF", marker = :circle, markersize=3)
    hline!([0], subplot = i + 1, linecolor = :red, linestyle = :dash)
end
display(p_acf)


# --- Complete Simulation and Posterior Analysis ---
println("\nRunning complete simulation (10,000 iterations)...")
sim = gibbs_chain(10000)

N = sim[:, 1]
alpha1 = sim[:, 2]

# Calculate Posterior Statistics
burn_in = 1000
N_final = N[(burn_in + 1):end]
alpha1_final = alpha1[(burn_in + 1):end]

# Estimated Posterior Means
mean_N = mean(N_final)
mean_alpha1 = mean(alpha1_final)

# 90% Bayesian Credible Intervals (5th and 95th percentiles)
ci_N = quantile(N_final, [0.05, 0.95])
ci_alpha1 = quantile(alpha1_final, [0.05, 0.95])


println("\n--- Posterior Estimates (Burn-in = 1,000) ---")
println("Estimated Posterior Mean for N: $(round(mean_N, digits=2))")
println("90% Credible Interval for N: ($(Int(round(ci_N[1]))), $(Int(round(ci_N[2]))))")
println("Estimated Posterior Mean for Alpha 1: $(round(mean_alpha1, digits=4))")
println("90% Credible Interval for Alpha 1: ($(round(ci_alpha1[1], digits=4)), $(round(ci_alpha1[2], digits=4)))")

# Plotting Histograms
p_hist = plot(layout = (1, 2), size = (1000, 500), title = "Estimated Marginal Posteriors")

# Marginal Posterior for N
histogram!(p_hist, N_final, normalize = :probability, subplot = 1, title = "Estimated Marginal Posterior for N", 
           xlabel = "N (Population Size)", ylabel = "Density", color = :skyblue, legend = false)
vline!([mean_N], subplot = 1, color = :red, linestyle = :dash, label = "Mean: $(round(mean_N, digits=2))")
vline!([ci_N[1], ci_N[2]], subplot = 1, color = :green, linestyle = :dot, label = "90% CI")

# Marginal Posterior for Alpha 1
histogram!(p_hist, alpha1_final, normalize = :probability, subplot = 2, title = "Estimated Marginal Posterior for Alpha 1", 
           xlabel = "Alpha 1 (Capture Probability)", ylabel = "Density", color = :lightcoral, legend = false)
vline!([mean_alpha1], subplot = 2, color = :red, linestyle = :dash, label = "Mean: $(round(mean_alpha1, digits=4))")
vline!([ci_alpha1[1], ci_alpha1[2]], subplot = 2, color = :green, linestyle = :dot, label = "90% CI")

display(p_hist)

# --- Optional Continuation Simulation (for demonstration) ---
println("\nRunning a further 10,000 iterations starting from the end of the previous chain...")
current_N = sim[end, 1]
current_alpha = sim[end, 2:8]

sim_continued = gibbs_chain(10000; N_start = Int(current_N), alpha_start = current_alpha)

# Combine results (vertically stack matrices)
sim_full = vcat(sim, sim_continued)
N_big = sim_full[:, 1]

# Plot final combined N histogram
p_N_big = histogram(N_big[(burn_in + 1):end], normalize = :probability, bins = 50, color = :mediumpurple, legend = false,
                    title = "Estimated Marginal Posterior for N (Full 20k Chain)", 
                    xlabel = "N (Population Size)", ylabel = "Density")

mean_N_big = mean(N_big[(burn_in + 1):end])
ci_N_big = quantile(N_big[(burn_in + 1):end], [0.05, 0.95])
vline!([mean_N_big], color = :red, linestyle = :dash, label = "Mean: $(round(mean_N_big, digits=2))")
vline!([ci_N_big[1], ci_N_big[2]], color = :green, linestyle = :dot, label = "90% CI")

display(p_N_big)