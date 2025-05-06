# One-Day SQL Study Plan

A comprehensive SQL study plan covering all major areas in approximately 9.5 hours (excluding breaks).

## Overview
- Total Duration: ~9.5 hours
- Target: Complete SQL fundamentals in one intensive day
- Format: Can be spread over a weekend or done in chunks

## Hour 1: SQL Basics & RDBMS Concepts (60 min)
### Topics:
1. Introduction to SQL
2. Relational Databases
3. RDBMS Benefits and Limitations
4. SQL vs NoSQL
5. Basic SQL Syntax
6. SQL Keywords & Data Types

### Core SQL Concepts (90% of real-world usage):
| Skill | Example |
|-------|---------|
| SELECT and Filtering | `SELECT name FROM employees WHERE salary > 50000;` |
| JOINS | `SELECT * FROM orders JOIN customers ON orders.customer_id = customers.id;` |
| GROUP BY | `SELECT department, AVG(salary) FROM employees GROUP BY department;` |
| Subqueries | `SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);` |
| CASE Statements | `SELECT name, CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END FROM employees;` |
| Window Functions | `SELECT name, salary, RANK() OVER (ORDER BY salary DESC) FROM employees;` |

## Hour 2: DDL & DML (60 min)
### Topics:
1. Data Definition Language (DDL)
   - CREATE
   - ALTER
   - TRUNCATE
2. Data Manipulation Language (DML)
   - SELECT
   - INSERT
   - UPDATE
   - DELETE

## Hour 3: Constraints & Indexes (60 min)
### Topics:
1. Data Constraints
   - PRIMARY KEY
   - FOREIGN KEY
   - UNIQUE
   - NOT NULL
   - CHECK
2. Indexes
   - Creating Indexes
   - Managing Indexes

## Hour 4: Aggregates & Grouping (45 min)
### Topics:
1. Aggregate Functions
   - SUM
   - COUNT
   - AVG
   - MIN
   - MAX
2. GROUP BY
3. HAVING
4. ORDER BY

## Hour 5: JOINs (60 min)
### Topics:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN

## Hour 6: Subqueries (45 min)
### Topics:
1. Types of Subqueries
   - Scalar
   - Column
   - Row
   - Table
2. Nested & Correlated Subqueries

## Hour 7: Advanced SQL Functions (60 min)
### Topics:
1. String Functions
   - CONCAT
   - LENGTH
   - SUBSTRING
   - REPLACE
   - UPPER/LOWER
2. Date & Time Functions
   - DATE
   - TIME
   - TIMESTAMP
   - DATEADD
   - DATEPART
3. Numeric Functions
   - ROUND
   - FLOOR
   - MOD
   - ABS
   - CEIL
4. NULL Handling
   - NULLIF
   - COALESCE
   - CASE

## Hour 8: Views & Transactions (45 min)
### Topics:
1. Views
   - Creating
   - Modifying
   - Dropping
2. Transactions
   - BEGIN
   - COMMIT
   - ROLLBACK
   - SAVEPOINT
3. ACID Properties

## Hour 9: Optimization & Advanced Concepts (60 min)
### Topics:
1. Query Optimization
2. Security (GRANT & REVOKE)
3. Window Functions
   - ROW_NUMBER
   - RANK
   - DENSE_RANK
   - LEAD/LAG
4. Advanced Concepts
   - CTEs
   - Dynamic SQL
   - Recursive Queries
   - Pivot/Unpivot

## Wrap-Up (30 min)
- Review key concepts
- Identify areas for improvement
- Complete recap quiz
- Create flashcards for future review


