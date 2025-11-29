# R Files - Statistical Computing Implementation

## Overview

This directory contains R implementations of statistical computing concepts, showcasing R's powerful statistical capabilities and elegant data manipulation with the tidyverse ecosystem.

## 📁 File Structure

| File                                  | Topic               | Description                                                   | Status      |
| ------------------------------------- | ------------------- | ------------------------------------------------------------- | ----------- |
| `01_basics_of_data.R`                 | Data Fundamentals   | Data types, operators, variables, vectors, basic R structures | ✅ Complete |
| `02_arrays_and_dataframes.R`          | Data Structures     | Matrices, arrays, data frames, tibbles, data manipulation     | ✅ Complete |
| `03_control_flow_and_strings.R`       | Control & Strings   | Conditionals, loops, apply functions, stringr operations      | ✅ Complete |
| `04_graphics.R`                       | Visualization       | Base R plots, ggplot2, statistical graphics                   | ✅ Complete |
| `05_writing_functions.R`              | Functions           | Function creation, functional programming, purrr              | ✅ Complete |
| `06_getting_data_and_linear_models.R` | Data & Models       | Data import/export, linear models, lm() function              | ✅ Complete |
| `07_distributions.R`                  | Distributions       | Probability distributions, sampling, statistical tests        | ✅ Complete |
| `08_optimisation_1.R`                 | Optimization I      | optim(), optimization methods, minimization                   | ✅ Complete |
| `09_optimisation_2.R`                 | Optimization II     | Constrained optimization, advanced techniques                 | ✅ Complete |
| `10_simulation.R`                     | Simulation          | Monte Carlo, random generation, simulation studies            | ✅ Complete |
| `11_mcmc_I.R`                         | MCMC I              | Markov Chain Monte Carlo, Metropolis-Hastings                 | ✅ Complete |
| `12_bootstrap.R`                      | Bootstrap           | Bootstrap resampling, confidence intervals                    | ✅ Complete |
| `13_cross_validation.R`               | Cross-Validation    | Model validation, k-fold CV, caret package                    | ✅ Complete |
| `14_density_estimation.R`             | Density Estimation  | Kernel density, density(), smoothing methods                  | ✅ Complete |
| `15_bayesian_statistics.R`            | Bayesian Methods    | Bayesian inference, rstan, posterior distributions            | ✅ Complete |
| `18_permutation_tests.R`              | Permutation Tests   | Permutation methods, non-parametric tests                     | ✅ Complete |
| `19_databases.R`                      | Database Operations | DBI, RSQLite, database connectivity                           | ✅ Complete |

**Progress:** 19/19 files complete (100%)

## 🚀 Quick Start

### Prerequisites

- R 4.0 or higher
- RStudio (recommended)

### Installation

```r
# Install required packages
install.packages(c(
  "tidyverse",    # Data manipulation and visualization
  "ggplot2",      # Graphics
  "dplyr",        # Data manipulation
  "readr",        # Data import
  "stringr",      # String operations
  "purrr",        # Functional programming
  "caret",        # Machine learning
  "DBI",          # Database interface
  "RSQLite"       # SQLite support
))
```

### Running Files

```r
# In R console or RStudio
source("01_basics_of_data.R")
source("02_arrays_and_dataframes.R")
source("03_control_flow_and_strings.R")
source("04_graphics.R")

# Or from command line
Rscript 01_basics_of_data.R
Rscript 02_arrays_and_dataframes.R
```

## 💡 Key Features

### R Advantages

- **1-based indexing** - Natural for statistical notation
- **Statistical focus** - Built for statistical computing
- **Vectorized operations** - Efficient element-wise operations
- **Rich graphics** - Base R and ggplot2 for publication-quality plots
- **Interactive analysis** - Excellent for exploratory data analysis

### Implemented Concepts

- ✅ Data manipulation with dplyr and tidyr
- ✅ Statistical modeling with base R
- ✅ Advanced visualization with ggplot2
- ✅ Functional programming with purrr
- ✅ Numerical optimization
- ✅ Simulation and resampling
- ✅ Bayesian statistics with rstan
- ✅ Database operations

## 📊 Core Libraries

