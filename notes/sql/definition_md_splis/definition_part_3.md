sed on specified conditions. 

F.  In SQL, window functions perform calculations across a set of rows related to the current row, without collapsing the result set, allowing you to calculate values like running totals, rankings, or moving averages. 

Examples

SJGSCW: Saint John Got Some Case Work

1.  SELECT and Filtering
2.  Join(INNER LEFT and RIGHT)
3.  Group and aggregation
4.  Subqueries
5.  Case STATEMENTS
6.  Window functions

# Hour 2: DDL & DML (60 min)

Topics:

O

Data Definition Language (DDL): CREATE, ALTER, TRUNCATE



## Data Definition Language (DDL)

Data Definition Language (DDL) is a subset of SQL used to define and manage the structure of database objects.  DDL commands include CREATE, ALTER, DROP, and TRUNCATE, which are used to create, modify, delete, and empty database structures such as tables, indexes, views, and schemas.  These commands allow database administrators and developers to define the database schema, set up relationships between tables, and manage the overall structure of the database.  DDL statements typically result in immediate changes to the database structure and can affect existing data. 

### Create Table

CREATE TABLE is an SQL statement used to define and create a new table in a database.  It specifies the table name, column names, data types, and optional constraints such as primary keys, foreign keys, and default values.  This statement establishes the structure of the table, defining how data will be stored and organized within it.  CREATE TABLE is a fundamental command in database management, essential for setting up the schema of a database and preparing it to store data.  Learn more from the following resources:

### Alter Table

The ALTER TABLE statement in SQL is used to modify the structure of an existing table.  This includes adding, dropping, or modifying columns, changing the data type of a column, setting default values, and adding or dropping primary or foreign keys.  Learn more from the following resources:

### Drop Table

The DROP TABLE statement is a Data Definition Language (DDL) operation that is used to completely remove a table from the database.  This operation deletes the table structure along with all the data in it, effectively removing the table from the database system.  When you execute the DROP TABLE statement, it eliminates both the table and its data, as well as any associated indexes, constraints, and triggers.  Unlike the TRUNCATE TABLE statement, which only removes data but keeps the table structure, DROP TABLE removes everything associated with the table. 

### Truncate Table

The TRUNCATE TABLE statement is a Data Definition Language (DDL) operation that is used to mark the extents of a table for deallocation (empty for reuse).  The result of this operation quickly removes all data from a table, typically bypassing a number of integrity enforcing mechanisms intended to protect data (like triggers).  It effectively eliminates all records in a table, but not the table itself.  Unlike the DELETE statement, TRUNCATE TABLE does not generate individual row delete statements, so the usual overhead for logging or locking does not apply. 

## Data Manipulation Language (DML): SELECT, INSERT, UPDATE, DELETE 

Data Manipulation Language (DML) is a subset of SQL used to manage data within database objects.  It includes commands like SELECT, INSERT, UPDATE, and DELETE, which allow users to retrieve, add, modify, and remove data from tables.  DML statements operate on the data itself rather than the database structure, enabling users to interact with the stored information.  These commands are essential for day-to-day database operations, data analysis, and maintaining the accuracy and relevance of the data within a database system.  Visit the following resources to learn more:

## SELECT

SELECT is one of the most fundamental SQL commands, used to retrieve data from one or more tables in a database.  It allows you to specify which columns to fetch, apply filtering conditions, sort results, and perform various operations on the data.  The SELECT statement is versatile, supporting joins, subqueries, aggregations, and more, making it essential for data querying and analysis in relational databases.  Learn more from the following resources:

## INSERT

The "INSERT" statement is used to add new rows of data to a table in a database.  There are two main forms of the INSERT command: INSERT INTO which, if columns are not named, expects a full set of columns, and INSERT INTO table_name (column1, column2, ...) where only named columns will be filled with data. 

## UPDATE

The UPDATE statement in SQL is used to modify existing records in a table.  It allows you to change the values of one or more columns based on specified conditions.  The basic syntax includes specifying the table name, the columns to be updated with their new values, and optionally, a WHERE clause to filter which rows should be affected.  UPDATE can be used in conjunction with s