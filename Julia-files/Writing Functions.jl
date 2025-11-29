using Statistics

# 1. Cube Function ----------------------------------------

cube(x) = x.^3

println(cube(1:10))

m = reshape(1:8, 2, 4)   # Julia fills column-major like R
println(cube(m))

m2 = reshape(cube(1:8), 2, 4)
println(m2)

a = reshape(1:24, 2, 3, 4)
println(cube(a))

println(typeof(cube))


# 2. Robust Loss Functions ---------------------------------

psi1(x) = x.^2 .> 1 ? 2 .* abs.(x) .- 1 : x.^2

psi2(x; c=1) = x.^2 .> c^2 ? 2c .* abs.(x) .- c^2 : x.^2

function psi3(x; c=1)
    @assert c > 0 "c must be positive"
    @assert length(c) == 1 "c must be scalar"
    return x.^2 .> c^2 ? 2c .* abs.(x) .- c^2 : x.^2
end

z = [-3, -1, 0, 1, 3]

println(psi1.(z) == psi2.(z, c=1))
println(psi2.(z, c=1) == psi2.(z))
println(psi2.(z, c=2) == psi2.(z, c=2))

println(psi2.(z, c=[1,1,1,10,1]))


# 3. Scoping Example ----------------------------------------

global x = 7
y = ["A","C","G","T","U"]

function adder(y)
    global x
    x = x + y
    return x
end

println(adder(1))


# 4. Circle Area Function ------------------------------------

circle_area(r) = π .* r.^2

println(circle_area([1,2,3]))

realpi = π
π = 3
println(circle_area([1,2,3]))

π = realpi
println(circle_area([1,2,3]))


# 5. Recursive Fibonacci ---------------------------------------

function fib(n)
    n == 0 || n == 1 ? 1 : fib(n-1) + fib(n-2)
end

println(fib(6))


# 6. Predicting From Power-Law Model ---------------------------

function predict_plm(model::Dict, newdata)
    @assert haskey(model, "a") && haskey(model, "y0")
    a = model["a"]
    y0 = model["y0"]
    return y0 .* newdata.^a
end

mod = Dict("a"=>0.15, "y0"=>6611)
println(predict_plm(mod, [10, 100, 1000]))

