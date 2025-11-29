using Distributions
using Plots

# --- Random Sampling from Normal Distribution ---

# 100 samples from Normal(0,1)
x = rand(Normal(0, 1), 100)

histogram(x, bins=10, color=:skyblue, edgecolor=:black,
          xlabel="Value", ylabel="Frequency",
          title="Normal Distribution Samples")


# --- Probability Density Function (PDF) ---

d = Normal(0, 1)
x_vals = -3:0.1:3
y_vals = pdf.(d, x_vals)

plot(x_vals, y_vals, color=:darkblue,
     xlabel="x", ylabel="Density", title="Normal PDF")


# --- Cumulative Distribution Function (CDF) ---

prob = cdf(d, 1.96)
println(prob)   # ≈ 0.975


# --- Quantiles (Inverse CDF) ---

q = quantile(d, 0.975)
println(q)      # ≈ 1.96


# --- Random sample from N(5, 2) ---

samples = rand(Normal(5, 2), 10)
println(samples)


# --- Comparing Normal and t-Distribution ---

t5 = TDist(5)

plot(x_vals, pdf.(d, x_vals), label="Normal", color=:blue)
plot!(x_vals, pdf.(t5, x_vals), label="t(5)", color=:red,
      title="Normal vs t Distribution")
