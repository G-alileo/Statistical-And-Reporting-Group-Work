# Julia Files - Statistical Computing Implementation

## Overview

This directory contains Julia implementations of statistical computing concepts, demonstrating Julia's high-performance numerical computing capabilities and elegant syntax for scientific programming.

## 📁 File Structure

| File                                   | Topic               | Description                                                   | Status      |
| -------------------------------------- | ------------------- | ------------------------------------------------------------- | ----------- |
| `01_basics_of_data.jl`                 | Data Fundamentals   | Data types, operators, variables, vectors, type conversion    | ✅ Complete |
| `02_arrays_and_dataframes.jl`          | Data Structures     | Arrays, matrices, DataFrames, data manipulation, GLM          | ✅ Complete |
| `03_control_flow_and_strings.jl`       | Control & Strings   | Conditionals, loops, comprehensions, regex, string operations | ✅ Complete |
| `04_graphics.jl`                       | Visualization       | Plots.jl graphics, statistical plots, 3D visualization        | ✅ Complete |
| `05_writing_functions.jl`              | Functions           | Function syntax, methods, dispatch, lambda functions          | ✅ Complete |
| `06_getting_data_and_linear_models.jl` | Data & Models       | Data import/export, linear regression, GLM                    | ✅ Complete |
| `07_distributions.jl`                  | Distributions       | Probability distributions, sampling, statistical tests        | ✅ Complete |
| `08_optimisation_1.jl`                 | Optimization I      | Unconstrained optimization, gradient methods                  | ✅ Complete |
| `09_optimisation_2.jl`                 | Optimization II     | Constrained optimization, numerical methods                   | ✅ Complete |
| `10_simulation.jl`                     | Simulation          | Monte Carlo methods, random number generation                 | ✅ Complete |
| `11_mcmc_I.jl`                         | MCMC I              | Markov Chain Monte Carlo fundamentals, Metropolis-Hastings    | ✅ Complete |
| `13_cross_validation.jl`               | Cross-Validation    | Model validation, k-fold CV, performance metrics              | ✅ Complete |
| `14_density_estimation.jl`             | Density Estimation  | Kernel density, histogram methods                             | ✅ Complete |
| `15_bayesian_statistics.jl`            | Bayesian Methods    | Bayesian inference, posterior distributions                   | ✅ Complete |
| `17_mcmc_II.jl`                        | MCMC II             | Advanced MCMC, Gibbs sampling, convergence diagnostics        | ✅ Complete |
| `18_permutation_tests.jl`              | Permutation Tests   | Non-parametric tests, bootstrap methods                       | ✅ Complete |
| `19_databases.jl`                      | Database Operations | SQL queries, data storage, database connectivity              | ✅ Complete |

**Progress:** 19/19 files complete (100%)

## 🚀 Quick Start

### Prerequisites

- Julia 1.6 or higher
- Required packages (see Installation)

### Installation

```julia
# Install Julia packages
using Pkg
Pkg.add([
    "Statistics",
    "DataFrames",
    "Plots",
    "StatsPlots",
    "GLM",
    "Distributions",
    "Random",
    "LinearAlgebra",
    "Printf",
    "CSV",
    "Optim"
])
```

### Running Files

```bash
# Navigate to directory
cd Julia-files

# Run individual files
julia 01_basics_of_data.jl
julia 02_arrays_and_dataframes.jl
julia 03_control_flow_and_strings.jl
julia 04_graphics.jl

# Or in Julia REPL
julia> include("01_basics_of_data.jl")
```

## 💡 Key Features

### Julia Advantages

- **1-based indexing** - Natural for mathematical notation
- **Native broadcasting** - Element-wise operations with `.` operator
- **Multiple dispatch** - Flexible, type-based method selection
- **High performance** - Near C/Fortran speed with Python-like syntax
- **Built-in parallelism** - Easy parallel and distributed computing

### Implemented Concepts

- ✅ Data manipulation with DataFrames.jl
- ✅ Statistical analysis and modeling
- ✅ Advanced visualization with Plots.jl
- ✅ Numerical optimization
- ✅ Monte Carlo simulation
- ✅ Bayesian inference
- ✅ Machine learning validation

## 📊 Core Libraries

