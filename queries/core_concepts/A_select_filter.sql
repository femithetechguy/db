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

-- Create a new table   
CREATE TABLE Students (
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
INSERT INTO Students (name, age, grade)
VALUES 
    ('Alice', 20, '88'),
    ('Bob', 22, '76'),
    ('Cara', 19, '92'),
    ('Dan', 21, '67');
GO

-- Verify the insertion was scuccessful
SELECT * FROM Students ORDER BY id;
GO

-- Selection and filtering task
-- Select name, and grade of all students with age greater than 20
SELECT name, grade
FROM Students
WHERE age > 20;
GO

-- Note
-- SELECT determines which columns to show
-- WHERE filters rows based on conditions
-- Use logical operators (AND, OR, NOT) for complex filters
-- LIKE for pattern matching
-- BETWEEN for range queries


