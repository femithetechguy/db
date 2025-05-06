# M Language (Power Query) Overview

## Core Concepts

### 1. Basic Syntax

````powerquery
let
    Source = Excel.Workbook(File.Contents("data.xlsx")),
    Sheet1 = Source{[Item="Sales"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(
        Sheet1,
        {{"Date", type date}, {"Amount", type number}}
    )
in
    #"Changed Type"
````

### 2. Common Operations

#### Data Transformation
````powerquery
let
    Source = #"Previous Step",
    // Remove nulls
    #"Removed Nulls" = Table.SelectRows(Source, each [Amount] <> null),
    // Add calculated column
    #"Added Custom" = Table.AddColumn(
        #"Removed Nulls", 
        "YearMonth", 
        each Date.ToText([Date], "yyyy-MM")
    ),
    // Group data
    #"Grouped Rows" = Table.Group(
        #"Added Custom",
        {"YearMonth"},
        {{"TotalAmount", each List.Sum([Amount]), type number}}
    )
in
    #"Grouped Rows"
````

### 3. Functions

#### Custom Function
````powerquery
(startDate as date, endDate as date) as table =>
let
    DateList = List.Dates(
        startDate,
        Duration.Days(endDate - startDate) + 1,
        #duration(1,0,0,0)
    ),
    #"Converted to Table" = Table.FromList(
        DateList,
        Splitter.SplitByNothing()
    )
in
    #"Converted to Table"
````

## Key Elements

1. **Steps**
   - Each transformation is a step
   - Steps are separated by commas
   - Results flow from one step to next

2. **Data Types**
   - `type text`
   - `type number`
   - `type date`
   - `type datetime`
   - `type logical`

3. **Common Functions**
   - Table operations: `Table.SelectRows`, `Table.AddColumn`
   - List operations: `List.Sum`, `List.Count`
   - Text operations: `Text.Start`, `Text.End`
   - Date operations: `Date.FromText`, `Date.ToText`

To use in Power BI Desktop:
1. Click 'Transform Data'
2. Click 'Advanced Editor'
3. Paste M code
4. Click 'Done'

For VS Code development:
```bash
code --install-extension PowerQuery.vscode-powerquery
```

Key point: M is a functional language where data transformations are defined as a series of steps, each building on the previous one.