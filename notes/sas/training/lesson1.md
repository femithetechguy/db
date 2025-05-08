# SAS Workshop 2023 — Presentation Summary

## 1. Introduction to SAS
- **What is SAS?**
  - Statistical software for data management, analysis, and modeling.
  - Used in government, healthcare, finance, research.
  - Known for reliability and scalability (handles large datasets).

## 2. Purpose of the Workshop
- Target audience: SAS beginners.
- Focus: Using **SAS programming language** (not point-and-click).
- Topics covered:
  - Modify, Explore, Manage, Access, Analyze Data.

## 3. SAS On Demand for Academics
- Web-based SAS access via [welcome.oda.sas.com](https://welcome.oda.sas.com).
- Free platform; no download needed.
- 5GB personal storage provided.

## 4. Navigating SAS On Demand Interface
- **Code Window**: Write and edit SAS code.
- **Log Window**: View execution notes, warnings, errors.
- **Results Window**: View and export outputs.
- **Search/Open**: Find files, folders, datasets.
- **Options**: Start new programs, import files.

## 5. SAS Programmer Perspective
- Main focus: Writing and editing SAS programs.
- (Visual programming also available for process flows.)

## 6. Uploading Files to SAS Server
- Files must be uploaded before use.
- Stored under "Files (Home)".
- Use SAS Libraries to access datasets.

## 7. SAS Libraries and Data
- **Library**: Shortcut to a folder, not storage itself.
- **SAS Datasets**:
  - File extension `.sas7bdat`.
  - Data organized in rows (observations) and columns (variables).
  - Variables: **Character** and **Numeric** types.

## 8. SAS Code Syntax
- Case insensitive.
- Each statement ends with a **semicolon** `;`.
- Two main steps:
  - **DATA Step**: Create or modify datasets.
  - **PROC Step**: Analyze data.
- Comments:
  - Single-line: `* comment ;`
  - Multi-line: `/* comment */`

## 9. DATA Step Details
- Reads input data → performs manipulations → writes output.
- Processes one observation at a time.

## 10. PROC Step Details
- Used for analysis (tables, plots, statistics).
- Common global statements:
  - `LIBNAME`: Define libraries.
  - `OPTIONS`: Customize output.

## 11. Accessing Data: Key Procedures
- `proc import`: Import data.
- `proc contents`: Dataset structure.
- `proc print`: Display dataset.
- `proc means`: Descriptive statistics.
- `proc univariate`: Detailed statistics.
- `proc freq`: Frequency tables.
- `proc corr`: Correlations and scatterplots.
- `proc sgplot`: Plotting data.

## 12. Exploring Data
- `proc format`: Value labels.
- `label`: Add labels to variables.
- `rename`: Rename variables.
- `if-then`: Conditional processing.
- **Functions**: Create new variables.

## 13. Modifying Data
- `if` and `where`: Condition-based selection.
- `keep`/`drop`: Select or remove variables.
- `appending`, `proc sort`, `merge`: Dataset management.

## 14. Managing Data
- `proc freq`: Chi-squared tests.
- `proc ttest`: t-tests (one/two-sample, paired).
- `proc reg`: Regression (simple, multiple).
- `proc logistic`: Logistic regression.

## 15. Additional Resources
- **UCLA OARC SAS Resources**:
  - Seminars, learning modules, examples, annotated outputs.
  - [https://stats.oarc.ucla.edu/](https://stats.oarc.ucla.edu/)
- **External Resources**:
  - [SAS Users YouTube Channel](https://www.youtube.com/@SASUsers)
  - [SAS Base Programming Reference Sheet](https://www.sas.com/content/dam/SAS/documents/technical/certification/exam-content/base-programming-ref-sheet.pdf)
  - [OARC YouTube Channel](https://www.youtube.com/@UCLAOARC)
  - [SAS Explained Simply in 1 Hour](https://www.youtube.com/watch?v=ShInh1DpvEU&t=126s&ab_channel=GreatOnlineTraining)
  - [Basics of SAS Programming in < 2 Hours](https://www.youtube.com/watch?v=vQZ0DSUTAzQ&ab_channel=LearningwithJelly)

## 16. Closing
- **Thank you!**