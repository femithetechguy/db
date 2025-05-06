# Essential Power BI Developer Code Reference

## 1. DAX (Data Analysis Expressions)

### Time Intelligence
````dax
// YTD Calculation
YTD Sales = 
TOTALYTD(SUM(Sales[Amount]), 'Date'[Date])

// Previous Year Comparison
PY Sales = 
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR('Date'[Date])
)

// Moving Average
Moving Avg = 
AVERAGEX(
    DATESINPERIOD(
        'Date'[Date],
        LASTDATE('Date'[Date]),
        -3,
        MONTH
    ),
    [Total Sales]
)
````

### Advanced Patterns
````dax
// Parent-Child Hierarchy
Path = 
PATH(
    DimEmployee[EmployeeKey],
    DimEmployee[ParentEmployeeKey]
)

// Dynamic Rank
Sales Rank = 
RANKX(
    ALL('Product'),
    [Total Sales],
    ,
    DESC,
    Dense
)

// Cumulative Total
Running Total = 
CALCULATE(
    [Total Sales],
    FILTER(
        ALL('Date'),
        'Date'[Date] <= MAX('Date'[Date])
    )
)
````

## 2. M Language (Power Query)

### Data Transformation
````powerquery
let
    Source = Sql.Database("server", "db"),
    #"Filtered Rows" = Table.SelectRows(
        Source,
        each [Date] >= #date(2023, 1, 1)
    ),
    #"Pivoted Column" = Table.Pivot(
        #"Filtered Rows",
        List.Distinct([Category]),
        "Category",
        "Amount",
        List.Sum
    )
in
    #"Pivoted Column"
````

### Custom Functions
````powerquery
(start as date, end as date) as table =>
let
    Source = List.Dates(
        start,
        Duration.Days(end - start) + 1,
        #duration(1,0,0,0)
    ),
    #"Converted to Table" = Table.FromList(
        Source, 
        Splitter.SplitByNothing()
    )
in
    #"Converted to Table"
````

## 3. Performance Optimization

### Optimization Queries
````dax
// Measure Dependencies
EVALUATE
SELECTCOLUMNS(
    DEPENDENCIES(),
    "Measure", [ReferencingObject],
    "Referenced By", [ReferencedObject]
)

// Cardinality Check
EVALUATE
SUMMARIZECOLUMNS(
    'Table'[Column],
    "Distinct Count", COUNTROWS(VALUES('Table'[Column])),
    "Total Rows", COUNTROWS('Table')
)
````

### Common Parameters
````powerquery
let
    Source = #table(
        {"Name", "Value"},
        {
            {"StartDate", #date(2023, 1, 1)},
            {"EndDate", DateTime.LocalNow()},
            {"RefreshType", "Full"}
        }
    )
in
    Source
````

Execute these in Power BI Desktop or Azure Analysis Services. For VS Code development:

1. Install Power BI extensions:
```bash
code --install-extension PowerBI.vscode-powerbi
```

2. Configure VS Code settings:
```json
{
    "powerbi.workspace.path": "/Users/fttg/powerbi/"
}
```