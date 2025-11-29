# Histograms, KDE, and 2D density for Julia
using Random
using DataFrames
using StatsBase
using KernelDensity
using Plots

# Load or simulate data (Old Faithful)
# If you have a CSV, replace this with CSV.read
Random.seed!(123)
n = 272
eruptions = randn(n) .* 0.8 .+ 2.0  # rough simulated values
waiting = randn(n) .* 15 .+ 70
lidf = DataFrame(eruptions = eruptions, waiting = waiting)

# 1) Histogram
histogram(lidf.eruptions, bins=0:0.5:8, normalize=true, xlabel="Eruption length", ylabel="Density", title="Histogram of Eruption Lengths")

# 2) KDE 1D
k = kde(lidf.eruptions)
xs = range(minimum(lidf.eruptions), stop=maximum(lidf.eruptions), length=200)
plot(xs, pdf(k, xs), label="KDE (default)", title="Kernel Density Estimate (Julia)")

# 3) Compare bandwidths: KernelDensity.jl allows specifying bandwidth in kde() if needed
k_small = kde(lidf.eruptions, bw=0.2)
k_large = kde(lidf.eruptions, bw=1.0)
plot(xs, pdf(k_small, xs), label="bw=0.2")
plot!(xs, pdf(k_large, xs), label="bw=1.0")

# 4) 2D density estimation (using KernelDensity.jl's kde for multivariate data)
using KernelDensity: kde
XY = hcat(lidf.eruptions, lidf.waiting)'
k2 = kde(XY)  # multivariate KDE
# plotting a contour requires extracting grid and values - more code but doable
# For class purposes, the contour from Python/R is usually enough; here we leave a placeholder
println("Computed 2D KDE (use plotting utilities to visualize grid contours)")