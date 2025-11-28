# Statistical Computing Multi-Language Implementation

## Project Overview

This repository demonstrates statistical computing concepts across three programming languages (Python, Julia, and R). The project contains **19 total files** covering fundamental to advanced topics in statistical computing, with implementations in each language showcasing language-specific features and best practices.

---

## 👥 Team Members

| Name               | Registration Number | Role                      | Assigned Files     |
| ------------------ | ------------------- | ------------------------- | ------------------ |
| Jamespeter Murithi | BSCCS/2023/61479    | Team Lead                 | Task 1-4    |
| Abel Rono          | BSCCS/2023/72524    | Machine Learning Engineer | Task 5-8    |
| Linah Kamau        | BSCCS/2023/60311    | Quality Assurance Analyst | Task 13-17  |
| Brian Macharia    | BSCCS/2023/XXXXX    | Developer                 | Task 9-12    |
| Fred              | BSCCS/2023/XXXXX    | Developer                 | Task 17-19    |

---

## 📁 Repository Structure

```
Statistical-And-Reporting-Group-Work/
├── README.md                                    # Main documentation
├── LICENSE
├── Python-files/
│   ├── 01_basics_of_data.py                    ✅ Complete
│   ├── 02_arrays_and_dataframes.py             ✅ Complete
│   ├── 03_control_flow_and_strings.py          ✅ Complete
│   ├── 04_graphics.py                          ✅ Complete
│   └── README.md
├── Julia-files/
│   ├── 01_basics_of_data.jl                    ✅ Complete
│   ├── 02_arrays_and_dataframes.jl             ✅ Complete
│   ├── 03_control_flow_and_strings.jl          ✅ Complete
│   ├── 04_graphics.jl                          ✅ Complete
│   └── README.md
└── R-files/
    ├── 01_basics_of_data.R                     ✅ Complete
    ├── 02_arrays_and_dataframes.R              ✅ Complete
    ├── 03_control_flow_and_strings.R           ✅ Complete
    ├── 04_graphics.R                           ✅ Complete
    └── README.md

Total Files: 12/19 Complete (63%)
```

---

## 📋 File Assignment Tracker

### ✅ Completed Files (4/19)

| File Name                        | Language | Status  | Assigned To | Topics Covered                                   |
| -------------------------------- | -------- | ------- | ----------- | ------------------------------------------------ |
| `01_basics_of_data.py`           | Python   | ✅ Done | James_Murithi  | Data types, operators, variables, vectors        |
| `02_arrays_and_dataframes.py`    | Python   | ✅ Done | James_Murithi  | Arrays, matrices, DataFrames, data manipulation  |
| `03_control_flow_and_strings.py` | Python   | ✅ Done | James_Murithi  | Conditionals, loops, string operations           |
| `04_graphics.py`                 | Python   | ✅ Done | James_Murithi  | Plotting, visualization, statistical graphics    |
| `01_basics_of_data.jl`           | Julia    | ✅ Done | James_Murithi  | Data types, operators, variables, vectors        |
| `02_arrays_and_dataframes.jl`    | Julia    | ✅ Done | James_Murithi  | Arrays, matrices, DataFrames, data manipulation  |
| `03_control_flow_and_strings.jl` | Julia    | ✅ Done | James_Murithi  | Conditionals, loops, string operations           |
| `04_graphics.jl`                 | Julia    | ✅ Done | James_Murithi  | Plotting, visualization, statistical graphics    |
| `01_basics_of_data.R`            | R        | ✅ Done | James_Murithi    | Data types, operators, variables, vectors        |
| `02_arrays_and_dataframes.R`     | R        | ✅ Done | James_Murithi   | Arrays, matrices, data frames, data manipulation |
| `03_control_flow_and_strings.R`  | R        | ✅ Done | James_Murithi  | Conditionals, loops, string operations           |
| `04_graphics.R`                  | R        | ✅ Done | James_Murithi   | Plotting, visualization, statistical graphics    |

## 📂 Implementation Details

### Python Files (`Python-files/`)

**Language:** Python 3.8+  
**Key Libraries:** numpy, pandas, matplotlib, scipy, seaborn

**Completed Files:**

