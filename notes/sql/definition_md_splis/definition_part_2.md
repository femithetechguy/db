cost and complexity. 

Learn more from the following resources: 

## SQL vs NoSQL

SQL (relational) and NoSQL (non-relational) databases represent two different approaches to data storage and retrieval.  SQL databases use structured schemas and tables, emphasizing data integrity and complex queries through joins.  NoSQL databases offer more flexibility in data structures, often sacrificing some consistency for scalability and performance.  The choice between SQL and NoSQL depends on factors like data structure, scalability needs, consistency requirements, and the nature of the application. 

Learn more from the following resources:

## Basic SQL Syntax

Basic SQL syntax consists of straightforward commands that allow users to interact with a relational database.  The core commands include SELECT for querying data, INSERT INTO for adding new records, UPDATE for modifying existing data, and DELETE for removing records.  Queries can be filtered using WHERE, sorted with ORDER BY, and data from multiple tables can be combined using JOIN.  These commands form the foundation of SQL, enabling efficient data manipulation and retrieval within a database.  Learn more about SQL from the following resources:

## SQL Keywords & Data Types

### SQL keywords

SQL keywords are reserved words that have special meanings within SQL statements.  These include commands (like SELECT, INSERT, UPDATE), clauses (such as WHERE, GROUP BY, HAVING), and other syntax elements that form the structure of SQL queries.  Understanding SQL keywords is fundamental to writing correct and effective database queries.  Keywords are typically case-insensitive but are often written in uppercase by convention for better readability.  Learn more from the following resources:

### Data Types

SQL data types define the kind of values that can be stored in a column and determine how the data is stored, processed, and retrieved.  Common data types include numeric types (INTEGER, DECIMAL), character types (CHAR, VARCHAR), date and time types (DATE, TIMESTAMP), binary types (BLOB), and boolean types.  Each database management system may have its own specific set of data types with slight variations.  Choosing the appropriate data type for each column is crucial for optimizing storage, ensuring data integrity, and improving query performance.  Learn more from the following resources:

## Operators

SQL operators are symbols or keywords used to perform operations on data within a database.  They are essential for constructing queries that filter, compare, and manipulate data.  Common types of operators include arithmetic operators (e.g., +, -, *, /), which perform mathematical calculations;  comparison operators (e.g., =, !=, <, >), used to compare values;  logical operators (e.g., AND, OR, NOT), which combine multiple conditions in a query;  and set operators (e.g., UNION, INTERSECT, EXCEPT), which combine results from multiple queries.  These operators enable precise control over data retrieval and modification.  Learn more from the following resources:

## Practice: Simple SELECT, INSERT, UPDATE, DELETE queries. 90% of real world SQL usage 

The following table:

| Skill                  | Example Practice                                                  |
| :--------------------- | :---------------------------------------------------------------- |
| SELECT and Filtering   | SELECT name FROM employees WHERE salary > 50000;                   |
| JOINS (INNER, LEFT, RIGHT) | SELECT \* FROM orders JOIN customers ON orders.customer\_id = customers.id; |
| GROUP BY and Aggregations | SELECT department, AVG(salary) FROM employees GROUP BY department;   |
| Subqueries             | SELECT \* FROM employees WHERE salary > (SELECT AVG(salary) FROM employees); |

The following table:

| CASE Statements             | SELECT name, CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END FROM employees; |
| :-------------------------- | :----------------------------------------------------------------------------- |
| Window Functions (if intermediate) | SELECT name, salary, RANK() OVER (ORDER BY salary DESC) FROM employees;    |

A.  In SQL, SELECT chooses the columns you want, and WHERE filters the rows you need based on specific conditions. 

B.  In SQL, a JOIN combines rows from two or more tables based on a related column between them.  In SQL, INNER JOIN returns matching rows from both tables, LEFT JOIN returns all rows from the left table and matching ones from the right, and RIGHT JOIN returns all rows from the right table and matching ones from the left. 

C.  In SQL, GROUP BY groups rows that have the same values in specified columns, and aggregations like SUM(), COUNT(), or AVG() summarize data for each group. 

D.  In SQL, a subquery is a query inside another query that provides data to the main query, often used in WHERE, FROM, or SELECT clauses. 

E.  In SQL, a CASE statement allows you to perform conditional logic within a query, returning different values ba