
# 📘 DAX (Data Analysis Expressions) Reference Sheet

## 🔹 What is DAX?

DAX stands for **Data Analysis Expressions**. It is a formula language used in:
- Power BI
- Excel Power Pivot
- SQL Server Analysis Services (SSAS)

DAX is used to define custom calculations for:
- Calculated columns
- Measures
- Calculated tables

---

## 🔹 Common Function Categories

### 🧮 Aggregation Functions
| Function     | Description                            |
|--------------|----------------------------------------|
| `SUM()`      | Adds all numbers in a column           |
| `AVERAGE()`  | Calculates the average of values       |
| `MIN()`      | Returns the smallest number            |
| `MAX()`      | Returns the largest number             |
| `COUNT()`    | Counts the number of values            |
| `DISTINCTCOUNT()` | Counts distinct values           |

### 📅 Time Intelligence Functions
| Function               | Description                                         |
|------------------------|-----------------------------------------------------|
| `TOTALYTD()`           | Year-to-date total                                  |
| `SAMEPERIODLASTYEAR()` | Corresponding period in the previous year          |
| `DATESINPERIOD()`      | Dates in a specific period                          |
| `DATESYTD()`           | Dates from the beginning of the year to a date      |
| `PARALLELPERIOD()`     | Shift time periods (e.g., months, years)            |

### 🔄 Filter Functions
| Function        | Description                                      |
|------------------|--------------------------------------------------|
| `FILTER()`       | Returns a filtered table                        |
| `ALL()`          | Removes filters                                 |
| `ALLEXCEPT()`    | All filters except specified columns            |
| `VALUES()`       | Returns unique values from a column             |
| `RELATEDTABLE()` | Gets related table in relationship              |

### 🔗 Relationship Functions
| Function     | Description                              |
|--------------|------------------------------------------|
| `RELATED()`  | Retrieves a value from a related table   |
| `USERELATIONSHIP()` | Activates an inactive relationship  |

### 🔢 Math & Trig Functions
| Function    | Description                                |
|-------------|--------------------------------------------|
| `ABS()`     | Absolute value                             |
| `ROUND()`   | Rounds a number                            |
| `MOD()`     | Modulus (remainder)                        |
| `DIVIDE()`  | Safe division, handles divide-by-zero      |

### 🔤 Text Functions
| Function        | Description                           |
|------------------|---------------------------------------|
| `CONCATENATE()`  | Combines two text strings             |
| `LEFT()`         | Extracts characters from the left     |
| `RIGHT()`        | Extracts characters from the right    |
| `SEARCH()`       | Finds a substring                     |

### ⚙️ Logical Functions
| Function    | Description                          |
|-------------|--------------------------------------|
| `IF()`      | Returns values based on a condition |
| `SWITCH()`  | Evaluates multiple conditions        |
| `AND()`     | Returns TRUE if all conditions TRUE  |
| `OR()`      | Returns TRUE if any condition TRUE   |

### 👤 User & Security Functions
| Function           | Description                                 |
|--------------------|---------------------------------------------|
| `USERNAME()`        | Returns the user name                      |
| `USERPRINCIPALNAME()` | Returns the user’s principal name         |
| `ISFILTERED()`       | Checks if a column is filtered            |

---

## 🔹 Example DAX Measures

```dax
-- Total Revenue
Total Revenue = SUM(Sales[Revenue])

-- Profit Margin
Profit Margin = DIVIDE([Profit], [Revenue])

-- Sales YTD
Sales YTD = TOTALYTD(SUM(Sales[Amount]), Dates[Date])

-- Dynamic Ranking
Sales Rank = RANKX(ALL(Sales[Product]), [Total Revenue])
```

---

## 🔹 Tips
- Use `CALCULATE()` to modify filter context.
- Time intelligence functions require a proper Date table.
- `DIVIDE(x, y)` is safer than `x / y` to avoid errors.
- Always test logic with sample data using a matrix table visual.

---

## 📊 How to use Power BI DAX - Tutorial



[![The Most Important DAX Functions You Must Know in Power BI](https://img.youtube.com/vi/VfeX33w0K9M/0.jpg)](https://www.youtube.com/watch?v=VfeX33w0K9M)

**The Most Important DAX Functions You Must Know in Power BI**



[![DAX Reference Video](https://img.youtube.com/vi/waG_JhBgUpM/0.jpg)](https://www.youtube.com/watch?v=waG_JhBgUpM)

Watch this videos for a practical introduction to DAX formulas and tips for Power BI.

## Documentation

For more information, see the official documentation:  
- [DAX Reference](https://learn.microsoft.com/en-us/dax/)  
- [DAX Guide](https://dax.guide)

