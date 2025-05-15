dition provided.  It's important to note that, since it's a join operation on the same table, alias(es) for table(s) must be used to avoid confusion during the join operation.  

## Cross Join

The cross join in SQL is used to combine every row of the first table with every row of the second table.  It's also known as the Cartesian product of the two tables.  The most important aspect of performing a cross join is that it does not require any condition to join.  The issue with cross join is it returns the Cartesian product of the two tables, which can result in large numbers of rows and heavy resource usage.  It's hence critical to use them wisely and only when necessary. 

• Practice: Create relational queries across multiple tables.

# Hour 6: Subqueries (45 min)

# Sub Queries

Subqueries, also known as nested queries or inner queries, are SQL queries embedded within another query.  They can be used in various parts of SQL statements, such as SELECT, FROM, WHERE, and HAVING clauses.  Subqueries allow for complex data retrieval and manipulation by breaking down complex queries into more manageable parts.  They're particularly useful for creating dynamic criteria, performing calculations, or comparing sets of results.  Topics:

## Scalar, Column, Row, Table Subqueries

### Table

A table is a fundamental structure for organizing data in a relational database.  It consists of rows (records) and columns (fields), representing a collection of related data entries.  Tables define the schema of the data, including data types and constraints.  They are the primary objects for storing and retrieving data in SQL databases, and understanding table structure is crucial for effective database design and querying. 


### Row

In SQL, a row (also called a record or tuple) represents a single, implicitly structured data item in a table.  Each row contains a set of related data elements corresponding to the table's columns.  Rows are fundamental to the relational database model, allowing for the organized storage and retrieval of information.  Operations like INSERT, UPDATE, and DELETE typically work at the row level. 

### Column

In SQL, columns are used to categorize the data in a table.  A column serves as a structure that stores a specific type of data (ints, str, bool, etc.) in a table.  Each column in a table is designed with a type, which configures the data that it can hold.  Using the right column types and size can help to maintain data integrity and optimize performance. 

### Scalar

A scalar value is a single data item, as opposed to a set or array of values.  Scalar subqueries are queries that return exactly one column and one row, often used in SELECT statements, WHERE clauses, or as part of expressions.  Scalar functions in SQL return a single value based on input parameters.  Understanding scalar concepts is crucial for writing efficient and precise SQL queries. 


## Nested & Correlated Subqueries

### Nested Subqueries

In SQL, a subquery is a query that is nested inside a main query.  If a subquery is nested inside another subquery, it is called a nested subquery.  They can be used in SELECT, INSERT, UPDATE, or DELETE statements or inside another subquery.  Nested subqueries can get complicated quickly, but they are essential for performing complex database tasks. 

### Correlated Subqueries

In SQL, a correlated subquery is a subquery that uses values from the outer query in its WHERE clause.  The correlated subquery is evaluated once for each row processed by the outer query.  It exists because it depends on the outer query and it cannot execute independently of the outer query because the subquery is correlated with the outer query as it uses its column in its WHERE clause.   Practice: Use subqueries in SELECT, FROM, and WHERE clauses.

# Hour 7: Advanced SQL Functions (60 min)

Topics:

## Advanced SQL Functions

Advanced SQL functions enable more sophisticated data manipulation and analysis within databases, offering powerful tools for complex queries.  Key areas include:

**String Functions:** Manipulate text data using functions like CONCAT, SUBSTRING, and REPLACE to combine, extract, or modify strings.  
**Date & Time:** Manage temporal data with functions like DATEADD, DATEDIFF, and FORMAT, allowing for calculations and formatting of dates and times.  
**Numeric Functions:** Perform advanced calculations using functions such as ROUND, FLOOR, and CEIL, providing precision in numerical data processing.  
**Conditional:** Implement logic within queries using functions like CASE, COALESCE, and NULLIF to control data flow and handle conditional scenarios.  

#### String: CONCAT, LENGTH, SUBSTRING, REPLACE, UPPER, LOWER

### CONCAT

CONCAT is an SQL function used to combine two or more strings into a single string.  It takes multiple input strings as arguments and returns a new string that is the concatenation of all the input strings in the order they were provided.  CONCAT is commonly used in SE