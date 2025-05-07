# SAS Programming Essentials

## Core Topics

### 1. SAS Basics
- **DATA Step**: Reading, modifying, writing data
- **PROC Step**: Analysis and reporting
- **Libraries**: Management via LIBNAME
- **Syntax Rules**: 
  - Semicolon-terminated statements
  - Case-insensitive
  - Structure-dependent

### 2. Data Manipulation
```sas
/* Reading Data Examples */
data work.mydata;
    infile 'path/to/file.txt';
    input var1 $ var2;
run;

/* Combining Datasets */
data combined;
    set dataset1 dataset2;  /* Concatenation */
run;

data merged;
    merge dataset1(in=a) dataset2(in=b);
    by key_variable;
    if a and b;  /* Inner join */
run;
```

### 3. Data Cleaning
```sas
/* Handling Missing Values */
data clean;
    set raw;
    if missing(var1) then var1 = 0;
    clean_text = compress(dirty_text);
    date_formatted = put(date, date9.);
run;
```

### 4. Essential PROC Procedures

| PROC | Purpose |
|------|---------|
| SORT | Sort data |
| PRINT | Display data |
| FREQ | Categorical analysis |
| MEANS | Summary statistics |
| SQL | SQL queries |
| FORMAT | Custom formats |
| REPORT | Custom reports |

### 5. Macro Programming
```sas
/* Basic Macro Variable */
%let department = 'Sales';

/* Macro Program */
%macro analyze_dept(dept);
    proc means data=employees;
        where department = &dept;
        var salary;
    run;
%mend;
```

### 6. Advanced Techniques
```sas
/* DO Loops and RETAIN */
data running_total;
    set transactions;
    retain total 0;
    total = total + amount;
    output;
run;

/* Hash Object Example */
data _null_;
    declare hash h();
    h.definekey('id');
    h.definedata('name', 'dept');
    h.definedone();
run;
```

## Best Practices

### Code Efficiency
1. Use WHERE instead of IF when possible
2. Index frequently used key variables
3. Drop unnecessary variables
4. Use compression when appropriate

### Debugging
```sas
/* Debug Examples */
options mprint symbolgen mlogic;
data _null_;
    putlog "DEBUG: Processing record " _n_;
run;
```

// ...existing code...

## Learning Path
1. **Week 1**: Basic syntax and data steps
2. **Week 2**: PROC procedures and data manipulation
3. **Week 3**: Data cleaning and functions
4. **Week 4**: Macro programming basics
5. **Week 5**: Advanced techniques and optimization

## Skills Summary

| Category | Focus |
|----------|-------|
| Basics | DATA/PROC steps, Libraries |
| Data Manipulation | Reading, subsetting, merging |
| Data Cleaning | Missing values, text functions |
| Procedures | SORT, PRINT, FREQ, MEANS, SQL |
| Automation | Macros |
| Advanced Skills | Retain, First./Last., Hash tables |
| Best Practices | Debugging, commenting, modularization |## Learning Path

## Online Resources

### Official Documentation
- [SAS Documentation](https://documentation.sas.com/) - Comprehensive official docs
- [SAS Programming Tutorials](https://support.sas.com/edu/elearning.html) - Free e-learning resources
- [SAS University Edition](https://www.sas.com/en_us/software/university-edition.html) - Free for academic use

### Community Resources
- [SAS Communities](https://communities.sas.com/) - Q&A and discussions
- [UCLA's SAS Learning Modules](https://stats.oarc.ucla.edu/sas/) - Academic tutorials
- [Lexjansen.com](https://www.lexjansen.com/) - Collection of SAS conference papers

### Practice Datasets
- SASHELP Library - Built-in example datasets
- [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/index.php) - External datasets
- [Kaggle](https://www.kaggle.com/datasets) - Data science competitions and datasets

### UCLA Resources
<!-- - [Title](link) - External datasets -->
- [SAS](https://stats.oarc.ucla.edu/sas/) - General Curriculum
- [Modules](https://stats.oarc.ucla.edu/sas/modules/) - SAS Learning Modules
- [Seminar](https://stats.oarc.ucla.edu/other/mult-pkg/seminars/#SAS) - SAS Seminar
- [FAQs](https://stats.oarc.ucla.edu/sas/faq/) - Frequently Asked Questions
- [SAS On Demand](https://www.sas.com/en_us/software/on-demand-for-academics.html) - SAS software in the cloud 
