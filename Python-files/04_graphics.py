"""
This file demonstrates concepts covered in the Graphics Statistical Computing:
- Basic plotting with matplotlib
- Histograms
- Scatter plots
- Box plots
- Multiple plots and subplots
- Plot customization
- Statistical visualizations
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

# Set random seed for reproducibility
np.random.seed(42)

# Basic Plotting
print("=" * 60)
print("BASIC PLOTTING")
print("=" * 60)

# Simple line plot
x = np.linspace(0, 2*np.pi, 100)
y = np.sin(x)

plt.figure(figsize=(10, 6))
plt.plot(x, y, 'b-', linewidth=2)
plt.xlabel('x')
plt.ylabel('sin(x)')
plt.title('Sine Wave')
plt.grid(True)
plt.savefig('01_sine_wave.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 01_sine_wave.png")

# Histograms
print("\n" + "=" * 60)
print("HISTOGRAMS")
print("=" * 60)

# Generate random data
data = np.random.randn(1000)

plt.figure(figsize=(10, 6))
plt.hist(data, bins=30, density=True, alpha=0.7, color='blue', edgecolor='black')
plt.xlabel('Value')
plt.ylabel('Density')
plt.title('Histogram of Normal Distribution')
plt.grid(True, alpha=0.3)

# Add normal curve
mu, sigma = data.mean(), data.std()
x_norm = np.linspace(data.min(), data.max(), 100)
plt.plot(x_norm, stats.norm.pdf(x_norm, mu, sigma), 'r-', linewidth=2, label='Normal fit')
plt.legend()

plt.savefig('02_histogram.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 02_histogram.png")


# Scatter Plots
print("\n" + "=" * 60)
print("SCATTER PLOTS")
print("=" * 60)

# Generate correlated data
n = 100
x = np.random.randn(n)
y = 2*x + np.random.randn(n)*0.5

plt.figure(figsize=(10, 6))
plt.scatter(x, y, alpha=0.6, s=50, edgecolors='black', linewidth=0.5)
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Scatter Plot with Correlation')
plt.grid(True, alpha=0.3)

# Add regression line
slope, intercept = np.polyfit(x, y, 1)
x_line = np.linspace(x.min(), x.max(), 100)
plt.plot(x_line, slope*x_line + intercept, 'r--', linewidth=2, label=f'y = {slope:.2f}x + {intercept:.2f}')
plt.legend()

plt.savefig('03_scatter_plot.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 03_scatter_plot.png")


# Box Plots
print("\n" + "=" * 60)
print("BOX PLOTS")
print("=" * 60)

# Generate data for multiple groups
group1 = np.random.normal(100, 10, 100)
group2 = np.random.normal(110, 15, 100)
group3 = np.random.normal(95, 12, 100)
group4 = np.random.normal(105, 8, 100)

data_groups = [group1, group2, group3, group4]
labels = ['Group A', 'Group B', 'Group C', 'Group D']

plt.figure(figsize=(10, 6))
plt.boxplot(data_groups, labels=labels, patch_artist=True,
            boxprops=dict(facecolor='lightblue', color='blue'),
            medianprops=dict(color='red', linewidth=2),
            whiskerprops=dict(color='blue'),
            capprops=dict(color='blue'))
plt.ylabel('Values')
plt.title('Box Plot Comparison')
plt.grid(True, alpha=0.3, axis='y')
plt.savefig('04_boxplot.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 04_boxplot.png")


# Multiple Plots (Subplots)
print("\n" + "=" * 60)
print("MULTIPLE PLOTS (SUBPLOTS)")
print("=" * 60)

fig, axes = plt.subplots(2, 2, figsize=(12, 10))

# Plot 1: Line plot
x = np.linspace(0, 10, 100)
axes[0, 0].plot(x, np.sin(x), 'b-', label='sin(x)')
axes[0, 0].plot(x, np.cos(x), 'r--', label='cos(x)')
axes[0, 0].set_title('Trigonometric Functions')
axes[0, 0].set_xlabel('x')
axes[0, 0].set_ylabel('y')
axes[0, 0].legend()
axes[0, 0].grid(True, alpha=0.3)

# Plot 2: Histogram
data = np.random.exponential(2, 1000)
axes[0, 1].hist(data, bins=30, density=True, alpha=0.7, color='green', edgecolor='black')
axes[0, 1].set_title('Exponential Distribution')
axes[0, 1].set_xlabel('Value')
axes[0, 1].set_ylabel('Density')
axes[0, 1].grid(True, alpha=0.3)

# Plot 3: Scatter plot
x = np.random.randn(200)
y = np.random.randn(200)
colors = np.random.rand(200)
axes[1, 0].scatter(x, y, c=colors, cmap='viridis', alpha=0.6, s=30)
axes[1, 0].set_title('Colored Scatter Plot')
axes[1, 0].set_xlabel('X')
axes[1, 0].set_ylabel('Y')
axes[1, 0].grid(True, alpha=0.3)

# Plot 4: Bar plot
categories = ['A', 'B', 'C', 'D', 'E']
values = [23, 45, 56, 78, 32]
axes[1, 1].bar(categories, values, color='orange', edgecolor='black')
axes[1, 1].set_title('Bar Chart')
axes[1, 1].set_xlabel('Category')
axes[1, 1].set_ylabel('Value')
axes[1, 1].grid(True, alpha=0.3, axis='y')

plt.tight_layout()
plt.savefig('05_subplots.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 05_subplots.png")

# Empirical Cumulative Distribution Function (ECDF)
print("\n" + "=" * 60)
print("ECDF PLOT")
print("=" * 60)

data = np.random.randn(200)
data_sorted = np.sort(data)
ecdf = np.arange(1, len(data_sorted)+1) / len(data_sorted)

plt.figure(figsize=(10, 6))
plt.step(data_sorted, ecdf, where='post', linewidth=2)
plt.xlabel('Value')
plt.ylabel('ECDF')
plt.title('Empirical Cumulative Distribution Function')
plt.grid(True, alpha=0.3)
plt.savefig('06_ecdf.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 06_ecdf.png")

# Q-Q Plot (Quantile-Quantile Plot)
print("\n" + "=" * 60)
print("Q-Q PLOT")
print("=" * 60)

data = np.random.randn(200)

plt.figure(figsize=(10, 6))
stats.probplot(data, dist="norm", plot=plt)
plt.title('Q-Q Plot (Normal Distribution)')
plt.grid(True, alpha=0.3)
plt.savefig('07_qqplot.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 07_qqplot.png")


# Pair Plot (Scatter Matrix)
print("\n" + "=" * 60)
print("PAIR PLOT")
print("=" * 60)

# Generate multivariate data
n = 200
x1 = np.random.randn(n)
x2 = x1 + np.random.randn(n)*0.5
x3 = 2*x1 - x2 + np.random.randn(n)*0.3

data_matrix = np.column_stack([x1, x2, x3])
var_names = ['Variable 1', 'Variable 2', 'Variable 3']

fig, axes = plt.subplots(3, 3, figsize=(12, 12))

for i in range(3):
    for j in range(3):
        if i == j:
            # Diagonal: histogram
            axes[i, j].hist(data_matrix[:, i], bins=20, color='lightblue', edgecolor='black')
            axes[i, j].set_ylabel('Frequency')
        else:
            # Off-diagonal: scatter plot
            axes[i, j].scatter(data_matrix[:, j], data_matrix[:, i], alpha=0.5, s=20)
        
        if i == 2:
            axes[i, j].set_xlabel(var_names[j])
        if j == 0:
            axes[i, j].set_ylabel(var_names[i])

plt.tight_layout()
plt.savefig('08_pairplot.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 08_pairplot.png")

# Contour Plot
print("\n" + "=" * 60)
print("CONTOUR PLOT")
print("=" * 60)

# Create 2D function
x = np.linspace(-3, 3, 100)
y = np.linspace(-3, 3, 100)
X, Y = np.meshgrid(x, y)
Z = np.exp(-(X**2 + Y**2))

plt.figure(figsize=(10, 8))
contour = plt.contour(X, Y, Z, levels=10, cmap='viridis')
plt.colorbar(contour, label='Z value')
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Contour Plot')
plt.grid(True, alpha=0.3)
plt.savefig('09_contour.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 09_contour.png")

# 3D Surface Plot
print("\n" + "=" * 60)
print("3D SURFACE PLOT")
print("=" * 60)

from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure(figsize=(12, 8))
ax = fig.add_subplot(111, projection='3d')

# Create data
x = np.linspace(-5, 5, 50)
y = np.linspace(-5, 5, 50)
X, Y = np.meshgrid(x, y)
Z = np.sin(np.sqrt(X**2 + Y**2))

# Plot surface
surf = ax.plot_surface(X, Y, Z, cmap='coolwarm', alpha=0.8)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('3D Surface Plot')
fig.colorbar(surf, shrink=0.5, aspect=5)

plt.savefig('10_surface3d.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 10_surface3d.png")

# Customized Plot Example
print("\n" + "=" * 60)
print("CUSTOMIZED PLOT")
print("=" * 60)

# Generate data
x = np.linspace(0, 10, 100)
y1 = np.exp(-x/10) * np.sin(2*x)
y2 = np.exp(-x/10) * np.cos(2*x)

plt.figure(figsize=(12, 6))

# Plot with custom styling
plt.plot(x, y1, 'b-', linewidth=2, label='Damped Sine', marker='o', 
         markevery=10, markersize=8, markerfacecolor='lightblue')
plt.plot(x, y2, 'r--', linewidth=2, label='Damped Cosine', marker='s',
         markevery=10, markersize=8, markerfacecolor='lightcoral')

# Customization
plt.xlabel('Time', fontsize=14, fontweight='bold')
plt.ylabel('Amplitude', fontsize=14, fontweight='bold')
plt.title('Damped Oscillations', fontsize=16, fontweight='bold')
plt.legend(loc='upper right', fontsize=12, framealpha=0.9)
plt.grid(True, linestyle=':', alpha=0.5)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.xlim([0, 10])

plt.savefig('11_customized.png', dpi=150, bbox_inches='tight')
plt.close()
print("Created: 11_customized.png")

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print("- matplotlib is the primary plotting library in Python")
print("- Supports various plot types: line, scatter, histogram, box, etc.")
print("- subplot() creates multiple plots in one figure")
print("- Extensive customization options available")
print("- Can create statistical plots: ECDF, Q-Q plots")
print("- 3D plotting capabilities with mplot3d")
print("=" * 60)
print("\nAll plots saved successfully!")
