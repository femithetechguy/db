// ...existing code...

## Most Asked SQL Interview Questions of All Time

### 1. Basic Database Concepts
1. **What is SQL and its types?**
   - *DDL*: Define structure (CREATE, ALTER, DROP)
   - *DML*: Manipulate data (SELECT, INSERT, UPDATE, DELETE)
   - *DCL*: Control access (GRANT, REVOKE)
   - *TCL*: Transaction control (COMMIT, ROLLBACK)

2. **ACID properties explained?**
   - *Atomicity*: Transaction is all or nothing
   - *Consistency*: Database remains valid
   - *Isolation*: Transactions don't interfere
   - *Durability*: Committed changes persist

### 2. Basic Operations
3. **Different types of JOIN with examples:**
```sql
-- INNER JOIN: matching rows
SELECT * FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

-- LEFT JOIN: all from left, matching from right
SELECT * FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id;

-- FULL JOIN: all rows from both
SELECT * FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.id;
```

4. **GROUP BY vs HAVING:**
```sql
SELECT department, AVG(salary) as avg_sal
FROM employees
WHERE salary > 30000           -- filters before grouping
GROUP BY department
HAVING AVG(salary) > 50000;   -- filters after grouping
```

### 3. Advanced Queries
5. **Window Functions usage:**
```sql
SELECT 
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) as dept_avg,
    RANK() OVER(ORDER BY salary DESC) as salary_rank
FROM employees;
```

6. **CTE vs Subquery:**
```sql
-- CTE (more readable)
WITH high_paid AS (
    SELECT * FROM employees WHERE salary > 50000
)
SELECT * FROM high_paid;

-- Equivalent Subquery
SELECT * FROM 
    (SELECT * FROM employees WHERE salary > 50000) as high_paid;
```

### 4. Performance & Optimization
7. **Indexes explained:**
   - *Clustered*: Physical order of rows (one per table)
   - *Non-clustered*: Separate structure with pointers
   - *Composite*: Multiple columns
   - *Benefits*: Faster retrieval
   - *Drawbacks*: Slower writes, more storage

8. **How to optimize slow queries?**
   - Use EXPLAIN PLAN
   - Add proper indexes
   - Avoid SELECT *
   - Use JOIN instead of subqueries where possible
   - Minimize wildcard usage at start of LIKE

### 5. Common Problems
9. **Find duplicate records:**
```sql
SELECT name, COUNT(*) as count
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;
```

10. **Delete duplicates:**
```sql
WITH dups AS (
    SELECT *, 
        ROW_NUMBER() OVER(PARTITION BY name ORDER BY id) as rn
    FROM employees
)
DELETE FROM dups WHERE rn > 1;
```

### 6. Advanced Concepts
11. **Difference between UNION and UNION ALL:**
```sql
-- UNION: removes duplicates
SELECT name FROM employees
UNION
SELECT name FROM contractors;

-- UNION ALL: keeps duplicates (faster)
SELECT name FROM employees
UNION ALL
SELECT name FROM contractors;
```

12. **PIVOT table example:**
```sql
SELECT *
FROM (
    SELECT department, salary
    FROM employees
) AS source
PIVOT (
    AVG(salary)
    FOR department IN ([HR], [IT], [Sales])
) AS pivot_table;
```

### 7. Transaction Management
13. **Transaction Isolation Levels:**
   - *READ UNCOMMITTED*: Dirty reads possible
   - *READ COMMITTED*: No dirty reads
   - *REPEATABLE READ*: Same reads in transaction
   - *SERIALIZABLE*: Complete isolation

14. **Deadlock handling:**
```sql
BEGIN TRANSACTION;
    SET DEADLOCK_PRIORITY HIGH;
    -- your code here
COMMIT;
```

### 8. Data Integrity
15. **Constraints overview:**
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    email VARCHAR(50) UNIQUE,
    dept_id INT FOREIGN KEY REFERENCES departments(id)
);
```
