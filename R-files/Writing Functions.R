# 1. Cube Function ---------------------------------------

cube <- function(x) x^3

# Examples
print(cube(1:10))

m <- matrix(1:8, nrow = 2, ncol = 4)
print(cube(m))

m2 <- matrix(cube(1:8), 2, 4)
print(m2)

a <- array(1:24, dim = c(2, 3, 4))
print(cube(a))

print(mode(cube))


# 2. Robust Loss Functions ---------------------------------

psi.1 <- function(x) {
  ifelse(x^2 > 1, 2 * abs(x) - 1, x^2)
}

psi.2 <- function(x, c = 1) {
  ifelse(x^2 > c^2, 2 * c * abs(x) - c^2, x^2)
}

psi.3 <- function(x, c = 1) {
  stopifnot(length(c) == 1, c > 0)
  ifelse(x^2 > c^2, 2 * c * abs(x) - c^2, x^2)
}

# Examples
z <- c(-3, -1, 0, 1, 3)

identical(psi.1(z), psi.2(z, c = 1))
identical(psi.2(z, c = 1), psi.2(z))
identical(psi.2(x = z, c = 2), psi.2(c = 2, x = z))
print(psi.2(x = z, c = c(1, 1, 1, 10, 1)))
print(psi.2(x = z, c = -1))   # returns NaN for invalid c


# 3. Scoping Example -----------------------------------------

x <- 7
y <- c("A", "C", "G", "T", "U")

adder <- function(y) {
  x <<- x + y   # modifies global x
  return(x)
}

print(adder(1))


# 4. Circle Area Function -------------------------------------

circle.area <- function(r) {
  pi * r^2
}

print(circle.area(c(1, 2, 3)))

truepi <- pi
pi <- 3
print(circle.area(c(1, 2, 3)))

pi <- truepi
print(circle.area(c(1, 2, 3)))


# 5. Fibonacci Function ---------------------------------------

fib <- function(n) {
  if (n == 0 || n == 1) {
    return(1)
  } else {
    fib(n - 1) + fib(n - 2)
  }
}

print(fib(6))


# 6. Predicting From a Power-Law Model ------------------------

predict_plm <- function(model, newdata) {
  stopifnot("a" %in% names(model), "y0" %in% names(model))
  stopifnot(is.numeric(model$a), is.numeric(model$y0))

  newdata <- as.numeric(newdata)
  model$y0 * newdata^model$a
}

mod <- list(a = 0.15, y0 = 6611)
print(predict_plm(mod, c(10, 100, 1000)))




