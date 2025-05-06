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
AND TABLE_SCHEMA = 'subquery_schema';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'subquery_schema';
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

-- Verify subquery_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'subquery_schema';
GO 

-- Create subquery_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'subquery_schema')
    EXEC('CREATE SCHEMA subquery_schema')
GO

-- Double Verify subquery_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'subquery_schema';
GO 

-- New Changes Begin Here

-- Create subquery_schema.Employees table if not exists
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'Employees' AND schema_id = SCHEMA_ID('subquery_schema'))
BEGIN
    CREATE TABLE subquery_schema.Employees (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(50) NOT NULL,
        salary INT NOT NULL CHECK (salary > 0)
    );
END
GO

-- Verify subquery_schema.Employees table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'subquery_schema'
AND TABLE_NAME = 'Employees';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'subquery_schema'
AND name = 'Employees';
GO

-- Verify subquery_schema.Employees was created
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'subquery_schema';
GO


-- Insert employee data (no need to specify id due to IDENTITY AUTO INCREMENT)
INSERT INTO subquery_schema.Employees (name, salary)
VALUES 
    ('Alice', 50000),
    ('Bob', 70000),
    ('Cara', 55000),
    ('Dan', 48000);
GO

-- Verify the insertion
SELECT * FROM subquery_schema.Employees ORDER BY id;
GO

-- Using subqueries , find employees who earn more than the average salary
SELECT name, salary
FROM subquery_schema.Employees
WHERE salary > (SELECT AVG(salary) FROM subquery_schema.Employees);
GO

-- Using subqueries , find employees who earn more less the average salary
SELECT name, salary
FROM subquery_schema.Employees
WHERE salary < (SELECT AVG(salary) FROM subquery_schema.Employees);
GO

-- Note
-- Let's break down the highlighted query:

-- Query Breakdown
-- Inner Query (Subquery)

-- Calculates the average salary across all employees
-- Returns a single value (scalar subquery)
-- Executed first
-- Outer Query

-- Selects employees whose salary is above the calculated average
-- Uses the subquery result in its WHERE clause
-- Returns name and salary columns

-- Example Execution Flow:
-- Calculate average salary: (50000 + 70000 + 55000 + 48000) / 4 = 55750
-- Compare each employee's salary to 55750
-- Return rows where salary > 55750

-- Expected Results:
-- Bob (70000) will be returned as they earn above average
-- Other employees earn below average and won't appear in results
-- This is an example of a non-correlated subquery because the inner query operates independently of the outer query.
-- THere are also scalar subqueries, which return a single value, and correlated subqueries, which depend on the outer query.
-- THere are also derived tables, which are subqueries in the FROM clause that can be used to create temporary tables for further processing.
--THere are  nested and multi-level subqueries, which are subqueries within other subqueries, allowing for complex data retrieval.
-- ### Key Concepts
-- 1. **Location Usage**
--    - In WHERE clause (filtering)
--    - In SELECT clause (derived values)
--    - In FROM clause (derived tables)
--    - In HAVING clause (group filtering)

-- 2. **Best Practices**
--    - Use meaningful aliases
--    - Indent for readability
--    - Consider performance
--    - Test with representative data
--    - Consider alternatives (JOINs, CTEs)

-- 3. **Common Gotchas**
--    - Subqueries in SELECT must return single value
--    - Correlated subqueries can be slow
--    - Multiple levels can be hard to maintain
--    - Consider indexing for performance
