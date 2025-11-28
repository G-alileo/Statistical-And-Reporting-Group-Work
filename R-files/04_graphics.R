# Graphics - R Implementation
# ===========================
# This file demonstrates concepts covered in the Graphics Statistical Computing:
# - Basic plotting with base R
# - Histograms
# - Scatter plots
# - Box plots
# - Multiple plots and layout
# - Plot customization
# - Statistical visualizations

# Set random seed for reproducibility
set.seed(42)

# ==============================================================================
# Basic Plotting
# ==============================================================================

cat(rep("=", 60), "\n", sep = "")
cat("BASIC PLOTTING\n")
cat(rep("=", 60), "\n", sep = "")

# Simple line plot
png("01_sine_wave.png", width = 1500, height = 900, res = 150)
x <- seq(0, 2*pi, length.out = 100)
y <- sin(x)

plot(x, y, type = "l", col = "blue", lwd = 2,
     xlab = "x", ylab = "sin(x)", main = "Sine Wave")
grid()
dev.off()
cat("Created: 01_sine_wave.png\n")

# ==============================================================================
# Histograms
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("HISTOGRAMS\n")
cat(rep("=", 60), "\n", sep = "")

# Generate random data
data <- rnorm(1000)

png("02_histogram.png", width = 1500, height = 900, res = 150)
hist(data, breaks = 30, freq = FALSE, col = "lightblue", 
     border = "black", xlab = "Value", ylab = "Density",
     main = "Histogram of Normal Distribution")
grid()

# Add normal curve
mu <- mean(data)
sigma <- sd(data)
x_norm <- seq(min(data), max(data), length.out = 100)
lines(x_norm, dnorm(x_norm, mu, sigma), col = "red", lwd = 2)
legend("topright", legend = "Normal fit", col = "red", lwd = 2)
dev.off()
cat("Created: 02_histogram.png\n")

# ==============================================================================
# Scatter Plots
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("SCATTER PLOTS\n")
cat(rep("=", 60), "\n", sep = "")

# Generate correlated data
n <- 100
x <- rnorm(n)
y <- 2*x + rnorm(n)*0.5

png("03_scatter_plot.png", width = 1500, height = 900, res = 150)
plot(x, y, pch = 19, col = rgb(0, 0, 1, 0.6),
     xlab = "X", ylab = "Y", main = "Scatter Plot with Correlation")
grid()

# Add regression line
fit <- lm(y ~ x)
abline(fit, col = "red", lwd = 2, lty = 2)
legend("topleft", 
       legend = sprintf("y = %.2fx + %.2f", coef(fit)[2], coef(fit)[1]),
       col = "red", lwd = 2, lty = 2)
dev.off()
cat("Created: 03_scatter_plot.png\n")

# ==============================================================================
# Box Plots
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("BOX PLOTS\n")
cat(rep("=", 60), "\n", sep = "")

# Generate data for multiple groups
group1 <- rnorm(100, mean = 100, sd = 10)
group2 <- rnorm(100, mean = 110, sd = 15)
group3 <- rnorm(100, mean = 95, sd = 12)
group4 <- rnorm(100, mean = 105, sd = 8)

data_groups <- list("Group A" = group1, "Group B" = group2, 
                    "Group C" = group3, "Group D" = group4)

png("04_boxplot.png", width = 1500, height = 900, res = 150)
boxplot(data_groups, col = "lightblue", border = "blue",
        ylab = "Values", main = "Box Plot Comparison",
        medcol = "red", medlwd = 2)
grid()
dev.off()
cat("Created: 04_boxplot.png\n")

# ==============================================================================
# Multiple Plots (par with mfrow)
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("MULTIPLE PLOTS (SUBPLOTS)\n")
cat(rep("=", 60), "\n", sep = "")

png("05_subplots.png", width = 1800, height = 1500, res = 150)
par(mfrow = c(2, 2))

# Plot 1: Line plot
x <- seq(0, 10, length.out = 100)
plot(x, sin(x), type = "l", col = "blue", lwd = 2,
     xlab = "x", ylab = "y", main = "Trigonometric Functions")
lines(x, cos(x), col = "red", lwd = 2, lty = 2)
legend("topright", legend = c("sin(x)", "cos(x)"), 
       col = c("blue", "red"), lwd = 2, lty = c(1, 2))
grid()

# Plot 2: Histogram
data <- rexp(1000, rate = 0.5)
hist(data, breaks = 30, freq = FALSE, col = "lightgreen", 
     border = "black", xlab = "Value", ylab = "Density",
     main = "Exponential Distribution")
grid()

# Plot 3: Scatter plot
x <- rnorm(200)
y <- rnorm(200)
colors <- rainbow(200)
plot(x, y, pch = 19, col = colors,
     xlab = "X", ylab = "Y", main = "Colored Scatter Plot")
grid()

# Plot 4: Bar plot
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)
barplot(values, names.arg = categories, col = "orange", 
        border = "black", xlab = "Category", ylab = "Value",
        main = "Bar Chart")
grid()

par(mfrow = c(1, 1))
dev.off()
cat("Created: 05_subplots.png\n")

