# Histograms, KDE, and bivariate KDE in Python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from scipy.stats import gaussian_kde

# Load faithful dataset from seaborn or create if not available
# seaborn has 'geyser' in some versions; else we simulate or load from a CSV
try:
    df = sns.load_dataset('geyser')  # may not exist in all seaborn versions
    eruptions = df['eruption']
    waiting = df['waiting']
except Exception:
    # simulate similar data or ask user to provide CSV
    np.random.seed(123)
    n = 272
    eruptions = np.random.exponential(scale=1.0, size=n) * 1.5 + 1
    waiting = np.random.normal(loc=70, scale=15, size=n)
    df = pd.DataFrame({'eruptions': eruptions, 'waiting': waiting})

# 1) Histogram with custom bins
bins = np.arange(0, 8.5, 0.5)
plt.step((bins[:-1] + bins[1:]) / 2, np.histogram(df['eruptions'], bins=bins, density=True)[0], where='mid')
plt.xlabel('Eruption length')
plt.ylabel('Density')
plt.title('Histogram of Eruption Lengths')
plt.show()

# 2) Freedman-Diaconis rule (numpy/scipy can compute IQR)
from scipy.stats import iqr
bw_fd = 2 * iqr(df['eruptions']) / (len(df) ** (1/3))
print('Freedman-Diaconis bin width:', bw_fd)

# 3) Kernel Density Estimate (1D) using scipy gaussian_kde
kde = gaussian_kde(df['eruptions'])
xs = np.linspace(df['eruptions'].min(), df['eruptions'].max(), 200)
plt.plot(xs, kde(xs), label='KDE (default)')
# adjust bandwidth by scaling the covariance
kde_bw_small = gaussian_kde(df['eruptions'], bw_method=0.2)
kde_bw_large = gaussian_kde(df['eruptions'], bw_method=1.0)
plt.plot(xs, kde_bw_small(xs), label='bw=0.2')
plt.plot(xs, kde_bw_large(xs), label='bw=1.0')
plt.legend()
plt.title('Kernel Density Estimates (different bandwidths)')
plt.show()

# 4) Bivariate KDE (contour) using scipy; use seaborn.kdeplot for convenience
plt.figure()
sns.kdeplot(x=df['eruptions'], y=df['waiting'], cmap='Blues', fill=False, thresh=0.05)
plt.scatter(df['eruptions'], df['waiting'], s=15)
plt.title('2D Kernel Density (contour)')
plt.xlabel('Eruption')
plt.ylabel('Waiting')
plt.show()