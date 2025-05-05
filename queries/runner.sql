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
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO
