# Essential SQL Interview Questions & Answers

---

### 1. What is SQL?

**Answer:**  
SQL (Structured Query Language) is a standard language for storing, manipulating, and retrieving data in relational databases.

---

### 2. Name the different types of SQL commands

**Answer:**  
- **DDL** (Data Definition Language): CREATE, ALTER, DROP, TRUNCATE  
- **DML** (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE  
- **DCL** (Data Control Language): GRANT, REVOKE  
- **TCL** (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT

---

### 3. What is a primary key?

**Answer:**  
A primary key uniquely identifies each record in a table. It must contain unique values and cannot contain NULLs.

---

### 4. What is a foreign key?

**Answer:**  
A foreign key is a field (or collection of fields) in one table that refers to the primary key in another table, establishing a relationship between the two tables.

---

### 5. How do you select unique values from a column?

**Answer:**  
```sql
SELECT DISTINCT column_name FROM table_name;
```

---

### 6. What is the difference between `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL JOIN`?

**Answer:**  
- **INNER JOIN:** Returns records with matching values in both tables.
- **LEFT JOIN (LEFT OUTER JOIN):** Returns all records from the left table and matched records from the right table; NULL for no match.
- **RIGHT JOIN (RIGHT OUTER JOIN):** Returns all records from the right table and matched records from the left table; NULL for no match.
- **FULL JOIN (FULL OUTER JOIN):** Returns all records when there is a match in either left or right table; NULL where there is no match.

---

### 7. How do you filter records in SQL?

**Answer:**  
Use the `WHERE` clause:  
```sql
SELECT * FROM table_name WHERE condition;
```

---

### 8. How do you sort results in SQL?

**Answer:**  
Use the `ORDER BY` clause:  
```sql
SELECT * FROM table_name ORDER BY column_name [ASC|DESC];
```

---

### 9. How do you group data in SQL?

**Answer:**  
Use the `GROUP BY` clause:  
```sql
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;
```

---

### 10. What is the difference between `WHERE` and `HAVING`?

**Answer:**  
- `WHERE` filters rows before grouping.  
- `HAVING` filters groups after aggregation.

---

### 11. How do you update data in SQL?

**Answer:**  
```sql
UPDATE table_name SET column1 = value1 WHERE condition;
```

---

### 12. How do you delete data in SQL?

**Answer:**  
```sql
DELETE FROM table_name WHERE condition;
```

---

### 13. How do you insert data in SQL?

**Answer:**  
```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
```

---

### 14. What is a subquery?

**Answer:**  
A subquery is a query nested inside another query.

---

### 15. How do you find the second highest salary from an Employee table?

**Answer:**  
```sql
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
```

---

### 16. What is normalization? Name its types.

**Answer:**  
Normalization is the process of organizing data to reduce redundancy.  
Types: 1NF, 2NF, 3NF, BCNF, 4NF, 5NF.

---

### 17. What is denormalization?

**Answer:**  
Denormalization is the process of combining tables to improve read performance, at the cost of redundancy.

---

### 18. What is an index? Why is it used?

**Answer:**  
An index is a database object that improves the speed of data retrieval. It is created on columns used in search conditions.

---

### 19. How do you get the current date in SQL?

**Answer:**  
- SQL Server: `SELECT GETDATE();`
- MySQL: `SELECT NOW();`
- Oracle: `SELECT SYSDATE FROM dual;`

---

### 20. What is the difference between `DELETE`, `TRUNCATE`, and `DROP`?

**Answer:**  
- `DELETE`: Removes rows based on condition, can be rolled back.
- `TRUNCATE`: Removes all rows, cannot be rolled back (in most DBs), resets identity.
- `DROP`: Deletes the entire table structure.

---

### 21. How do you find duplicate records in a table?

**Answer:**  
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;
```

---

### 22. What is a view?

**Answer:**  
A view is a virtual table based on the result of a SQL statement.

---

### 23. What is a stored procedure?

**Answer:**  
A stored procedure is a set of SQL statements that can be executed as a program.

---

### 24. What is a trigger?

**Answer:**  
A trigger is a set of SQL statements that automatically executes in response to certain events on a table or view.

---

### 25. How do you limit the number of rows returned?

**Answer:**  
- SQL Server: `SELECT TOP 10 * FROM table_name;`
- MySQL/SQLite/PostgreSQL: `SELECT * FROM table_name LIMIT 10;`

---

### 26. How do you perform a case-insensitive search?

**Answer:**  
```sql
SELECT * FROM table_name WHERE LOWER(column_name) = 'value';
```

---

### 27. How do you concatenate strings in SQL?

**Answer:**  
- SQL Server: `SELECT column1 + column2 FROM table_name;`
- MySQL: `SELECT CONCAT(column1, column2) FROM table_name;`

---

### 28. How do you rename a column in the result set?

**Answer:**  
```sql
SELECT column_name AS new_name FROM table_name;
```

---

### 29. How do you get the number of records in a table?

**Answer:**  
```sql
SELECT COUNT(*) FROM table_name;
```

---

### 30. What is a self join?

**Answer:**  
A self join is a regular join but the table is joined with itself.

---

### 31. How do you select all columns from two tables with the same column names?

**Answer:**  
Use table aliases:  
```sql
SELECT a.*, b.*
FROM table1 a
JOIN table2 b ON a.id = b.id;
```

---

### 32. How do you retrieve only the first N characters of a string?

**Answer:**  
- SQL Server: `SELECT LEFT(column_name, N) FROM table_name;`
- MySQL: `SELECT SUBSTRING(column_name, 1, N) FROM table_name;`

---

### 33. How do you check for NULL values?

**Answer:**  
```sql
SELECT * FROM table_name WHERE column_name IS NULL;
```

---

### 34. How do you replace NULL with a default value?

**Answer:**  
- SQL Server: `SELECT ISNULL(column_name, 'default') FROM table_name;`
- MySQL/Oracle: `SELECT IFNULL(column_name, 'default') FROM table_name;`
- PostgreSQL: `SELECT COALESCE(column_name, 'default') FROM table_name;`

---

### 35. What is a composite key?

**Answer:**  
A composite key is a combination of two or more columns used to uniquely identify a row.

---

### 36. How do you perform a UNION of two queries?

**Answer:**  
```sql
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;
```
*Use `UNION ALL` to include duplicates.*

---

### 37. What is a CTE (Common Table Expression)?

**Answer:**  
A CTE is a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.

```sql
WITH cte_name AS (
  SELECT column1 FROM table1
)
SELECT * FROM cte_name;
```

---

### 38. How do you get the nth highest value in a column?

**Answer:**  
```sql
SELECT DISTINCT column_name
FROM table_name
ORDER BY column_name DESC
LIMIT n-1,1; -- MySQL
```
For SQL Server, use `ROW_NUMBER()`.

---

### 39. What is the difference between `UNION` and `JOIN`?

**Answer:**  
- `UNION` combines the result of two queries with the same number of columns.
- `JOIN` combines columns from two or more tables based on a related column.

---

### 40. How do you add a new column to an existing table?

**Answer:**  
```sql
ALTER TABLE table_name ADD column_name datatype;
```

---

### 41. How do you change the data type of a column?

**Answer:**  
```sql
ALTER TABLE table_name ALTER COLUMN column_name new_datatype; -- SQL Server
ALTER TABLE table_name MODIFY column_name new_datatype; -- MySQL/Oracle
```

---

### 42. How do you remove a column from a table?

**Answer:**  
```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

---

### 43. How do you copy data from one table to another?

**Answer:**  
```sql
INSERT INTO table2 (column1, column2)
SELECT column1, column2 FROM table1;
```

---

### 44. How do you find the maximum/minimum value in a column?

**Answer:**  
```sql
SELECT MAX(column_name) FROM table_name;
SELECT MIN(column_name) FROM table_name;
```

---

### 45. How do you calculate the average of a column?

**Answer:**  
```sql
SELECT AVG(column_name) FROM table_name;
```

---

### 46. How do you use the `CASE` statement in SQL?

**Answer:**  
```sql
SELECT column_name,
  CASE
    WHEN condition THEN 'Result1'
    ELSE 'Result2'
  END AS new_column
FROM table_name;
```

---

### 47. What is a transaction in SQL?

**Answer:**  
A transaction is a sequence of operations performed as a single logical unit of work. It is either fully completed or not executed at all.

---

### 48. How do you start and end a transaction?

**Answer:**  
```sql
BEGIN TRANSACTION;
-- SQL statements
COMMIT; -- or ROLLBACK;
```

---

### 49. What is ACID property in databases?

**Answer:**  
- **Atomicity:** All or nothing.  
- **Consistency:** Data must be valid.  
- **Isolation:** Transactions do not interfere.  
- **Durability:** Once committed, changes are permanent.

---

### 50. How do you get the difference between two dates?

**Answer:**  
- SQL Server: `DATEDIFF(day, date1, date2)`
- MySQL: `DATEDIFF(date2, date1)`
- Oracle: `date2 - date1`

---