
# 📘 Power Query M Language Reference Sheet

## 🔹 Basic Structure

```m
let
    StepName = Expression,
    AnotherStep = Function(StepName)
in
    AnotherStep
```

## 🔹 Data Types

| Type       | Example             |
|------------|---------------------|
| **Text**   | `"Hello World"`     |
| **Number** | `123`, `3.14`       |
| **Boolean**| `true`, `false`     |
| **Date**   | `#date(2024, 12, 25)`|
| **Time**   | `#time(12, 30, 0)`  |
| **List**   | `{1, 2, 3}`         |
| **Record** | `[Name="John", Age=30]` |
| **Table**  | Table literal       |
| **Null**   | `null`              |

## 🔹 Common Table Functions

| Function | Description |
|---------|-------------|
| `Table.SelectRows(table, each condition)` | Filter rows |
| `Table.AddColumn(table, "NewCol", each expression)` | Add column |
| `Table.RemoveColumns(table, {"Col1", "Col2"})` | Remove columns |
| `Table.RenameColumns(table, {{"Old", "New"}})` | Rename columns |
| `Table.Combine({table1, table2})` | Append tables |
| `Table.Join(table1, "Col", table2, "Col", JoinKind.Inner)` | Join tables |

## 🔹 Text Functions

| Function | Example |
|---------|---------|
| `Text.Upper("abc")` → `"ABC"` |
| `Text.Lower("ABC")` → `"abc"` |
| `Text.Length("Power")` → `5` |
| `Text.Replace("cat", "c", "h")` → `"hat"` |
| `Text.Contains("hello", "lo")` → `true` |

## 🔹 Date & Time Functions

| Function | Example |
|---------|---------|
| `DateTime.LocalNow()` | Current date/time |
| `Date.Year(#date(2024,1,1))` → `2024` |
| `Date.AddDays(DateTime.Date(DateTime.LocalNow()), 5)` | Today + 5 days |

## 🔹 List Functions

| Function | Example |
|----------|---------|
| `List.Sum({1,2,3})` → `6` |
| `List.Max({5,3,9})` → `9` |
| `List.Contains({1,2,3}, 2)` → `true` |
| `List.Transform({1,2,3}, each _ * 10)` → `{10, 20, 30}` |

## 🔹 Record Functions

| Function | Example |
|----------|---------|
| `Record.FieldNames([Name="Joe", Age=25])` → `{"Name", "Age"}` |
| `Record.FieldValues(...)` | Values of a record |
| `Record.ToTable(...)` | Converts a record to a table |

## 🔹 Error Handling

```m
try Expression otherwise DefaultValue
```
Example:
```m
try [Amount] / [Quantity] otherwise 0
```

## 🔹 Conditional Statements

```m
if [Sales] > 1000 then "High" else "Low"
```

## 🔹 Useful Constants

| Constant | Description |
|----------|-------------|
| `null`   | No value |
| `true`   | Boolean true |
| `false`  | Boolean false |

## 🛠 Example: Clean and Filter Table

```m
let
    Source = Excel.Workbook(File.Contents("C:\data\Sales.xlsx"), null, true),
    Sheet = Source{[Name="Sales"]}[Data],
    Filtered = Table.SelectRows(Sheet, each [Region] = "West"),
    Cleaned = Table.RemoveColumns(Filtered, {"UnneededColumn"}),
    AddedColumn = Table.AddColumn(Cleaned, "Total", each [Qty] * [Price])
in
    AddedColumn
```

## Videos
### 🎥 Getting Started With M Language in Power Query | Basic to Advanced
[![Power Query M Language Tutorial](http://img.youtube.com/vi/5s8Ky5r43uI/0.jpg)](http://youtu.be/5s8Ky5r43uI)


## Documentation

For more information, see the official documentation:  
- [MQuery Reference](https://learn.microsoft.com/en-us/powerquery-m/)  


