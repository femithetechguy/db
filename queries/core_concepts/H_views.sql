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
AND TABLE_SCHEMA = 'view_schema';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'view_schema';
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

-- Verify view_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'view_schema';
GO 

-- Create view_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'view_schema')
    EXEC('CREATE SCHEMA view_schema')
GO

-- Double Verify view_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'view_schema';
GO 


-- New Changes Begin Here
-- Create Employees table
CREATE TABLE view_schema.Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT
);

-- Create Departments table
CREATE TABLE view_schema.Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(50)
);
GO

-- Verify Departments table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Departments'
AND TABLE_SCHEMA = 'view_schema';
GO
-- Verify Employees table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Employees'
AND TABLE_SCHEMA = 'view_schema';
GO
-- Insert sample data into Employees table
INSERT INTO view_schema.Employees (FirstName, LastName, Salary, DepartmentID)
VALUES 
('John', 'Doe', 60000, 1),
('Jane', 'Smith', 70000, 2),
('Alice', 'Johnson', 80000, 1),
('Bob', 'Brown', 50000, 3);
GO
-- Insert sample data into Departments table
INSERT INTO view_schema.Departments (DepartmentName)
VALUES 
('HR'),
('IT'),
('Finance'),
('Marketing');
GO
-- Verify data was inserted into Employees table
SELECT *
FROM view_schema.Employees;
GO
-- Verify data was inserted into Departments table
SELECT *
FROM view_schema.Departments;
GO

-- Create simple view
CREATE OR ALTER VIEW view_schema.EmployeeBasicInfo
AS
SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS FullName
FROM view_schema.Employees;
GO


-- Create view with join
CREATE OR ALTER VIEW view_schema.EmployeeDetails
AS
SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS FullName,
    e.Salary,
    d.DepartmentName
FROM view_schema.Employees e
JOIN view_schema.Departments d ON e.DepartmentID = d.DepartmentID;
GO

-- Create view with aggregation
CREATE OR ALTER VIEW view_schema.DepartmentSummary
AS
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount,
    AVG(e.Salary) AS AverageSalary
FROM view_schema.Departments d
LEFT JOIN view_schema.Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;
GO  

-- Use created views
-- Query views
SELECT * FROM view_schema.EmployeeBasicInfo;
SELECT * FROM view_schema.EmployeeDetails;
SELECT * FROM view_schema.DepartmentSummary;
GO

-- Key Benefits

-- Data abstraction
-- Security control
-- Query simplification
-- Consistent data representation
-- 
-- Simplification

-- Hide complex queries
-- Abstract database complexity
-- Provide consistent data representation

-- Security

-- Row-level security
-- Column-level security
-- Data access control

-- Data Independence

-- Change underlying tables without affecting applications
-- Maintain backward compatibility
-- Simplify database refactoring

-- Best Practices

-- Naming and Structure

-- Use meaningful names
-- Include schema prefix
-- Document purpose and dependencies
-- Keep views focused and simple

-- Performance

-- Use indexes on underlying tables
-- Avoid excessive joins
-- Consider indexed views for frequent queries
-- Be cautious with complex calculations

-- Maintenance

-- Regular review and updates
-- Monitor dependencies
-- Version control views
-- Test view modifications