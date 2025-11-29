# Julia versions: AR(1), batch means, and simple Metropolis-Hastings
using Random
using Statistics
using Distributions

# AR(1) generator
ar1_step(m, rho, tau) = rho * m + rand(Normal(0, tau))

function ar1_gen(mc::Vector{Float64}, p::Int, rho::Float64, tau::Float64)
    out = copy(mc)
    for i in 1:p
        push!(out, ar1_step(out[end], rho, tau))
    end
    return out
end

# batch means
function batch_means(x::Vector{Float64}, b::Int)
    n = length(x)
    a = div(n, b)
    means = [mean(x[(k*b+1):((k+1)*b)]) for k in 0:(a-1)]
    return means
end

# Simple Metropolis-Hastings (symmetric normal proposal)
function metropolis_hastings(n_iter::Int, x0::Float64, prop_sd::Float64, log_target::Function)
    x = Vector{Float64}(undef, n_iter)
    x[1] = x0
    for t in 2:n_iter
        cand = rand(Normal(x[t-1], prop_sd))
        log_r = log_target(cand) - log_target(x[t-1])
        if log(rand()) < log_r
            x[t] = cand
        else
            x[t] = x[t-1]
        end
    end
    return x
end

# Example usage
Random.seed!(20)
rho = 0.95
tau = 1.0
out = [0.0]
out = ar1_gen(out, 1000, rho, tau)

b = 50
means = batch_means(out, b)
emp_var = var(means)
sigma2_hat = b * emp_var
println("Estimated asymptotic variance sigma^2_hat = ", sigma2_hat)

# MH: bimodal target
log_target_bimodal(x) = log(0.3 * pdf(Normal(-3,1), x) + 0.7 * pdf(Normal(3,1), x))
samps = metropolis_hastings(10000, 0.0, 1.0, log_target_bimodal)
println("Acceptance rate (approx): ", mean(diff(samps) .!= 0))