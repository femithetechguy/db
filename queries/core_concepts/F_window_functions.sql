-- Switch to the new database
USE fttg_db;
GO

-- identify which database is currently in use
SELECT DB_NAME() AS CurrentDatabase;
GO

-- Check current user and their default schema:
SELECT 
    USER_NAME() AS CurrentUser,
    SCHEMA_NAME() AS DefaultSchema,
    DB_NAME() AS CurrentDatabase;
GO

-- List all schemas in the current database
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA;
GO

-- OR 

SELECT name AS SchemaName
FROM sys.schemas;
GO

--  See current schema, this is the schema that will be used if no schema is specified
-- in the query
-- This is the default schema for the current user
SELECT SCHEMA_NAME() AS CurrentSchema;
GO

--  See all tables in current schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = SCHEMA_NAME();
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = SCHEMA_NAME();
GO

-- OR

--  See all tables in specified schema
SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'windowfunction_schema';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'windowfunction_schema';
GO

-- Retrieve information about all tables in the current database. 
SELECT *
FROM INFORMATION_SCHEMA.TABLES;
GO

-- OR 

-- See all tables in the current database with associated schema
SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- BEGIN OTHER QUERIES HERE

-- Verify windowfunction_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'windowfunction_schema';
GO 

-- Create windowfunction_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'windowfunction_schema')
    EXEC('CREATE SCHEMA windowfunction_schema')
GO

-- Double Verify windowfunction_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'windowfunction_schema';
GO 

-- New Changes Begin Here

-- Create windowfunction_schema.Sales table if not exists
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Sales' AND SCHEMA_NAME(schema_id) = 'windowfunction_schema')
BEGIN
    CREATE TABLE windowfunction_schema.Sales (
        id INT IDENTITY(1,1) PRIMARY KEY,
        salesPerson NVARCHAR(50) NOT NULL,
        amount INT NOT NULL CHECK ( amount > 0)
    );
END
GO

-- Verify windowfunction_schema.Sales table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'windowfunction_schema'
AND TABLE_NAME = 'Sales';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'windowfunction_schema'
AND name = 'Sales';
GO

-- Insert sample data into windowfunction_schema.Sales table
INSERT INTO windowfunction_schema.Sales (salesPerson, amount)
VALUES
    ('Alice', 500),
    ('Bob', 700),
    ('Alice', 300),
    ('Bob', 400),
    ('Cara', 600);
GO
-- Verify data was inserted
SELECT *
FROM windowfunction_schema.Sales;
GO
-- OR
SELECT salesPerson, amount
FROM windowfunction_schema.Sales;
GO      



--  Using Window Functions, show the total sales amount for each salesperson
-- without grouping the rows.
SELECT 
    salesPerson,
    amount,
    SUM(amount) OVER (PARTITION BY salesPerson) AS total_sales
FROM windowfunction_schema.Sales;
GO
--  Using Window Functions, show the total sales amount for each salesperson
-- without grouping the rows, ordered by sales amount.
SELECT 
    salesPerson,
    amount,
    SUM(amount) OVER (PARTITION BY salesPerson ORDER BY amount) AS running_total
FROM windowfunction_schema.Sales;
GO
--  Using Window Functions, show the total sales amount for each salesperson
-- without grouping the rows, ordered by sales amount, with a frame of 2 preceding rows.
SELECT 
    salesPerson,
    amount,
    SUM(amount) OVER (PARTITION BY salesPerson ORDER BY amount ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS running_total
FROM windowfunction_schema.Sales;
GO

-- As a list of items, explian what is happening in the above query
-- 1. SELECT statement retrieves salesPerson, amount, and running total
-- 2. SUM(amount) calculates the total sales amount
-- 3. OVER clause defines the window for the calculation
-- 4. PARTITION BY salesPerson divides the data into groups by salesperson
-- 5. ORDER BY amount orders the rows within each partition
-- 6. ROWS BETWEEN 2 PRECEDING AND CURRENT ROW specifies the frame for the calculation
-- 7. The result shows the running total for each salesperson, considering the last 2 rows
-- 8. The running total is updated as the window moves through the rows
-- 9. The result set includes all rows, with the running total calculated for each row
-- 10. The running total reflects the cumulative sales amount for each salesperson
-- 11. The result set is ordered by sales amount within each salesperson's partition
-- 12. The running total is reset for each salesperson due to the PARTITION BY clause
-- 13. The final result set includes salesPerson, amount, and running_total columns
-- 14. The running total is calculated dynamically based on the specified window frame
-- 15. The query demonstrates the power of window functions for advanced analytics
-- 16. The running total can be used for reporting, analysis, and decision-making
-- 17. The query can be modified to include additional calculations or filters as needed
-- 18. The window function allows for complex calculations without altering the original data
-- 19. The query can be optimized for performance by indexing the salesPerson and amount columns
-- 20. The window function can be combined with other SQL features for enhanced functionality
-- 21. The query can be adapted for different use cases, such as financial analysis or sales reporting
-- 22. The window function provides a flexible and powerful tool for data analysis
-- 23. The query can be executed in various SQL environments, including SQL Server, PostgreSQL, and Oracle
-- 24. The window function can be used in conjunction with other SQL functions for advanced calculations
-- 25. The query can be modified to include additional columns or calculations as needed
-- 26. The window function can be used to create complex reports and dashboards
-- 27. The query can be scheduled to run periodically for automated reporting
-- 28. The window function can be used to analyze trends and patterns in the data
-- 29. The query can be modified to include filters or conditions for specific use cases




-- Key Concepts
-- OVER Clause Components

-- PARTITION BY (optional): Divides rows into groups
-- ORDER BY (optional): Determines row order within partition
-- ROWS/RANGE (optional): Defines window frame
-- Common Uses

-- Running totals
-- Moving averages
-- Rankings
-- Row numbering
-- Percentiles
-- Best Practices

-- Use meaningful column aliases
-- Consider performance on large datasets
-- Index columns used in PARTITION BY and ORDER BY
-- Use appropriate window frame for calculations