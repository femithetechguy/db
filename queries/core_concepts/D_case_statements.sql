-- Switch to the new database
USE fttg_db;
GO


-- Check current user and their default schema:
SELECT 
    USER_NAME() AS CurrentUser,
    SCHEMA_NAME() AS DefaultSchema,
    DB_NAME() AS CurrentDatabase;
GO

-- identify which database is currently in use
SELECT DB_NAME() AS CurrentDatabase;
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

--  See all tables in current schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'case_schema';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'case_schema';
GO

-- See all tables in the current database with associated schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- BEGIN OTHER QUERIES HERE

-- Verify case_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'case_schema';
GO 

-- Create case_schemas if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'case_schema')
    EXEC('CREATE SCHEMA case_schema')
GO

-- Double Verify case_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'case_schema';
GO 

-- New Changes Begin Here

-- Create case_schema.Sales table if not exists
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'Orders' AND schema_id = SCHEMA_ID('case_schema'))
BEGIN
    CREATE TABLE case_schema.Orders (
        order_id INT IDENTITY(1,1) PRIMARY KEY,
        amount INT NOT NULL CHECK (amount > 0)
    );
END
GO
-- Verify case_schema.Sales table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'case_schema'
AND TABLE_NAME = 'Orders';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'case_schema'
AND name = 'Orders';
GO

-- Verify case_schema.Sales was created
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'case_schema';
GO


-- Insert sales records
-- Insert order data
INSERT INTO case_schema.Orders (amount)
VALUES 
    (150),
    (50),
    (300),
    (90);
GO

-- Verify the insertion
SELECT * 
FROM case_schema.Orders 
ORDER BY order_id;
GO

-- Remove last 4 rows
DELETE FROM case_schema.Orders
WHERE order_id IN (5, 6, 7, 8);
GO
-- Verify the deletion
SELECT *
FROM case_schema.Orders
ORDER BY order_id;
GO

-- Using case statements, label each order as 'High', 'Medium', or 'Low' based on amount
-- if amount > 200, then 'High'
-- if amount >= 100 OR amount <=200 then 'Medium' (BETWEEN 100 AND 200)
-- if amount neither of above 2 cases, then label as 'Low'
SELECT order_id, amount,
    CASE 
        WHEN amount > 200 THEN 'High'
        WHEN amount BETWEEN 100 AND 200 THEN 'Medium'
        ELSE 'Low'
    END AS OrderCategory
FROM case_schema.Orders;
GO

-- OR

SELECT order_id, amount,
    CASE 
        WHEN amount > 200 THEN 'High'
        WHEN amount >= 100 AND amount <=200 THEN 'Medium'
        ELSE 'Low'
    END AS OrderCategory
FROM case_schema.Orders;
GO


-- Key Points:
-- Two CASE Formats:

-- Simple CASE: Compares expression for exact matches
-- Searched CASE: Uses Boolean conditions
-- Rules:

-- Must end with END
-- ELSE is optional (returns NULL if omitted)
-- Can be used in SELECT, WHERE, HAVING, ORDER BY
-- Best Practices:

-- Include ELSE clause to handle unexpected values
-- Keep conditions mutually exclusive
-- Use meaningful category names
-- Consider data types in results
-- Common Uses:

-- Data categorization
-- Custom sorting
-- Conditional aggregation
-- Data transformation