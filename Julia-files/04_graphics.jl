"""
This file demonstrates concepts covered in the Graphics folder:
- Basic plotting with Plots.jl
- Histograms
- Scatter plots
- Box plots
- Multiple plots and subplots
- Plot customization
- Statistical visualizations
"""

using Plots
using Statistics
using StatsPlots
using Distributions
using Random

# Set random seed for reproducibility
Random.seed!(42)

# Basic Plotting
println("="^60)
println("BASIC PLOTTING")
println("="^60)

# Simple line plot
x = range(0, 2π, length=100)
y = sin.(x)

p1 = plot(x, y, linewidth=2, color=:blue, label="sin(x)",
          xlabel="x", ylabel="sin(x)", title="Sine Wave",
          grid=true, legend=:topright)
savefig(p1, "01_sine_wave.png")
println("Created: 01_sine_wave.png")

# Histograms
println("\n" * "="^60)
println("HISTOGRAMS")
println("="^60)

# Generate random data
data = randn(1000)

p2 = histogram(data, bins=30, normalize=:pdf, alpha=0.7, color=:blue,
               label="Data", xlabel="Value", ylabel="Density",
               title="Histogram of Normal Distribution", grid=true)

# Add normal curve
mu, sigma = mean(data), std(data)
x_norm = range(minimum(data), maximum(data), length=100)
y_norm = pdf.(Normal(mu, sigma), x_norm)
plot!(p2, x_norm, y_norm, linewidth=2, color=:red, label="Normal fit")

savefig(p2, "02_histogram.png")
println("Created: 02_histogram.png")


# Scatter Plots
println("\n" * "="^60)
println("SCATTER PLOTS")
println("="^60)

# Generate correlated data
n = 100
x = randn(n)
y = 2 .* x .+ randn(n) .* 0.5

p3 = scatter(x, y, alpha=0.6, markersize=5, color=:blue, markerstrokewidth=0.5,
             xlabel="X", ylabel="Y", title="Scatter Plot with Correlation",
             grid=true, legend=:topleft, label="Data")

# Add regression line
using GLM, DataFrames
df_temp = DataFrame(X=x, Y=y)
model = lm(@formula(Y ~ X), df_temp)
slope = coef(model)[2]
intercept = coef(model)[1]
x_line = range(minimum(x), maximum(x), length=100)
plot!(p3, x_line, intercept .+ slope .* x_line, linewidth=2, color=:red,
      linestyle=:dash, label="y = $(round(slope, digits=2))x + $(round(intercept, digits=2))")

savefig(p3, "03_scatter_plot.png")
println("Created: 03_scatter_plot.png")


# Box Plots
println("\n" * "="^60)
println("BOX PLOTS")
println("="^60)

# Generate data for multiple groups
group1 = randn(100) .* 10 .+ 100
group2 = randn(100) .* 15 .+ 110
group3 = randn(100) .* 12 .+ 95
group4 = randn(100) .* 8 .+ 105

data_groups = [group1, group2, group3, group4]
labels = ["Group A", "Group B", "Group C", "Group D"]

p4 = boxplot(labels, data_groups, ylabel="Values", title="Box Plot Comparison",
             grid=true, legend=false, fillalpha=0.75, linewidth=1.5)

savefig(p4, "04_boxplot.png")
println("Created: 04_boxplot.png")


# Multiple Plots (Subplots)
println("\n" * "="^60)
println("MULTIPLE PLOTS (SUBPLOTS)")
println("="^60)

# Plot 1: Line plot
x = range(0, 10, length=100)
p5_1 = plot(x, sin.(x), linewidth=2, color=:blue, label="sin(x)")
plot!(p5_1, x, cos.(x), linewidth=2, color=:red, linestyle=:dash, label="cos(x)")
plot!(p5_1, xlabel="x", ylabel="y", title="Trigonometric Functions",
      grid=true, legend=:topright)

# Plot 2: Histogram
data = rand(Exponential(2), 1000)
p5_2 = histogram(data, bins=30, normalize=:pdf, alpha=0.7, color=:green,
                 xlabel="Value", ylabel="Density",
                 title="Exponential Distribution", grid=true, legend=false)

# Plot 3: Scatter plot
x = randn(200)
y = randn(200)
colors = rand(200)
p5_3 = scatter(x, y, marker_z=colors, color=:viridis, alpha=0.6, markersize=3,
               xlabel="X", ylabel="Y", title="Colored Scatter Plot",
               grid=true, legend=false, colorbar=false)

# Plot 4: Bar plot
categories = ["A", "B", "C", "D", "E"]
values = [23, 45, 56, 78, 32]
p5_4 = bar(categories, values, color=:orange, xlabel="Category",
           ylabel="Value", title="Bar Chart", grid=true, legend=false)

p5 = plot(p5_1, p5_2, p5_3, p5_4, layout=(2, 2), size=(1200, 1000))
savefig(p5, "05_subplots.png")
println("Created: 05_subplots.png")

