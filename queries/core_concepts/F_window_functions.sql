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

--  See current schema
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