| Package              | Purpose                     | Documentation                                               |
| -------------------- | --------------------------- | ----------------------------------------------------------- |
| **Statistics**       | Basic statistical functions | [Docs](https://docs.julialang.org/en/v1/stdlib/Statistics/) |
| **DataFrames.jl**    | Data manipulation           | [Docs](https://dataframes.juliadata.org/)                   |
| **Plots.jl**         | Visualization               | [Docs](https://docs.juliaplots.org/)                        |
| **StatsPlots.jl**    | Statistical plots           | [Docs](https://github.com/JuliaPlots/StatsPlots.jl)         |
| **GLM.jl**           | Generalized linear models   | [Docs](https://juliastats.org/GLM.jl/)                      |
| **Distributions.jl** | Probability distributions   | [Docs](https://juliastats.org/Distributions.jl/)            |
| **Optim.jl**         | Optimization algorithms     | [Docs](https://julianlsolvers.github.io/Optim.jl/)          |

## 📝 Code Examples

### Basic Usage

```julia
# Load packages
using DataFrames, Statistics, Plots

# Create DataFrame
df = DataFrame(x = 1:10, y = rand(10))

# Statistical analysis
mean(df.y)
std(df.y)

# Visualization
plot(df.x, df.y, label="Data", xlabel="X", ylabel="Y")
```

### Broadcasting

```julia
# Element-wise operations
x = [1, 2, 3, 4]
y = x .^ 2  # [1, 4, 9, 16]
z = x .+ y  # [2, 6, 12, 20]
```

## 🎯 Learning Objectives

By working through these files, you will:

1. Master Julia's syntax and type system
2. Perform data manipulation with DataFrames.jl
3. Create professional visualizations
4. Implement statistical models and tests
5. Apply optimization algorithms
6. Conduct Monte Carlo simulations
7. Understand Bayesian inference methods
8. Validate machine learning models

## 🔍 File Details

### All Files Complete

#### 01_basics_of_data.jl

- Data types (Int, Float64, String, Bool)
- Arithmetic, comparison, and boolean operators
- Variables and type checking
- Arrays and vector operations
- Broadcasting and vectorization
- Summary statistics

#### 02_arrays_and_dataframes.jl

- Multi-dimensional arrays
- Matrix operations (transpose, multiplication)
- DataFrame creation and manipulation
- Data aggregation and grouping
- Linear regression with GLM
- Data slicing and filtering

#### 03_control_flow_and_strings.jl

- Conditional statements (if/elseif/else)
- Loops (for, while) and iteration
- Array comprehensions
- String manipulation and formatting
- Regular expressions
- Practical examples (palindrome, FizzBuzz)

#### 04_graphics.jl

- Line plots, scatter plots, histograms
- Box plots and subplots
- Statistical visualizations (ECDF, Q-Q plots)
- 3D surface plots and contours
- Plot customization
- Multiple plot layouts

#### 05_writing_functions.jl

- Function definition and syntax
- Multiple dispatch
- Anonymous functions
- Higher-order functions

#### 06_getting_data_and_linear_models.jl

- Data import/export (CSV, Excel)
- Linear regression analysis
- GLM implementation
- Model diagnostics

#### 07_distributions.jl

- Probability distributions
- Random sampling
- Distribution fitting
- Statistical tests

#### 08_optimisation_1.jl

- Unconstrained optimization
- Gradient descent methods
- Function minimization
- Optimization algorithms

#### 09_optimisation_2.jl

- Constrained optimization
- Numerical methods
- Advanced optimization techniques
- Solver implementations

#### 10_simulation.jl

- Monte Carlo simulation
- Random number generation
- Stochastic processes
- Simulation studies

#### 11_mcmc_I.jl

- Markov Chain Monte Carlo basics
- Metropolis-Hastings algorithm
- MCMC diagnostics
- Sampling methods

#### 13_cross_validation.jl

- Model validation techniques
- K-fold cross-validation
- Performance metrics
- Model selection

#### 14_density_estimation.jl

- Kernel density estimation
- Histogram methods
- Bandwidth selection
- Density plots

#### 15_bayesian_statistics.jl

- Bayesian inference
- Prior and posterior distributions
- Credible intervals
- Bayesian updating

#### 17_mcmc_II.jl

- Advanced MCMC methods
- Gibbs sampling
- Convergence diagnostics
- Chain analysis

#### 18_permutation_tests.jl

- Non-parametric tests
- Permutation methods
- Bootstrap techniques
- Resampling strategies

#### 19_databases.jl

- Database connectivity
- SQL queries
- Data storage operations
- Database management

## 🤝 Contributing

Follow these standards when contributing:

- Use descriptive variable names
- Add comments explaining complex logic
- Follow Julia style guide conventions
- Test code before committing
- Include docstrings for functions
- Ensure reproducibility with `Random.seed!()`

## 📚 Additional Resources

### Julia Documentation

- [Official Julia Documentation](https://docs.julialang.org/)
- [Julia Academy](https://juliaacademy.com/)
- [JuliaStats Organization](https://github.com/JuliaStats)
- [Plots.jl Tutorial](https://docs.juliaplots.org/stable/tutorial/)

### Books & Tutorials

- "Think Julia" - Free online book
- "Julia Data Science" - Open-source book
- "Statistics with Julia" - Statistical computing guide

### Community

- [Julia Discourse](https://discourse.julialang.org/)
- [Julia Slack](https://julialang.org/slack/)
- [JuliaLang on GitHub](https://github.com/JuliaLang)

## ⚙️ Troubleshooting

### Common Issues

**Package not found:**

```julia
using Pkg
Pkg.add("PackageName")
```

**Plotting backend issues:**

```julia
ENV["GKSwstype"] = "100"  # For headless environments
```

**Performance tips:**

- Use `@time` macro to profile code
- Avoid global variables in loops
- Use type annotations for better performance
- Consider `@inbounds` for array operations

## 📧 Support

For questions or issues:

- Open an issue in the main repository
- Contact the team lead
- Refer to the main README.md for team contacts

---

**Last Updated:** November 29, 2025  
**Julia Version:** 1.6+  
**Maintained by:** Statistical Computing Team
