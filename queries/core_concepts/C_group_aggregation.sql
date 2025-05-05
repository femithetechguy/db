-- Switch to the new database
USE fttg_db;
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

--  See all tables in current schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'group_schema';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'group_schema';
GO

-- See all tables in the current database with associated schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- BEGIN OTHER QUERIES HERE

-- Verify group_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'group_schema';
GO 

-- Create group_schemas if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'group_schema')
    EXEC('CREATE SCHEMA group_schema')
GO

-- Double Verify group_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'group_schema';
GO 

-- Create group_schema.Sales table if not exists
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'Sales' AND schema_id = SCHEMA_ID('group_schema'))
BEGIN
    CREATE TABLE group_schema.Sales (
        id INT IDENTITY(1,1) PRIMARY KEY,
        salesperson NVARCHAR(50) NOT NULL,
        amount INT NOT NULL CHECK (amount > 0)
    );
END
GO
-- Verify group_schema.Sales table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'group_schema'
AND TABLE_NAME = 'Sales';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'group_schema'
AND name = 'Sales';
GO

-- Verify group_schema.Sales was created
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'group_schema';
GO


-- Insert sales records
INSERT INTO group_schema.Sales (salesperson, amount)
VALUES 
    ('Alice', 500),
    ('Bob', 700),
    ('Alice', 300),
    ('Bob', 400),
    ('Cara', 600);
GO

-- Verify the insertion
SELECT * FROM group_schema.Sales ORDER BY id;
GO

-- Using group and aggregation, find total sales by each salesperson
SELECT salesperson, SUM(amount) AS TotalSales
FROM group_schema.Sales
GROUP BY salesperson
ORDER BY TotalSales DESC;
GO
-- Using group and aggregation, find total sales by each salesperson with HAVING clause

-- Key Points:
-- Aggregation Functions:

-- SUM(): Total sales amount
-- COUNT(): Number of transactions
-- AVG(): Average sale amount
-- MIN()/MAX(): Range of sales
-- GROUP BY:

-- Groups rows with same values
-- Must include all non-aggregated columns
-- Creates summary rows
-- HAVING vs WHERE:

-- WHERE filters before grouping
-- HAVING filters after grouping
-- HAVING works with aggregated values
-- Order of Operations:

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY