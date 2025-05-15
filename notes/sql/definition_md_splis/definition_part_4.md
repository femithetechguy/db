ubqueries, joins, and CTEs (Common Table Expressions) for more complex data modifications.  It's important to use UPDATE carefully, especially with the WHERE clause, to avoid unintended changes to data.  In transactional databases, UPDATE operations can be rolled back if they're part of a transaction that hasn't been committed. 

## DELETE

DELETE is an SQL statement used to remove one or more rows from a table.  It allows you to specify which rows to delete using a WHERE clause, or delete all rows if no condition is provided.  DELETE is part of the Data Manipulation Language (DML) and is used for data maintenance, removing outdated or incorrect information, or implementing business logic that requires data removal.  When used without a WHERE clause, it empties the entire table while preserving its structure, unlike the TRUNCATE command. 

## FROM

The FROM clause in SQL specifies the tables from which the retrieval should be made.  It is an integral part of SELECT statements and variants of SELECT like SELECT INTO and SELECT WHERE.  FROM can be used to join tables as well. 

Typically, FROM is followed by space delimited list of tables in which the SELECT operation is to be executed.  If you need to pull data from multiple tables, you would separate each table with a comma.  Learn more from the following resources:

## WHERE

SQL provides a WHERE clause that is basically used to filter the records.  If the condition specified in the WHERE clause satisfies, then only it returns the specific value from the table.  You should use the WHERE clause to filter the records and fetching only the necessary records.  The WHERE clause is not only used in SELECT statement, but it is also used in UPDATE, DELETE statement, etc., which we will learn in subsequent chapters. 

## GROUP BY

GROUP BY is an SQL clause used in SELECT statements to arrange identical data into groups.  It's typically used with aggregate functions (like COUNT, SUM, AVG) to perform calculations on each group of rows.  GROUP BY collects data across multiple records and groups the results by one or more columns, allowing for analysis of data at a higher level of granularity.  This clause is fundamental for generating summary reports, performing data analysis, and creating meaningful aggregations of data in relational databases. 

## ORDER BY

The ORDER BY clause in SQL is used to sort the result set of a query by one or more columns.  By default, the sorting is in ascending order, but you can specify descending order using the DESC keyword.  The clause can sort by numeric, date, or text values, and multiple columns can be sorted by listing them in the ORDER BY clause, each with its own sorting direction.  This clause is crucial for organizing data in a meaningful sequence, such as ordering by a timestamp to show the most recent records first, or alphabetically by name.

## JOINS

SQL JOINs are clauses used to combine rows from two or more tables based on a related column between them.  They allow retrieval of data from multiple tables in a single query, enabling complex data analysis and reporting.  The main types of JOINs include:

* INNER JOIN (returns matching rows from both tables)
* LEFT JOIN (returns all rows from the left table and matching rows from the right)
* RIGHT JOIN (opposite of LEFT JOIN)
* FULL JOIN (returns all rows when there's a match in either table)

JOINs are fundamental to relational database operations, facilitating data integration and exploration across related datasets. 

## HAVING

The HAVING clause is used in combination with the GROUP BY clause to filter the results of GROUP BY.  It is used to mention conditions on the group functions, like SUM, COUNT, AVG, MAX or MIN.  It's important to note that where WHERE clause introduces conditions on individual rows, HAVING introduces conditions on groups created by the GROUP BY clause.  Also note, HAVING applies to summarized group records, whereas WHERE applies to individual records.

Practice: Create and manipulate sample tables.

Hour 3: Constraints & Indexes (60 min) Topics:

## Data Integrity Constraints

SQL constraints are used to specify rules for the data in a table.  They ensure the accuracy and reliability of the data within the table.  If there is any violation between the constraint and the action, the action is aborted by the constraint.  Constraints are classified into two types: column level and table level.  Column level constraints apply to individual columns whereas table level constraints apply to the entire table.  Each constraint has its own purpose and usage, utilizing them effectively helps maintain the accuracy and integrity of the data. 

## Data Constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK

## Data Constraints

Data constraints in SQL are rules applied to columns or tables to enforce data integrity and consistency.  They include primary key, foreign key, unique, check, and not null constraints.  These constraints define limitations on