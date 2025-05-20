-- Create a new database
CREATE DATABASE fttg_db;    
GO
-- identify which database is currently in use
SELECT DB_NAME() AS CurrentDatabase;
GO
-- Switch to the new database
USE fttg_db;
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

-- See all tables in the current database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- Create schemas with proper batch separation for select and filtering called select_schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'select_schema')
    EXEC('CREATE SCHEMA select_schema')
GO

-- remove Student from dbo schema if it exists
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Students' AND SCHEMA_NAME(schema_id) = 'dbo')
    DROP TABLE dbo.Students;
GO

-- confirm student is removed from dbo schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_NAME = 'Students';
GO

-- Confirm the schema creation
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME IN ('select_schema');
GO


-- Create a new table   
CREATE TABLE select_schema.Students (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    age INT,
    grade VARCHAR(10)
);
GO

-- Confirm the table creation
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_NAME = 'Students';
GO

-- Insert data into the table
INSERT INTO select_schema.Students (name, age, grade)
VALUES 
    ('Alice', 20, '88'),
    ('Bob', 22, '76'),
    ('Cara', 19, '92'),
    ('Dan', 21, '67');
GO

-- Verify the insertion was scuccessful
SELECT * FROM select_schema.Students ORDER BY id;
GO

-- Selection and filtering task
-- Select name, and grade of all students with age greater than 20
SELECT name, grade
FROM select_schema.Students
WHERE age > 20;
GO

-- Note
-- SELECT determines which columns to show
-- WHERE filters rows based on conditions
-- Use logical operators (AND, OR, NOT) for complex filters
-- LIKE for pattern matching
-- BETWEEN for range queries