# ==============================================================================
# Empirical Cumulative Distribution Function (ECDF)
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("ECDF PLOT\n")
cat(rep("=", 60), "\n", sep = "")

data <- rnorm(200)

png("06_ecdf.png", width = 1500, height = 900, res = 150)
plot(ecdf(data), lwd = 2, main = "Empirical Cumulative Distribution Function",
     xlab = "Value", ylab = "ECDF")
grid()
dev.off()
cat("Created: 06_ecdf.png\n")

# ==============================================================================
# Q-Q Plot (Quantile-Quantile Plot)
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("Q-Q PLOT\n")
cat(rep("=", 60), "\n", sep = "")

data <- rnorm(200)

png("07_qqplot.png", width = 1500, height = 900, res = 150)
qqnorm(data, pch = 19, col = "blue")
qqline(data, col = "red", lwd = 2)
grid()
dev.off()
cat("Created: 07_qqplot.png\n")

# ==============================================================================
# Pair Plot (Scatter Matrix)
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("PAIR PLOT\n")
cat(rep("=", 60), "\n", sep = "")

# Generate multivariate data
n <- 200
x1 <- rnorm(n)
x2 <- x1 + rnorm(n)*0.5
x3 <- 2*x1 - x2 + rnorm(n)*0.3

data_matrix <- data.frame(Var1 = x1, Var2 = x2, Var3 = x3)

png("08_pairplot.png", width = 1800, height = 1800, res = 150)
pairs(data_matrix, pch = 19, col = rgb(0, 0, 1, 0.5),
      main = "Pair Plot")
dev.off()
cat("Created: 08_pairplot.png\n")

# ==============================================================================
# Contour Plot
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("CONTOUR PLOT\n")
cat(rep("=", 60), "\n", sep = "")

# Create 2D function
x <- seq(-3, 3, length.out = 100)
y <- seq(-3, 3, length.out = 100)
z <- outer(x, y, function(x, y) exp(-(x^2 + y^2)))

png("09_contour.png", width = 1500, height = 1200, res = 150)
contour(x, y, z, nlevels = 10, col = terrain.colors(10),
        xlab = "X", ylab = "Y", main = "Contour Plot")
grid()
dev.off()
cat("Created: 09_contour.png\n")

# ==============================================================================
# 3D Surface Plot
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("3D SURFACE PLOT\n")
cat(rep("=", 60), "\n", sep = "")

# Create data
x <- seq(-5, 5, length.out = 50)
y <- seq(-5, 5, length.out = 50)
z <- outer(x, y, function(x, y) sin(sqrt(x^2 + y^2)))

png("10_surface3d.png", width = 1800, height = 1200, res = 150)
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      xlab = "X", ylab = "Y", zlab = "Z", main = "3D Surface Plot",
      shade = 0.4, ticktype = "detailed")
dev.off()
cat("Created: 10_surface3d.png\n")

# ==============================================================================
# Customized Plot Example
# ==============================================================================

cat("\n", rep("=", 60), "\n", sep = "")
cat("CUSTOMIZED PLOT\n")
cat(rep("=", 60), "\n", sep = "")

# Generate data
x <- seq(0, 10, length.out = 100)
y1 <- exp(-x/10) * sin(2*x)
y2 <- exp(-x/10) * cos(2*x)

png("11_customized.png", width = 1800, height = 900, res = 150)
plot(x, y1, type = "l", col = "blue", lwd = 2,
     xlab = "Time", ylab = "Amplitude", main = "Damped Oscillations",
     font.lab = 2, font.main = 2, cex.lab = 1.2, cex.main = 1.3,
     ylim = range(c(y1, y2)))

# Add points at intervals
points(x[seq(1, length(x), by = 10)], y1[seq(1, length(x), by = 10)],
       pch = 19, col = "lightblue", cex = 1.5)

# Second line
lines(x, y2, col = "red", lwd = 2, lty = 2)
points(x[seq(1, length(x), by = 10)], y2[seq(1, length(x), by = 10)],
       pch = 15, col = "lightcoral", cex = 1.5)

# Reference line
abline(h = 0, col = "black", lwd = 1)

# Legend
legend("topright", legend = c("Damped Sine", "Damped Cosine"),
       col = c("blue", "red"), lwd = 2, lty = c(1, 2),
       pch = c(19, 15), pt.cex = 1.5)

# Grid
grid(lty = 3, col = "gray")

dev.off()
cat("Created: 11_customized.png\n")

cat("\n", rep("=", 60), "\n", sep = "")
cat("SUMMARY\n")
cat(rep("=", 60), "\n", sep = "")
cat("- Base R graphics provides powerful plotting capabilities\n")
cat("- Supports various plot types: line, scatter, histogram, box, etc.\n")
cat("- par(mfrow) creates multiple plots in one figure\n")
cat("- Extensive customization options available\n")
cat("- Statistical plots: ECDF (plot.ecdf), Q-Q (qqnorm/qqline)\n")
cat("- 3D plotting with persp() function\n")
cat(rep("=", 60), "\n", sep = "")
cat("\nAll plots saved successfully!\n")
