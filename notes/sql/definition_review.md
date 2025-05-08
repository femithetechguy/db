# SQL Study Guide Checklist & Resources

## Hour 1: SQL Basics & RDBMS Concepts
- [ ] Introduction to SQL
- [ ] Relational Databases
- [ ] RDBMS Benefits/Limitations
- [ ] SQL vs NoSQL
- [ ] Basic Syntax
- [ ] Keyword, Datatype & Operators

**Resources:**
- 🔗 [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
- 🔗 [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- 🎥 [Stanford DB Course](https://www.youtube.com/watch?v=D-k-h0GuFmE&list=PL6hGtHedy2Z4EkgY76QOcueU8lAC4o6c3)

## Hour 2: DDL & DML
- [ ] CREATE TABLE
- [ ] ALTER TABLE
- [ ] DROP TABLE
- [ ] SELECT
- [ ] INSERT
- [ ] UPDATE
- [ ] DELETE

**Practice:**
```sql
-- Basic table creation
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

-- Simple CRUD operations
INSERT INTO employees VALUES (1, 'John Doe', 'IT');
SELECT * FROM employees WHERE department = 'IT';
```

## Hour 3: Constraints & Indexes
- [ ] Primary Keys
- [ ] Foreign Keys
- [ ] UNIQUE
- [ ] NOT NULL
- [ ] CHECK
- [ ] Index Types

## Hour 4: Aggregates & Grouping
- [ ] COUNT()
- [ ] SUM()
- [ ] AVG()
- [ ] MIN()/MAX()
- [ ] GROUP BY
- [ ] HAVING

## Hour 5: JOINs
- [ ] INNER JOIN
- [ ] LEFT JOIN
- [ ] RIGHT JOIN
- [ ] FULL OUTER JOIN
- [ ] CROSS JOIN
- [ ] SELF JOIN

## Hour 6: Subqueries
- [ ] Single Row Subqueries
- [ ] Multiple Row Subqueries
- [ ] Correlated Subqueries
- [ ] EXISTS/NOT EXISTS

**Practice:**
```sql
-- Subquery in WHERE clause
SELECT name 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Correlated subquery
SELECT department,
       (SELECT COUNT(*) 
        FROM employees e2 
        WHERE e2.department = e1.department) as emp_count
FROM employees e1
GROUP BY department;
```

## Hour 7: Advanced SQL Functions
- [ ] String Functions
- [ ] Date Functions
- [ ] Numeric Functions
- [ ] Window Functions

**Practice:**
```sql
-- Window functions
SELECT 
    department,
    name,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) as salary_rank,
    LAG(salary) OVER (ORDER BY salary) as previous_salary
FROM employees;
```

## Hour 8: Views & Transactions
- [ ] Creating Views
- [ ] Modifying Views
- [ ] Transaction Control (COMMIT, ROLLBACK)
- [ ] ACID Properties

**Practice:**
```sql
-- Create a view
CREATE VIEW high_salary_employees AS
SELECT name, department, salary
FROM employees
WHERE salary > 50000;

-- Transaction example
BEGIN;
    UPDATE accounts SET balance = balance - 100 WHERE id = 1;
    UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

## Hour 9: Optimization & Security
- [ ] Query Optimization
- [ ] Index Strategy
- [ ] EXPLAIN PLAN
- [ ] User Permissions
- [ ] SQL Injection Prevention

**Resources for Advanced Topics:**
- 🔗 [Use The Index, Luke!](https://use-the-index-luke.com/)
- 🔗 [PostgreSQL Performance Tips](https://www.postgresql.org/docs/current/performance-tips.html)
- 📚 [SQL Antipatterns](http://sql-antipatterns.com/)

## Practice Exercises
```sql
-- Complex query combining multiple concepts
WITH dept_stats AS (
    SELECT 
        department,
        AVG(salary) as avg_salary,
        COUNT(*) as emp_count
    FROM employees
    GROUP BY department
)
SELECT 
    e.name,
    e.department,
    e.salary,
    ROUND(e.salary - ds.avg_salary, 2) as salary_diff
FROM employees e
JOIN dept_stats ds ON e.department = ds.department
WHERE ds.emp_count > 5
ORDER BY salary_diff DESC;
```

## Final Checklist
- [ ] Complete all practice exercises
- [ ] Review error messages and solutions
- [ ] Test with different data scenarios
- [ ] Understand query optimization basics
- [ ] Practice security best practices