1. **01_basics_of_data.py** - Fundamental data types, arithmetic/comparison/boolean operators, variables, vectors, and basic functions
2. **02_arrays_and_dataframes.py** - NumPy arrays, matrices, Pandas DataFrames, data manipulation, linear regression example
3. **03_control_flow_and_strings.py** - Conditionals, loops, list comprehensions, string manipulation, regular expressions, practical examples
4. **04_graphics.py** - Matplotlib plotting: line plots, histograms, scatter plots, box plots, subplots, ECDF, Q-Q plots, 3D visualization

**How to Run:**

```bash
cd Python-files
python 01_basics_of_data.py
python 02_arrays_and_dataframes.py
python 03_control_flow_and_strings.py
python 04_graphics.py
```

---

### Julia Files (`Julia-files/`)

**Language:** Julia 1.6+  
**Key Packages:** Statistics, DataFrames, Plots, StatsPlots, GLM, Distributions

**Completed Files:**

1. **01_basics_of_data.jl** - Data types, operators, variables, arrays, broadcasting, type conversion
2. **02_arrays_and_dataframes.jl** - Arrays, matrices, DataFrames.jl, data manipulation, GLM regression
3. **03_control_flow_and_strings.jl** - Control flow, loops, comprehensions, string operations, regex
4. **04_graphics.jl** - Plots.jl: various plot types, subplots, statistical visualizations, 3D plots

**How to Run:**

```bash
cd Julia-files
julia 01_basics_of_data.jl
julia 02_arrays_and_dataframes.jl
julia 03_control_flow_and_strings.jl
julia 04_graphics.jl
```

**Required Packages:**

```julia
using Pkg
Pkg.add(["Statistics", "DataFrames", "Plots", "StatsPlots", "GLM", "Distributions", "Random", "LinearAlgebra", "Printf"])
```

---

### R Files (`R-files/`)

**Language:** R 4.0+  
**Key Libraries:** dplyr, ggplot2, tidyr, stats

**Completed Files:**

1. **01_basics_of_data.R** - Data types, operators, variables, vectors, vector operations
2. **02_arrays_and_dataframes.R** - Arrays, matrices, data frames, data manipulation
3. **03_control_flow_and_strings.R** - Control structures, loops, string operations
4. **04_graphics.R** - Base R and ggplot2 graphics, statistical visualizations

**How to Run:**

```bash
cd R-files
Rscript 01_basics_of_data.R
Rscript 02_arrays_and_dataframes.R
Rscript 03_control_flow_and_strings.R
Rscript 04_graphics.R
```

**Required Packages:**

```R
install.packages(c("dplyr", "ggplot2", "tidyr", "readr", "stringr"))
```

---

## 🛠️ Technologies & Concepts Covered

### Core Topics Demonstrated

1. **Basics of Data** - Data types, operators, variables, vectors
2. **Data Structures** - Arrays, matrices, data frames
3. **Control Flow** - Conditionals, loops, iteration
4. **Visualizations** - Statistical graphics and plots
5. **Additional Topics** - _To be determined for files 5-7_

### Language Comparison

| Feature          | Python             | Julia                | R                     |
| ---------------- | ------------------ | -------------------- | --------------------- |
| **Indexing**     | 0-based            | 1-based              | 1-based               |
| **Broadcasting** | NumPy arrays       | Native `.` operator  | Vectorized by default |
| **Data Frames**  | pandas             | DataFrames.jl        | Native data.frame     |
| **Plotting**     | matplotlib/seaborn | Plots.jl             | base/ggplot2          |
| **Performance**  | Good with NumPy    | Excellent            | Good for statistics   |
| **Use Case**     | General-purpose    | Scientific computing | Statistical analysis  |

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- Python 3.8 or higher
- Julia 1.6 or higher
- R 4.0 or higher
- Git

### Installation

1. **Clone the repository:**

```bash
git clone https://github.com/G-alileo/Statistical-And-Reporting-Group-Work.git
cd Statistical-And-Reporting-Group-Work
```

2. **Set up Python environment:**

```bash
pip install numpy pandas matplotlib scipy seaborn
```

3. **Set up Julia packages:**

