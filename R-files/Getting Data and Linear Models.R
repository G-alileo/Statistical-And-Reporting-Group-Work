# --- Reading Data ---
data <- read.csv("data.csv")

head(data)
str(data)
summary(data)

# --- Fitting Linear Model ---
model <- lm(y ~ x, data = data)
summary(model)

# --- Predictions ---
new_x <- data.frame(x = c(2, 5, 8))
predictions <- predict(model, newdata = new_x)
print(predictions)

# --- Plotting Regression Line ---
plot(data$x, data$y,
     pch = 19, col = "gray",
     xlab = "x", ylab = "y",
     main = "Linear Regression")

abline(model, col = "blue", lwd = 2)
