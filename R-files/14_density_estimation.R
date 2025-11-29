# Histograms, KDE, and bivariate KDE using the 'faithful' dataset

# Load data
data(faithful)  # built-in Old Faithful geyser data (eruptions, waiting)

# 1) Histogram with custom breaks
x0 <- 0; x1 <- 8; h <- 0.5
my.breaks <- seq(from = x0, to = x1, by = h)
myhist <- hist(faithful$eruptions, breaks = my.breaks, right = FALSE, plot = FALSE)
plot(myhist$mids, myhist$density, type = "s", xlab = "Eruption length",
     ylab = "Density", main = "Histogram of Eruption Lengths")

# 2) Histogram using built-in rules (Freedman-Diaconis)
hist(faithful$eruptions, breaks = "FD", main = "Histogram (FD rule)", xlab = "Eruption length")

# 3) Kernel density estimate (1D)
d <- density(faithful$eruptions)  # default bandwidth
plot(d, main = "Kernel Density Estimate (default bandwidth)")
# Compare different bandwidths
lines(density(faithful$eruptions, bw = 0.2), col = "blue")
lines(density(faithful$eruptions, bw = 1.0), col = "red")
legend("topright", legend = c("default", "bw=0.2", "bw=1.0"), col = c("black","blue","red"), lwd = 1)

# 4) Bivariate density estimate (contour) using MASS::kde2d
if(!require(MASS)) install.packages("MASS", repos = "https://cloud.r-project.org"); library(MASS)
ks <- kde2d(faithful$eruptions, faithful$waiting, n = 50)
contour(ks, xlab = "Eruption", ylab = "Waiting time", main = "2D Kernel Density (contour)")
points(faithful$eruptions, faithful$waiting, pch = 19, cex = 0.6)