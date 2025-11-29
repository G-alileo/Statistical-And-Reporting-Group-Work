# Python Files - Statistical Computing Implementation

## Overview

This directory contains Python implementations of statistical computing concepts, leveraging Python's rich ecosystem of scientific computing libraries for data analysis and visualization.

## 📁 File Structure

| File                                   | Topic               | Description                                                | Status      |
| -------------------------------------- | ------------------- | ---------------------------------------------------------- | ----------- |
| `01_basics_of_data.py`                 | Data Fundamentals   | Data types, operators, variables, vectors, NumPy basics    | ✅ Complete |
| `02_arrays_and_dataframes.py`          | Data Structures     | NumPy arrays, Pandas DataFrames, data manipulation         | ✅ Complete |
| `03_control_flow_and_strings.py`       | Control & Strings   | Conditionals, loops, comprehensions, regex, string methods | ✅ Complete |
| `04_graphics.py`                       | Visualization       | Matplotlib/Seaborn graphics, statistical plots, 3D plots   | ✅ Complete |
| `05_writing_functions.py`              | Functions           | Function definitions, decorators, lambda functions         | ✅ Complete |
| `06_getting_data_and_linear_models.py` | Data & Models       | Data I/O, linear regression, scikit-learn models           | ✅ Complete |
| `07_distributions.py`                  | Distributions       | SciPy distributions, sampling, hypothesis testing          | ✅ Complete |
| `08_optimisation_1.py`                 | Optimization I      | SciPy optimize, gradient methods, minimization             | ✅ Complete |
| `09_optimisation_2.py`                 | Optimization II     | Constrained optimization, advanced methods                 | ✅ Complete |
| `10_simulation.py`                     | Simulation          | Monte Carlo, random processes, simulation studies          | ✅ Complete |
| `11_mcmc_I.py`                         | MCMC I              | Markov Chain Monte Carlo, Metropolis-Hastings              | ✅ Complete |
| `13_cross_validation.py`               | Cross-Validation    | Model validation, k-fold CV, scikit-learn metrics          | ✅ Complete |
| `14_density_estimation.py`             | Density Estimation  | KDE, histogram methods, bandwidth selection                | ✅ Complete |
| `15_bayesian_statistics.py`            | Bayesian Methods    | Bayesian inference, PyMC3/Stan integration                 | ✅ Complete |
| `17_mcmc_II.py`                        | MCMC II             | Advanced MCMC, Gibbs sampling, diagnostics                 | ✅ Complete |
| `18_permutation_tests.py`              | Permutation Tests   | Non-parametric tests, bootstrap, resampling                | ✅ Complete |
| `19_databases.py`                      | Database Operations | SQLite, SQLAlchemy, data persistence                       | ✅ Complete |

**Progress:** 19/19 files complete (100%)

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip package manager

### Installation

```bash
# Install required packages
pip install numpy pandas matplotlib seaborn scipy scikit-learn

# Optional packages for advanced topics
pip install pymc3 sqlalchemy jupyter
```

### Running Files

```bash
# Navigate to directory
cd Python-files

# Run individual files
python 01_basics_of_data.py
python 02_arrays_and_dataframes.py
python 03_control_flow_and_strings.py
python 04_graphics.py

# Or in interactive mode
python -i 01_basics_of_data.py
```

## 💡 Key Features

### Python Advantages

- **0-based indexing** - Standard in computer science
- **Rich ecosystem** - Extensive libraries for data science
- **Readable syntax** - Emphasizes code clarity
- **Versatile** - General-purpose with strong scientific capabilities
- **Large community** - Abundant resources and support

### Implemented Concepts

- ✅ Data manipulation with NumPy and Pandas
- ✅ Statistical analysis with SciPy
- ✅ Machine learning with scikit-learn
- ✅ Advanced visualization with Matplotlib/Seaborn
- ✅ Numerical optimization
- ✅ Monte Carlo methods
- ✅ Bayesian statistics
- ✅ Database operations

## 📊 Core Libraries

