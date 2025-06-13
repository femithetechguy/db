# Pivot, Unpivot, Transpose, Replace Values, Remove Empty, Normalized, and Denormalized Data in Power BI

## Pivot

**Pivoting** transforms rows into columns. In Power BI, this is useful for summarizing data, such as turning a list of sales transactions into a table where each product becomes a column and each row represents a time period.

**How to Pivot in Power BI:**
- In **Power Query Editor**, select the column to pivot, then go to the menu:  
    **Transform** > **Pivot Column**

**Example:**

| Date       | Product | Sales |
|------------|---------|-------|
| 2024-01-01 | A       | 10    |
| 2024-01-01 | B       | 20    |

**After Pivot:**

| Date       | A  | B  |
|------------|----|----|
| 2024-01-01 | 10 | 20 |

## Unpivot

**Unpivoting** converts columns into rows. This is helpful when you need to normalize your data for analysis or modeling in Power BI.

**How to Unpivot in Power BI:**
- In **Power Query Editor**, select the columns to unpivot, then go to the menu:  
    **Transform** > **Unpivot Columns**

**Example:**

| Date       | A  | B  |
|------------|----|----|
| 2024-01-01 | 10 | 20 |

**After Unpivot:**

| Date       | Product | Sales |
|------------|---------|-------|
| 2024-01-01 | A       | 10    |
| 2024-01-01 | B       | 20    |

## Transpose

**Transposing** switches rows and columns in a table. This is useful when you want to flip the orientation of your data.

**How to Transpose in Power BI:**
- In **Power Query Editor**, go to the menu:  
    **Transform** > **Transpose**

**Example:**

| Product | 2024-01-01 | 2024-01-02 |
|---------|------------|------------|
| A       | 10         | 15         |
| B       | 20         | 25         |

**After Transpose:**

|          | A  | B  |
|----------|----|----|
|2024-01-01| 10 | 20 |
|2024-01-02| 15 | 25 |

## Replace Values

**Replacing values** allows you to substitute specific values in your data, such as correcting errors or standardizing entries.

**How to Replace Values in Power BI:**
- In **Power Query Editor**, select the column(s), then go to the menu:  
    **Transform** > **Replace Values**

## Remove Empty

**Removing empty** rows or columns helps clean your data by eliminating blanks.

**How to Remove Empty in Power BI:**
- In **Power Query Editor**, select the table, then go to the menu:  
    **Home** > **Remove Rows** > **Remove Blank Rows**  
    **Home** > **Remove Columns** > **Remove Blank Columns**

## Normalized Data

**Normalized data** is structured to reduce redundancy and improve data integrity. In Power BI, normalized tables are often used in star or snowflake schemas, with separate tables for facts and dimensions.

**How to Normalize in Power BI:**
- Use **Power Query Editor** to split data into separate tables (e.g., using **Remove Duplicates**, **Reference**, or **Merge Queries** under the **Home** or **Transform** menus).

**Example:**

- **Sales Table:** (Fact)
        | SaleID | ProductID | Date       | Amount |
        |--------|-----------|------------|--------|
        | 1      | 101       | 2024-01-01 | 10     |

- **Product Table:** (Dimension)
        | ProductID | ProductName |
        |-----------|-------------|
        | 101       | A           |

## Denormalized Data

**Denormalized data** combines related information into a single table, often for simplicity or performance. In Power BI, denormalized tables can make report building easier but may introduce redundancy.

**How to Denormalize in Power BI:**
- Use **Power Query Editor** to merge tables:  
    **Home** > **Merge Queries**

**Example:**

| SaleID | ProductName | Date       | Amount |
|--------|-------------|------------|--------|
| 1      | A           | 2024-01-01 | 10     |

---

## When to Use Each

- **Pivot:** When you need summary tables or cross-tab reports.
- **Unpivot:** When preparing data for modeling or analysis.
- **Transpose:** When you need to switch the orientation of your data.
- **Replace Values:** When you need to correct or standardize data entries.
- **Remove Empty:** When cleaning data by removing blanks.
- **Normalized:** For scalable, maintainable data models.
- **Denormalized:** For simple, fast reporting with fewer tables.

---

**Power BI Tools:**  
- Use **Power Query** for pivot, unpivot, transpose, replace values, and remove empty operations.
- Use **Data Model** for normalization and denormalization.

