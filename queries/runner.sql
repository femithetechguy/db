-- RULE OF THUMB
-- Order of Operations

-- Schema must exist before creating tables
-- Table must exist before inserting data
-- Each DDL statement needs its own batch (separated by GO)
-- Common Gotchas

-- Schema names are case-sensitive
-- Make sure you're in the correct database
-- Check for proper permissions
-- Verify schema existence before operations
-- Best Practices

-- Always use schema qualification (group_schema.Sales)
-- Include error handling for production code
-- Verify data after insertions
-- Use meaningful column names in aggregations
-- Debugging Tips If you get schema/table errors:

-- RULE OF THUMB

-- Get List of all databases
-- SELECT name FROM sys.databases;

-- Get List of all databases with their IDs
SELECT name, database_id
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;
GO

-- List all database users and their types
SELECT dp.name AS UserName,
       dp.type_desc AS UserType,
       dp.create_date AS CreatedDate,
       dp.modify_date AS ModifiedDate
FROM sys.database_principals dp
WHERE dp.type IN ('S', 'U', 'G') -- S: SQL user, U: Windows user, G: Windows group
ORDER BY dp.name;
GO
-- List all database roles and their members
SELECT r.name AS RoleName,
       r.type_desc AS RoleType,
       m.name AS MemberName,
       m.type_desc AS MemberType
FROM sys.database_role_members rm
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
WHERE r.type IN ('R', 'S', 'U', 'G') -- R: Database role, S: SQL user, U: Windows user, G: Windows group
ORDER BY r.name, m.name;
GO
-- List all database objects (tables, views, stored procedures, etc.)
SELECT o.name AS ObjectName,
       o.type_desc AS ObjectType,
       s.name AS SchemaName,
       o.create_date AS CreatedDate,
       o.modify_date AS ModifiedDate
FROM sys.objects o
JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE o.type IN ('U', 'V', 'P', 'FN', 'IF', 'TF') -- U: User table, V: View, P: Stored procedure, FN: Scalar function, IF: Inline table-valued function, TF: Table-valued function
ORDER BY s.name, o.name;
GO

-- Create a new database
CREATE DATABASE fttg_db;    
GO
-- identify which database is currently in use
SELECT DB_NAME() AS CurrentDatabase;
GO
-- Switch to the new database
USE fttg_db;
GO

-- List all schemas in the current database
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA;
GO

-- OR 

SELECT name AS SchemaName
FROM sys.schemas;
GO

-- See all tables in the current database
SELECT TABLE_NAME, SCHEMA_NAME() AS SchemaName
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO


-- 
-- Switch to the database
USE fttg_db;
GO

-- View all schemas in current database
SELECT 
    s.name AS SchemaName,
    s.schema_id,
    s.principal_id,
    u.name AS SchemaOwner
FROM sys.schemas s
LEFT JOIN sys.sysusers u ON u.uid = s.principal_id
ORDER BY s.name;
GO

-- View all tables and their schemas
SELECT 
    t.name AS TableName,
    s.name AS SchemaName,
    t.create_date,
    t.modify_date
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY s.name, t.name;
GO

-- View complete database object list
SELECT 
    o.name AS ObjectName,
    s.name AS SchemaName,
    o.type_desc AS ObjectType,
    o.create_date,
    o.modify_date
FROM sys.objects o
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE o.type IN ('U', 'V', 'P', 'TR', 'FN')  -- Tables, Views, Stored Procedures, Triggers, Functions
ORDER BY o.type_desc, s.name, o.name;
GO

-- 

-- First verify the table exists and check its current schema
SELECT 
    s.name AS SchemaName,
    t.name AS TableName
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.name = 'Students';
GO

-- Move the table to select_schema
ALTER SCHEMA select_schema TRANSFER dbo.Students;
GO

-- Verify the move
SELECT 
    s.name AS SchemaName,
    t.name AS TableName
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.name = 'Students';
GO

SELECT * FROM
select_schema.Students;
GO