| Package          | Purpose                       | Documentation                                    |
| ---------------- | ----------------------------- | ------------------------------------------------ |
| **NumPy**        | Numerical computing, arrays   | [Docs](https://numpy.org/doc/)                   |
| **Pandas**       | Data manipulation, DataFrames | [Docs](https://pandas.pydata.org/docs/)          |
| **Matplotlib**   | Plotting and visualization    | [Docs](https://matplotlib.org/stable/index.html) |
| **Seaborn**      | Statistical visualization     | [Docs](https://seaborn.pydata.org/)              |
| **SciPy**        | Scientific computing          | [Docs](https://docs.scipy.org/)                  |
| **scikit-learn** | Machine learning              | [Docs](https://scikit-learn.org/)                |
| **SQLAlchemy**   | Database toolkit              | [Docs](https://docs.sqlalchemy.org/)             |

## 📝 Code Examples

### Basic Usage

```python
# Load packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Create DataFrame
df = pd.DataFrame({'x': range(1, 11), 'y': np.random.rand(10)})

# Statistical analysis
print(df.y.mean())
print(df.y.std())

# Visualization
plt.plot(df.x, df.y)
plt.xlabel('X')
plt.ylabel('Y')
plt.show()
```

### Array Operations

```python
# NumPy arrays
x = np.array([1, 2, 3, 4])
y = x ** 2  # [1, 4, 9, 16]
z = x + y   # [2, 6, 12, 20]
```

## 🎯 Learning Objectives

By working through these files, you will:

1. Master Python's data science ecosystem
2. Perform efficient data manipulation with Pandas
3. Create publication-quality visualizations
4. Implement statistical models and tests
5. Apply optimization algorithms
6. Conduct Monte Carlo simulations
7. Understand Bayesian methods
8. Work with databases in Python

## 🔍 File Details

### All Files Complete

#### 01_basics_of_data.py

- Python data types (int, float, str, bool)
- Arithmetic, comparison, logical operators
- Variables and type checking
- Lists and NumPy arrays
- Vector operations and broadcasting
- Basic statistics

#### 02_arrays_and_dataframes.py

- NumPy arrays and matrices
- Matrix operations (transpose, multiplication)
- Pandas DataFrame creation
- Data manipulation and aggregation
- Linear regression with scipy.stats
- Boolean indexing

#### 03_control_flow_and_strings.py

- Conditional statements (if/elif/else)
- Loops (for, while)
- List comprehensions
- String methods and formatting
- Regular expressions (re module)
- Practical examples

#### 04_graphics.py

- Matplotlib plotting basics
- Histograms, scatter plots, box plots
- Subplots and multiple figures
- Statistical plots (ECDF, Q-Q plots)
- 3D visualization
- Plot customization

#### 05_writing_functions.py

- Function definition (def)
- Arguments and return values
- Lambda functions
- Decorators and generators
- Error handling

#### 06_getting_data_and_linear_models.py

- Data import (CSV, Excel)
- Data export and storage
- Linear regression (statsmodels, scikit-learn)
- Model evaluation
- Data preprocessing

#### 07_distributions.py

- SciPy probability distributions
- Random sampling
- Distribution fitting
- Hypothesis tests (t-test, ANOVA)
- P-values and confidence intervals

#### 08_optimisation_1.py

- scipy.optimize.minimize
- Gradient-based methods
- Function minimization
- Unconstrained optimization
- Optimization callbacks

#### 09_optimisation_2.py

- Constrained optimization
- Bound constraints
- Linear and nonlinear constraints
- Advanced optimization algorithms

#### 10_simulation.py

- Monte Carlo simulation
- Random number generation
- Stochastic modeling
- Simulation analysis
- Results visualization

#### 11_mcmc_I.py

- MCMC fundamentals
- Metropolis-Hastings algorithm
- Chain diagnostics
- Posterior sampling
- Trace plots

#### 13_cross_validation.py

- K-fold cross-validation
- Train/test split
- Model performance metrics
- scikit-learn validation tools
- Hyperparameter tuning

#### 14_density_estimation.py

- Kernel density estimation
- scipy.stats.gaussian_kde
- Histogram methods
- Bandwidth selection
- Density visualization

#### 15_bayesian_statistics.py

- Bayesian inference
- Prior and posterior distributions
- Credible intervals
- Bayesian updating
- PyMC3/Stan examples

#### 17_mcmc_II.py

- Advanced MCMC techniques
- Gibbs sampling
- Convergence diagnostics
- Multiple chains
- Effective sample size

#### 18_permutation_tests.py

- Permutation tests
- Bootstrap methods
- Resampling techniques
- Non-parametric statistics
- scipy.stats applications

#### 19_databases.py

- SQLite database operations
- SQLAlchemy ORM
- SQL queries in Python
- Data persistence
- Database connections

## 🤝 Contributing

Follow these standards when contributing:

- Follow PEP 8 style guide
- Use descriptive variable names
- Add docstrings to functions
- Include type hints where appropriate
- Test code before committing
- Use virtual environments

## 📚 Additional Resources

### Python Documentation

- [Official Python Documentation](https://docs.python.org/)
- [NumPy User Guide](https://numpy.org/doc/stable/user/)
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [Matplotlib Tutorials](https://matplotlib.org/stable/tutorials/index.html)

### Books & Tutorials

- "Python for Data Analysis" by Wes McKinney
- "Python Data Science Handbook" by Jake VanderPlas
- "Think Stats" - Statistical programming in Python
- Real Python tutorials

### Community

- [Python Discord](https://discord.gg/python)
- [Stack Overflow - Python](https://stackoverflow.com/questions/tagged/python)
- [r/learnpython](https://www.reddit.com/r/learnpython/)

## ⚙️ Troubleshooting

### Common Issues

**Module not found:**

```bash
pip install package-name
```

**Virtual environment setup:**

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```

**Jupyter notebook:**

```bash
pip install jupyter
jupyter notebook
```

## 📧 Support

For questions or issues:

- Open an issue in the main repository
- Contact the team lead
- Refer to the main README.md for team contacts

---

**Last Updated:** November 29, 2025  
**Python Version:** 3.8+  
**Maintained by:** Statistical Computing Team
