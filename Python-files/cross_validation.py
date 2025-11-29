# cross_validation.py
# Python version: 10-fold CV example with a loess-like fit (polynomial pipeline used for smoothing)
import numpy as np
import pandas as pd
from sklearn.model_selection import KFold
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
from sklearn.pipeline import make_pipeline
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt

# (DATA)
# The original slides used the 'lidar' dataset. If you have the actual CSV, load it with pd.read_csv.
# For a standalone example we simulate a lidar-like relationship.
np.random.seed(123)
n = 200
range_vals = np.linspace(0, 100, n)
logratio = np.sin(range_vals / 10) + np.random.normal(0, 0.2, n)
lidar = pd.DataFrame({'range': range_vals, 'logratio': logratio})

# 10-fold CV (example using polynomial regression as a loess-like smoother)
K = 10
kf = KFold(n_splits=K, shuffle=True, random_state=123)
mse_scores = []
for train_index, test_index in kf.split(lidar):
train = lidar.iloc[train_index]
test = lidar.iloc[test_index]
# polynomial degree 3 gives a smooth curve similar to a loess fit (simple replacement)
model = make_pipeline(PolynomialFeatures(3), LinearRegression())
model.fit(train[['range']], train['logratio'])
preds = model.predict(test[['range']])
mse_scores.append(mean_squared_error(test['logratio'], preds))


print('Average CV MSE (poly deg 3):', np.mean(mse_scores))


# Plot data and fitted smooth on full data for visualization
plt.scatter(lidar['range'], lidar['logratio'], s=12, label='data')
# Fit on full data for plotting
full_model = make_pipeline(PolynomialFeatures(3), LinearRegression())
full_model.fit(lidar[['range']], lidar['logratio'])
xx = np.linspace(lidar['range'].min(), lidar['range'].max(), 300).reshape(-1, 1)
yy = full_model.predict(xx)
plt.plot(xx, yy, label='poly smooth (deg 3)', linewidth=2)
plt.title('Lidar data (python)')
plt.xlabel('range')
plt.ylabel('logratio')
plt.legend()
plt.show()