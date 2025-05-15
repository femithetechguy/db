alphabetically last name in a dataset. 

## GROUP BY, HAVING, ORDER BY

## GROUP BY

GROUP BY is an SQL clause used in SELECT statements to arrange identical data into groups.  It's typically used with aggregate functions (like COUNT, SUM, AVG) to perform calculations on each group of rows.  GROUP BY collects data across multiple records and groups the results by one or more columns, allowing for analysis of data at a higher level of granularity.  This clause is fundamental for generating summary reports, performing data analysis, and creating meaningful aggregations of data in relational databases. 

## HAVING

The HAVING clause is used in combination with the GROUP BY clause to filter the results of GROUP BY.  It is used to mention conditions on the group functions, like SUM, COUNT, AVG, MAX or MIN.  It's important to note that where WHERE clause introduces conditions on individual rows, HAVING introduces conditions on groups created by the GROUP BY clause.  Also note, HAVING applies to summarized group records, whereas WHERE applies to individual records. 

## ORDER BY

The ORDER BY clause in SQL is used to sort the result set of a query by one or more columns.  By default, the sorting is in ascending order, but you can specify descending order using the DESC keyword.  The clause can sort by numeric, date, or text values, and multiple columns can be sorted by listing them in the ORDER BY clause, each with its own sorting direction.  This clause is crucial for organizing data in a meaningful sequence, such as ordering by a timestamp to show the most recent records first, or alphabetically by name.  Practice: Write reports with grouped data.

# Hour 5: JOINs (60 min)

• Topics:

• INNER, LEFT, RIGHT, FULL OUTER, SELF, CROSS JOIN

## SQL JOIN Queries

SQL JOIN queries combine rows from two or more tables based on a related column between them.  There are several types of JOINs, including INNER JOIN (returns matching rows), LEFT JOIN (returns all rows from the left table and matching rows from the right), RIGHT JOIN (opposite of LEFT JOIN), and FULL JOIN (returns all rows when there's a match in either table).  JOIN s are fundamental for working with relational databases, allowing users to retrieve data from multiple tables in a single query, establish relationships between tables, and perform complex data analysis across related datasets. 


## INNER JOIN

An INNER JOIN in SQL is a type of join that returns the records with matching values in both tables.  This operation compares each row of the first table with each row of the second table to find all pairs of rows that satisfy the join predicate.  

Few things to consider in case of INNER JOIN:

- It is the default join in SQL. If you mention JOIN in your query without specifying the type, SQL considers it as an INNER JOIN. 
- It returns only the matching rows from both tables. 
- If there is no match, the result is an empty set. 

## LEFT JOIN

A LEFT JOIN in SQL returns all rows from the left (first) table and the matching rows from the right (second) table.  If there's no match in the right table, NULL values are returned for those columns.  This join type is useful when you want to see all records from one table, regardless of whether they have corresponding entries in another table.  LEFT JOIN s are commonly used for finding missing relationships, creating reports that include all primary records, or when working with data where not all entries have corresponding matches in related tables.  

## RIGHT JOIN

A RIGHT JOIN in SQL is a type of outer join that returns all rows from the right (second) table and the matching rows from the left (first) table.  If there's no match in the left table, NULL values are returned for the left table's columns.  This join type is less commonly used than LEFT JOIN but is particularly useful when you want to ensure all records from the second table are included in the result set, regardless of whether they have corresponding matches in the first table.  RIGHT JOIN is often used to identify missing relationships or to include all possible values from a lookup table. 


## FULL OUTER JOIN

A FULL OUTER JOIN in SQL combines the results of both LEFT and RIGHT OUTER JOIN s.  It returns all rows from both tables, matching records where the join condition is met and including unmatched rows from both tables with NULL values in place of missing data.  This join type is useful when you need to see all data from both tables, regardless of whether there are matching rows, and is particularly valuable for identifying missing relationships or performing data reconciliation between two tables.  

## Self Join

A SELF JOIN is a standard SQL operation where a table is joined to itself.  This might sound counter-intuitive, but it's actually quite useful in scenarios where comparison operations need to be made within a table.  Essentially, it is used to combine rows with other rows in the same table when there's a match based on the con