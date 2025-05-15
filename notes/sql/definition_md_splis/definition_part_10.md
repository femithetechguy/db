ract, and the date to modify.  This function is useful for date calculations, such as finding future or past dates, calculating durations, or generating date ranges.  The exact syntax and name of this function may vary slightly between different database management systems (e.g., DATEADD in SQL Server, DATE_ADD in MySQL). 

#### Numeric: ROUND, FLOOR, MOD, ABS, CEIL

### ROUND

The ROUND function in SQL is used to round a numeric value to a specified number of decimal places.  It takes two arguments: the number to be rounded and the number of decimal places to round to.  If the second argument is omitted, the function rounds the number to the nearest whole number.  For positive values of the second argument, the number is rounded to the specified decimal places;  for negative values, it rounds to the nearest ten, hundred, thousand, etc. The ROUND function is useful for formatting numerical data for reporting or ensuring consistent precision in calculations. 

### FLOOR

The SQL FLOOR function is used to round down any specific decimal or numeric value to its nearest whole integer.  The returned number will be less than or equal to the number given as an argument.  One important aspect to note is that the FLOOR function's argument must be a number and it always returns an integer. 





### MOD

The MOD function in SQL calculates the remainder when one number is divided by another.  It takes two arguments: the dividend and the divisor.  MOD returns the remainder of the division operation, which is useful for various mathematical operations, including checking for odd/even numbers, implementing cyclic behaviors, or distributing data evenly.  The syntax and exact behavior may vary slightly between different database systems, with some using the % operator instead of the MOD keyword. 

### ABS

The ABS() function in SQL returns the absolute value of a given numeric expression, meaning it converts any negative number to its positive equivalent while leaving positive numbers unchanged.  This function is useful when you need to ensure that the result of a calculation or a value stored in a database column is non-negative, such as when calculating distances, differences, or other metrics where only positive values make sense.  For example, SELECT ABS(-5) would return 5. 

### CEILING

The CEILING() function in SQL returns the smallest integer greater than or equal to a given numeric value.  It's useful when you need to round up a number to the nearest whole number, regardless of whether the number is already an integer or a decimal.  For example, CEILING(4.2) would return 5, and CEILING(-4.7) would return -4.  This function is commonly used in scenarios where rounding up is necessary, such as calculating the number of pages needed to display a certain number of items when each page has a fixed capacity. 

#### NULL Handling: NULLIF, COALESCE, CASE



### NULLIF

NULLIF is an SQL function that compares two expressions and returns NULL if they are equal, otherwise it returns the first expression.  It's particularly useful for avoiding division by zero errors or for treating specific values as NULL in calculations or comparisons.  NULLIF takes two arguments and is often used in combination with aggregate functions or in CASE statements to handle special cases in data processing or reporting. 

### COALESCE

COALESCE is an SQL function that returns the first non-null value in a list of expressions.  It's commonly used to handle null values or provide default values in queries.  COALESCE evaluates its arguments in order and returns the first non-null result, making it useful for data cleaning, report generation, and simplifying complex conditional logic in SQL statements. 

### CASE

The CASE statement in SQL is used to create conditional logic within a query, allowing you to perform different actions based on specific conditions.  It operates like an if-else statement, returning different values depending on the outcome of each condition.  The syntax typically involves specifying one or more WHEN conditions, followed by the result for each condition, and an optional ELSE clause for a default outcome if none of the conditions are met.  

Practice: Manipulate text, numbers, and dates in queries.

# Hour 8: Views & Transactions (45 min)

Topics:

#### Creating, Modifying, Dropping Views

### Views

Views in SQL are virtual tables based on the result set of an SQL statement.  They act as a saved query that can be treated like a table, offering several benefits:

- Simplify complex queries by encapsulating joins and subqueries.
- Enhance security by restricting access to underlying tables.
- Present data in a more relevant format for specific users or applications.

Views can be simple (based on a single table) or complex (involving multiple tables, subqueries, or functions).  Some databases support updatable views, allowing modifications to the underlying data through the view.  Materialized views, available in some system