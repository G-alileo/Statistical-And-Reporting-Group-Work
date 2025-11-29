using Optim
using ForwardDiff
using Plots

# 1. UNIVARIATE OPTIMISATION

println("--------------------------------------------------")
println("Univariate Optimisation")
println("--------------------------------------------------")

# Simple quadratic function
f1(x) = (x - 3)^2 + 2

# Minimization over interval
result1 = optimize(f1, -10, 10)

println("Minimum value of f1(x): ", Optim.minimum(result1))
println("At x = ", Optim.minimizer(result1))


# 2. NUMERICAL DERIVATIVE (CENTRAL DIFFERENCE)

println("\n--------------------------------------------------")
println("Gradient (Central Difference)")
println("--------------------------------------------------")

function grad_central(f, x; h=1e-6)
    return (f(x + h) - f(x - h)) / (2h)
end

f2(x) = x^2 + 2x + 1

println("Gradient of f2 at x = 3 : ", grad_central(f2, 3))


# 3. MULTIVARIATE OPTIMISATION

println("\n--------------------------------------------------")
println("Multivariate Optimisation")
println("--------------------------------------------------")

f3(x) = (x[1] - 1)^2 + (x[2] - 2)^2

x0 = [0.0, 0.0]

result2 = optimize(f3, x0)

println("Minimum value: ", Optim.minimum(result2))
println("Optimal point: ", Optim.minimizer(result2))


# 4. OPTIMISATION WITH ANALYTIC GRADIENT (BFGS)

println("\n--------------------------------------------------")
println("Optimisation with BFGS (Analytic Gradient)")
println("--------------------------------------------------")

f4(x) = (x[1] - 1)^2 + (x[2] - 2)^2
grad4(x) = [2*(x[1]-1), 2*(x[2]-2)]

x0_bfgs = [0.0, 0.0]

result3 = optimize(f4, grad4, x0_bfgs, BFGS())

println("Minimum value: ", Optim.minimum(result3))
println("Optimal point: ", Optim.minimizer(result3))


# 5. BOX-CONSTRAINED OPTIMISATION

println("\n--------------------------------------------------")
println("Constrained Optimisation (Bounded)")
println("--------------------------------------------------")

f5(x) = (x - 3)^2 + 2

lower = [0.0]
upper = [5.0]

result4 = optimize(f5, lower, upper)

println("Minimum value: ", Optim.minimum(result4))
println("At x = ", Optim.minimizer(result4))


# 6. NONLINEAR FUNCTION OPTIMISATION

println("\n--------------------------------------------------")
println("Nonlinear Function Optimisation")
println("--------------------------------------------------")

f6(x) = sin(x) + 0.1x

result5 = optimize(f6, -10, 10)

println("Minimum value: ", Optim.minimum(result5))
println("At x = ", Optim.minimizer(result5))

