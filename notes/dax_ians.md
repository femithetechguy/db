# DAX (Data Analysis Expressions) Overview

## Core Concepts

### 1. Basic Syntax
````dax
// Basic measure
Total Sales = SUM(Sales[Amount])

// Filtered measure
US Sales = 
CALCULATE(
    [Total Sales],
    Sales[Country] = "USA"
)
````

### 2. Time Intelligence
````dax
// YTD calculation
YTD Sales = 
TOTALYTD(
    [Total Sales],
    'Date'[Date]
)

// Previous year comparison
PY Sales = 
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR('Date'[Date])
)
````

### 3. Context Manipulation
````dax
// Remove filters
All Categories Sales = 
CALCULATE(
    [Total Sales],
    ALL('Product'[Category])
)

// Modified filter context
Sales By Category = 
CALCULATE(
    [Total Sales],
    USERELATIONSHIP(Sales[ProductID], Product[ProductID])
)
````

### 4. Common Patterns

#### Calculate with Filter
````dax
High Value Sales = 
CALCULATE(
    [Total Sales],
    Sales[Amount] > 1000
)
````

#### Running Total
````dax
Running Total = 
CALCULATE(
    [Total Sales],
    FILTER(
        ALL('Date'),
        'Date'[Date] <= MAX('Date'[Date])
    )
)
````

#### Market Share
````dax
Market Share = 
DIVIDE(
    [Total Sales],
    CALCULATE(
        [Total Sales],
        ALL('Product')
    )
)
````

## Key Functions

1. **Aggregation**
   - `SUM`, `AVERAGE`, `MIN`, `MAX`, `COUNT`
   
2. **Filter Modifiers**
   - `ALL`, `ALLEXCEPT`, `FILTER`, `CALCULATE`
   
3. **Time Intelligence**
   - `TOTALYTD`, `SAMEPERIODLASTYEAR`, `DATEADD`
   
4. **Relationship**
   - `RELATED`, `RELATEDTABLE`, `USERELATIONSHIP`

To use in Power BI Desktop:
1. Open Power BI Desktop
2. Select 'New Measure'
3. Enter DAX formula
4. Press Enter or click ✓

For VS Code development:
```bash
code --install-extension PowerBI.vscode-powerbi