```julia
# In Julia REPL
using Pkg
Pkg.add(["Statistics", "DataFrames", "Plots", "StatsPlots", "GLM", "Distributions"])
```

4. **Set up R packages:**

```R
# In R console
install.packages(c("dplyr", "ggplot2", "tidyr", "readr", "stringr"))
```

---

## 📝 Usage Instructions

### Running Files

**Python:**

```bash
cd Python-files
python 01_basics_of_data.py
```

**Julia:**

```bash
cd Julia-files
julia 01_basics_of_data.jl
```

**R:**

```bash
cd R-files
Rscript 01_basics_of_data.R
# Or in R console: source("01_basics_of_data.R")
```

---

## 🤝 Contribution Guidelines

### For Team Members

**When Assigned a File:**

1. Check the "File Assignment Tracker" section above for your assigned files
2. Create a new branch: `git checkout -b feature/your-name-file-number`
3. Implement the file following the existing pattern in completed files
4. Test your code to ensure it runs without errors
5. Commit with clear message: `git commit -m "Add: [filename] - [brief description]"`
6. Push and create a Pull Request: `git push origin feature/your-name-file-number`
7. Tag team lead for review
8. Update the tracker by marking your file as ✅ Done

### Coding Standards

- **Python:** Follow PEP 8 style guide, use docstrings
- **Julia:** Follow Julia style guide, add comments for clarity
- **R:** Follow tidyverse style guide, use descriptive variable names
- **All Languages:**
  - Match the structure and format of existing files (01-04)
  - Include section headers with `=` separators
  - Add comprehensive comments explaining concepts
  - Test all code before committing
  - Ensure output is clear and well-formatted

### File Structure Template

Each file should follow this structure:

```
1. File header docstring explaining purpose
2. Import/using statements
3. Sections with clear headers (60 character separators)
4. Code examples with explanatory comments
5. Output demonstrations
6. Summary section at the end
```

---

## 📊 Progress Tracking

### Overall Progress: 63% Complete (12/19 files)

```
Python:   ████░░░ 57% (4/7 files)
Julia:    ████░░░ 57% (4/7 files)
R:        ████░░░ 57% (4/7 files)
```

**Next Steps:**

1. Determine topics for remaining 7 files (files 5-7 for each language)
2. Assign files to team members (@Abel, @Linah, @Member4, @Member5)
3. Set deadline for completion
4. Review and test all implementations

---

## 📄 License

This project is created for educational purposes as part of **Statistical Computing and Reporting (BIT4131)**. All rights reserved by the team members listed above.

---

## 📧 Contact & Collaboration

**Team Lead:** Jamespeter Murithi (BSCCS/2023/61479)

**For Team Members:**

- Check your assignments in the "File Assignment Tracker" section
- Use GitHub Issues for questions or clarifications
- Tag @G-alileo in Pull Requests for review

---

## 🙏 Acknowledgments

- **Dennis Kaburu** - Course Instructor
- **Mount Kenya University** - Institution
- Python, Julia, and R communities for excellent documentation

---

## 📚 Additional Resources

### Documentation

- [Python Documentation](https://docs.python.org/) - Official Python docs
- [Julia Documentation](https://docs.julialang.org/) - Official Julia docs
- [R Documentation](https://www.r-project.org/other-docs.html) - Official R docs

### Learning Resources

- [NumPy User Guide](https://numpy.org/doc/stable/user/index.html)
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [DataFrames.jl Guide](https://dataframes.juliadata.org/stable/)
- [ggplot2 Documentation](https://ggplot2.tidyverse.org/)

---

## 📅 Project Timeline

- **✅ Phase 1:** Core files 1-4 completed (Python, Julia, R) - _Completed_
- **🔄 Phase 2:** Additional files 5-7 (TBD) - _In Progress_
- **📝 Phase 3:** Documentation and testing - _Pending_
- **🎯 Phase 4:** Final review and submission - _Pending_

---

**Last Updated:** November 28, 2025  
**Repository:** [Statistical-And-Reporting-Group-Work](https://github.com/G-alileo/Statistical-And-Reporting-Group-Work)  
**Status:** 🟢 Active Development
