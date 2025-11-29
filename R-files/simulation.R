using Statistics, Plots, Random, Distributions

# --- Inverse Transform Method: Exponential Distribution ---
function my_exp(n, beta)
    u = rand(n)
    x = -beta .* log.(1 .- u)
    return x
end

Random.seed!(123)
exp_samples = my_exp(10000, 2)
println("Exponential Mean: ", mean(exp_samples))
p1 = histogram(exp_samples, bins=50, title="Inverse Transform: Exp(2)", legend=false)

# --- Rejection Sampling: Gamma(3/2, 1) ---
function ar_gamma(n=100)
    x = zeros(n)
    i = 1
    while i <= n
        # 1. Generate Y from proposal mixture
        u1 = rand()
        y = 0.0
        if u1 < 0.5
            y = -log(1 - rand())       # Exp(1)
        else
            y = sum(-log.(1 .- rand(2))) # Gamma(2,1)
        end
        
        # 2. Acceptance step
        u2 = rand()
        ratio = (2 * sqrt(y)) / (1 + y)
        
        if u2 < ratio
            x[i] = y
            i += 1
        end
    end
    return x
end

gamma_samples = ar_gamma(10000)
p2 = histogram(gamma_samples, normalize=true, bins=50, label="Sampled", title="Rejection Sampling: Gamma(3/2, 1)")
plot!(p2, 0:0.1:10, x->pdf(Gamma(1.5, 1), x), color=:red, linewidth=2, label="True PDF")

# Display plots
display(p1)
display(p2)