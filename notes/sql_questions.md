# 85 Essential SQL Interview Questions & Answers

## Basic Concepts (1-15)

### 1. What is SQL?
SQL (Structured Query Language) is a standard language for managing and manipulating relational databases.

### 2. Name the different types of SQL commands
- **DDL** (Data Definition Language): CREATE, ALTER, DROP, TRUNCATE
- **DML** (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE 
- **DCL** (Data Control Language): GRANT, REVOKE
- **TCL** (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT

### 3. What is a Primary Key?
A column/set of columns that uniquely identifies each row in a table. Cannot contain NULL values.

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);