# Load packages
if(!require(SemiPar)) install.packages("SemiPar", repos = "https://cloud.r-project.org"); library(SemiPar)

# Load data
data(lidar)

# Set up 10-fold indices
set.seed(123)
K <- 10
n <- nrow(lidar)
foldid <- sample(rep(1:K, length = n))

# Example: pick fold 1 as test, rest as training
lidar.train <- subset(lidar, foldid != 1)
lidar.test <- subset(lidar, foldid == 1)

# Quick plot of training data
plot(lidar.train$range, lidar.train$logratio, main = "Lidar Data (training)", xlab = "range", ylab = "logratio")

# Fit a loess smoother on training data
obj0 <- loess(logratio ~ range, data = lidar.train, control = loess.control(surface = 'direct'))
lines(sort(lidar.train$range), predict(obj0, newdata = data.frame(range = sort(lidar.train$range))), col = 'blue')

# Simple manual 10-fold cross-validation for a linear model as example
library(stats)
cv_mse <- numeric(K)
for(k in 1:K){
train_k <- subset(lidar, foldid != k)
test_k <- subset(lidar, foldid == k)
fit_k <- lm(logratio ~ range, data = train_k)
preds <- predict(fit_k, newdata = test_k)
cv_mse[k] <- mean((test_k$logratio - preds)^2)
}
cat('Average CV MSE (linear fit):', mean(cv_mse), '\n')