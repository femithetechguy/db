# Power BI Developer Role Guide

## 1. Technical Qualifications

### Core Skills
- DAX (Data Analysis Expressions)
- M Language (Power Query)
- SQL
- Data Modeling
- Azure Integration

### Required Knowledge
```
Business Intelligence
├── ETL Processes
├── Data Warehousing
├── Performance Optimization
└── Security Implementation
```

## 2. Common DAX Queries

### Basic Calculations
````dax
// Sales Metrics
Total Sales = SUM(Sales[Amount])

// YTD Sales
Sales YTD = 
TOTALYTD(
    SUM(Sales[Amount]),
    'Date'[Date]
)

// Previous Year Sales
PY Sales = 
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR('Date'[Date])
)
````

### Advanced DAX Patterns
````dax
// Running Total
Running Total = 
CALCULATE(
    [Total Sales],
    FILTER(
        ALL('Date'),
        'Date'[Date] <= MAX('Date'[Date])
    )
)

// Market Share
Market Share = 
DIVIDE(
    [Total Sales],
    CALCULATE(
        [Total Sales],
        ALL('Product')
    )
)
````

## 3. Common M Queries

### Data Transformation
````powerquery
let
    Source = Sql.Database("server", "database"),
    FilteredRows = Table.SelectRows(
        Source, 
        each [Date] >= #date(2023, 1, 1)
    ),
    AddedColumn = Table.AddColumn(
        FilteredRows, 
        "YearMonth", 
        each Date.ToText([Date], "yyyy-MM")
    )
in
    AddedColumn
````

## 4. Performance Optimization

### Best Practices
- Implement incremental refresh
- Use appropriate storage mode
- Optimize relationships
- Implement RLS (Row Level Security)

### Monitoring Queries
````dax
// Check table sizes
Table Sizes = 
EVALUATE
ADDCOLUMNS(
    SUMMARIZE(
        '$Table',
        "Table",
        "Rows",
        COUNTROWS()
    ),
    "Size (MB)",
    [Rows] * 8 / 1024
)
````

## 5. Development Tools

### Essential Tools
```
Development Stack
├── Power BI Desktop
├── Visual Studio Code
│   └── DAX Extension
├── DAX Studio
└── Tabular Editor
```

### Version Control
```bash
# Git commands for Power BI files
git add *.pbix
git commit -m "Updated sales dashboard"
git push origin main
```

For detailed documentation, refer to the [Power BI Developer documentation](https://docs.microsoft.com/en-us/power-bi/developer/).