# cross_validation.jl
# Julia version: simple CV example and loess smoothing (requires some packages)
using Random
using DataFrames
using StatsBase
using GLM
using MLJ
using Loess


# Generate lidar-like data (if you don't have the original file)
Random.seed!(123)
n = 200
range_vals = range(0, stop=100, length=n)
logratio = sin.(range_vals ./ 10) .+ randn(n) .* 0.2
lidar = DataFrame(range = collect(range_vals), logratio = logratio)


# 10-fold CV manual loop (linear model example)
K = 10
folds = partition(1:n, K, shuffle=true)
mses = Float64[]
for f in folds
test_idx = collect(f)
train_idx = setdiff(1:n, test_idx)
train = lidar[train_idx, :]
test = lidar[test_idx, :]
fit = lm(@formula(logratio ~ range), train)
preds = predict(fit, test)
push!(mses, mean((test.logratio .- preds).^2))
end
println("Average CV MSE (linear fit): ", mean(mses))


# Loess smoothing for plotting
lo = loess(lidar.range, lidar.logratio)
predicted = Loess.predict(lo, lidar.range)