# Empirical Cumulative Distribution Function (ECDF)
println("\n" * "="^60)
println("ECDF PLOT")
println("="^60)

data = randn(200)
data_sorted = sort(data)
ecdf_values = (1:length(data_sorted)) ./ length(data_sorted)

p6 = plot(data_sorted, ecdf_values, linewidth=2, seriestype=:steppost,
          xlabel="Value", ylabel="ECDF",
          title="Empirical Cumulative Distribution Function",
          grid=true, legend=false)

savefig(p6, "06_ecdf.png")
println("Created: 06_ecdf.png")

# Q-Q Plot (Quantile-Quantile Plot)
println("\n" * "="^60)
println("Q-Q PLOT")
println("="^60)

data = randn(200)

p7 = qqplot(Normal(0, 1), data, xlabel="Theoretical Quantiles",
            ylabel="Sample Quantiles", title="Q-Q Plot (Normal Distribution)",
            grid=true, legend=false, markersize=4)

savefig(p7, "07_qqplot.png")
println("Created: 07_qqplot.png")


# Pair Plot (Scatter Matrix)
println("\n" * "="^60)
println("PAIR PLOT")
println("="^60)

# Generate multivariate data
n = 200
x1 = randn(n)
x2 = x1 .+ randn(n) .* 0.5
x3 = 2 .* x1 .- x2 .+ randn(n) .* 0.3

df = DataFrame(Variable1=x1, Variable2=x2, Variable3=x3)

p8 = @df df cornerplot([:Variable1 :Variable2 :Variable3],
                       grid=true, markersize=2, alpha=0.5)

savefig(p8, "08_pairplot.png")
println("Created: 08_pairplot.png")

# Contour Plot
println("\n" * "="^60)
println("CONTOUR PLOT")
println("="^60)

# Create 2D function
x = range(-3, 3, length=100)
y = range(-3, 3, length=100)
z = [exp(-(xi^2 + yi^2)) for yi in y, xi in x]

p9 = contour(x, y, z, levels=10, fill=true, color=:viridis,
             xlabel="X", ylabel="Y", title="Contour Plot",
             grid=true, colorbar=true)

savefig(p9, "09_contour.png")
println("Created: 09_contour.png")

# 3D Surface Plot
println("\n" * "="^60)
println("3D SURFACE PLOT")
println("="^60)

# Create data
x = range(-5, 5, length=50)
y = range(-5, 5, length=50)
z = [sin(sqrt(xi^2 + yi^2)) for yi in y, xi in x]

p10 = surface(x, y, z, color=:coolwarm, alpha=0.8,
              xlabel="X", ylabel="Y", zlabel="Z",
              title="3D Surface Plot", camera=(30, 30))

savefig(p10, "10_surface3d.png")
println("Created: 10_surface3d.png")

# Customized Plot Example
println("\n" * "="^60)
println("CUSTOMIZED PLOT")
println("="^60)

# Generate data
x = range(0, 10, length=100)
y1 = exp.(-x ./ 10) .* sin.(2 .* x)
y2 = exp.(-x ./ 10) .* cos.(2 .* x)

p11 = plot(x, y1, linewidth=2, color=:blue, label="Damped Sine",
           marker=:circle, markerevery=10, markersize=8,
           xlabel="Time", ylabel="Amplitude",
           title="Damped Oscillations", grid=true, legend=:topright)

plot!(p11, x, y2, linewidth=2, color=:red, linestyle=:dash,
      label="Damped Cosine", marker=:square, markerevery=10, markersize=8)

hline!(p11, [0], color=:black, linewidth=0.5, label="")

savefig(p11, "11_customized.png")
println("Created: 11_customized.png")

# Heatmap
println("\n" * "="^60)
println("HEATMAP")
println("="^60)

# Create correlation matrix
n = 50
data_matrix = randn(n, 4)
data_matrix[:, 2] .+= data_matrix[:, 1] .* 0.5
data_matrix[:, 3] .+= data_matrix[:, 1] .* 0.3
data_matrix[:, 4] .+= data_matrix[:, 2] .* 0.4

cor_matrix = cor(data_matrix)
labels = ["Var1", "Var2", "Var3", "Var4"]

p12 = heatmap(labels, labels, cor_matrix, color=:RdBu, aspect_ratio=1,
              title="Correlation Heatmap", colorbar=true,
              clims=(-1, 1))

savefig(p12, "12_heatmap.png")
println("Created: 12_heatmap.png")

println("\n" * "="^60)
println("SUMMARY")
println("="^60)
println("- Plots.jl is the primary plotting library in Julia")
println("- Supports various plot types: line, scatter, histogram, box, etc.")
println("- layout() creates multiple plots in one figure")
println("- Extensive customization options available")
println("- Can create statistical plots: ECDF, Q-Q plots")
println("- 3D plotting capabilities built-in")
println("="^60)
println("\nAll plots saved successfully!")
