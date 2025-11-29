using CSV, DataFrames, Statistics, GLM, Plots

# --- Read CSV File ---
data = CSV.read("data.csv", DataFrame)

println(first(data, 5))
println(describe(data))


# --- Fit Linear Regression Model ---
model = lm(@formula(y ~ x), data)

println(model)


# --- Predictions ---
newx = DataFrame(x = [2, 5, 8])
predictions = predict(model, newx)

println(predictions)


# --- Plot with Regression Line ---
scatter(data.x, data.y,
    xlabel = "x",
    ylabel = "y",
    title = "Linear Regression",
    legend = false,
    markersize = 5)

xrange = range(minimum(data.x), maximum(data.x), length=100)
yrange = predict(model, DataFrame(x = xrange))

plot!(xrange, yrange, lw = 3, color = :blue)