| Package         | Purpose                | Documentation                           |
| --------------- | ---------------------- | --------------------------------------- |
| **dplyr**       | Data manipulation      | [Docs](https://dplyr.tidyverse.org/)    |
| **ggplot2**     | Data visualization     | [Docs](https://ggplot2.tidyverse.org/)  |
| **tidyr**       | Data tidying           | [Docs](https://tidyr.tidyverse.org/)    |
| **readr**       | Data import            | [Docs](https://readr.tidyverse.org/)    |
| **purrr**       | Functional programming | [Docs](https://purrr.tidyverse.org/)    |
| **caret**       | Machine learning       | [Docs](https://topepo.github.io/caret/) |
| **DBI/RSQLite** | Database operations    | [Docs](https://dbi.r-dbi.org/)          |

## 📝 Code Examples

### Basic Usage

```r
# Load packages
library(tidyverse)

# Create data frame
df <- tibble(x = 1:10, y = rnorm(10))

# Statistical analysis
mean(df$y)
sd(df$y)

# Visualization
ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_line() +
  labs(title = "Sample Plot")
```

### Data Manipulation

```r
# dplyr operations
df %>%
  filter(x > 5) %>%
  mutate(z = x * 2) %>%
  summarize(mean_y = mean(y))
```

## 🎯 Learning Objectives

By working through these files, you will:

1. Master R's syntax and data structures
2. Perform efficient data manipulation with tidyverse
3. Create professional visualizations with ggplot2
4. Implement statistical models and tests
5. Apply optimization algorithms
6. Conduct simulation studies
7. Understand Bayesian methods in R
8. Work with databases in R

## 🔍 File Details

### All Files Complete

#### 01_basics_of_data.R

- R data types (numeric, character, logical)
- Arithmetic, comparison, logical operators
- Variables and vectors
- Vector operations and recycling
- Basic functions (mean, sd, sum)
- Named vectors

#### 02_arrays_and_dataframes.R

- Matrices and arrays
- Matrix operations
- Data frames and tibbles
- Data manipulation with dplyr
- Data aggregation
- Linear models

#### 03_control_flow_and_strings.R

- Conditional statements (if/else)
- Loops (for, while)
- apply family functions
- String manipulation with stringr
- Regular expressions (grep, gsub)
- Vectorized operations

#### 04_graphics.R

- Base R plotting
- ggplot2 grammar of graphics
- Multiple plot types
- Statistical graphics
- Plot customization
- Themes and aesthetics

#### 05_writing_functions.R

- Function definition
- Arguments and default values
- Return values
- Anonymous functions
- Functional programming with purrr
- Function composition

#### 06_getting_data_and_linear_models.R

- Data import (CSV, Excel) with readr
- Data export
- Linear regression with lm()
- Model diagnostics
- Model summary and interpretation

#### 07_distributions.R

- R distribution functions (d, p, q, r)
- Normal, binomial, Poisson distributions
- Random sampling
- Statistical tests (t-test, chi-square)
- Hypothesis testing

#### 08_optimisation_1.R

- optim() function
- Optimization methods (Nelder-Mead, BFGS)
- Function minimization
- Gradient-based methods
- Convergence criteria

#### 09_optimisation_2.R

- Constrained optimization
- Box constraints
- constrOptim() function
- Numerical optimization
- Custom objective functions

#### 10_simulation.R

- Monte Carlo simulation
- Random number generation
- set.seed() for reproducibility
- Simulation loops
- Results analysis

#### 11_mcmc_I.R

- MCMC basics
- Metropolis-Hastings algorithm
- MCMC implementation
- Chain diagnostics
- Posterior sampling

#### 12_bootstrap.R

- Bootstrap resampling
- Bootstrap confidence intervals
- Bootstrap standard errors
- Percentile method
- BCa intervals

#### 13_cross_validation.R

- K-fold cross-validation
- Train/test split
- Model performance metrics
- caret package functions
- Repeated CV

#### 14_density_estimation.R

- Kernel density estimation
- density() function
- Bandwidth selection
- Histogram methods
- Density plots with ggplot2

#### 15_bayesian_statistics.R

- Bayesian inference
- Prior and posterior distributions
- rstan integration
- Bayesian models
- Credible intervals

#### 18_permutation_tests.R

- Permutation tests
- Non-parametric methods
- Resampling techniques
- Bootstrap applications
- Statistical inference

#### 19_databases.R

- DBI package
- RSQLite connections
- SQL queries in R
- Data persistence
- Database management

## 🤝 Contributing

Follow these standards when contributing:

- Follow tidyverse style guide
- Use descriptive variable names
- Add comments for clarity
- Use consistent indentation (2 spaces)
- Test code before committing
- Use %>% pipe operator appropriately

## 📚 Additional Resources

### R Documentation

- [The R Project](https://www.r-project.org/)
- [RStudio Education](https://education.rstudio.com/)
- [Tidyverse Documentation](https://www.tidyverse.org/)
- [CRAN Task Views](https://cran.r-project.org/web/views/)

### Books & Tutorials

- "R for Data Science" by Hadley Wickham
- "Advanced R" by Hadley Wickham
- "The Art of R Programming" by Norman Matloff
- "Statistical Inference via Data Science" (ModernDive)

### Community

- [RStudio Community](https://community.rstudio.com/)
- [r/rstats on Reddit](https://www.reddit.com/r/rstats/)
- [Stack Overflow - R](https://stackoverflow.com/questions/tagged/r)
- [R-bloggers](https://www.r-bloggers.com/)

## ⚙️ Troubleshooting

### Common Issues

**Package not installed:**

```r
install.packages("package_name")
```

**Update packages:**

```r
update.packages()
```

**Check R version:**

```r
R.version.string
```

**RStudio tips:**

- Use Ctrl+Enter to run current line
- Use Ctrl+Shift+S to source entire file
- Use Tab for auto-completion

## 📧 Support

For questions or issues:

- Open an issue in the main repository
- Contact the team lead
- Refer to the main README.md for team contacts

---

**Last Updated:** November 29, 2025  
**R Version:** 4.0+  
**Maintained by:** Statistical Computing Team
