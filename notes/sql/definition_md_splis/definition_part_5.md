 the data that can be inserted, updated, or deleted in a database, ensuring that the data meets specific criteria and maintains relationships between tables.  By implementing data constraints, database designers can prevent invalid data entry, maintain referential integrity, and enforce business rules directly at the database level.

##   Primary Key

A primary key in SQL is a unique identifier for each record in a database table.  It ensures that each row in the table is uniquely identifiable, meaning no two rows can have the same primary key value.  A primary key is composed of one or more columns, and it must contain unique values without any NULL entries.  The primary key enforces entity integrity by preventing duplicate records and ensuring that each record can be precisely located and referenced, often through foreign key relationships in other tables.  Using a primary key is fundamental for establishing relationships between tables and maintaining the integrity of the data model. 

##   Foreign Key

A foreign key in SQL is a column or group of columns in one table that refers to the primary key of another table.  It establishes a link between two tables, enforcing referential integrity and maintaining relationships between related data.  Foreign keys ensure that values in the referencing table correspond to valid values in the referenced table, preventing orphaned records and maintaining data consistency across tables.  They are crucial for implementing relational database designs and supporting complex queries that join multiple tables. 

##   Unique

UNIQUE is a constraint in SQL used to ensure that all values in a column or a set of columns are distinct.  When applied to a column or a combination of columns, it prevents duplicate values from being inserted into the table.  This constraint is crucial for maintaining data integrity, especially for fields like email addresses, usernames, or product codes where uniqueness is required.  UNIQUE constraints can be applied during table creation or added later, and they automatically create an index on the specified column(s) for improved query performance.  Unlike PRIMARY KEY constraints, UNIQUE columns can contain NULL values (unless explicitly disallowed), and a table can have multiple UNIQUE constraints. 

##   NOT NULL

The NOT NULL constraint in SQL ensures that a column cannot have a NULL value.  Thus, every row/record must contain a value for that column.  It is a way to enforce certain fields to be mandatory while inserting records or updating records in a table.  For instance, if you're designing a table for employee data, you might want to ensure that the employee's id and name are always provided.  In this case, you'd use the NOT NULL constraint. 

##   CHECK

A CHECK constraint in SQL is used to enforce data integrity by specifying a condition that must be true for each row in a table.  It allows you to define custom rules or restrictions on the values that can be inserted or updated in one or more columns.  CHECK constraints help maintain data quality by preventing invalid or inconsistent data from being added to the database, ensuring that only data meeting specified criteria is accepted. 

| Constraint    | Purpose                                                      | Example                                                                |
| :------------ | :----------------------------------------------------------- | :--------------------------------------------------------------------- |
| NOT NULL      | Prevents NULL values                                         | name VARCHAR(108) NOT NULL email VARCHAR(180) UNIQUE                   |
| UNIQUE        | Ensures all values in a column are different                 |                                                                        |
| PRIMARY KEY   | Uniquely identifies each row (also NOT NULL)                 | id INT PRIMARY KEY                                                     |
| FOREIGN KEY   | Links to a primary key in another table                      | FOREIGN KEY (dept\_id) REFERENCES departments (dept\_id)              |
| CHECK         | Ensures a value meets a condition                            | age INT CHECK (age \> 18)                                              |
| DEFAULT       | Sets a default value if none is provided                     | created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP                        |

##   Example Table Using Constraints:

```sql
CREATE TABLE User's (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    age INT CHECK (age > 13),
    signup_date DATE DEFAULT CURRENT_DATE
);
```

Summary

| Constraint Type | Enforces                                             |
| --------------- | ---------------------------------------------------- |
| Column-level    | On individual columns                              |
| Table-level     | Across multiple columns or tables (e.g., foreign