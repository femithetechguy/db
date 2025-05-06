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
AND TABLE_SCHEMA = 'storedproc_schema';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'storedproc_schema';
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

-- Verify storedproc_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'storedproc_schema';
GO 

-- Create storedproc_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'storedproc_schema')
    EXEC('CREATE SCHEMA storedproc_schema')
GO

-- Double Verify storedproc_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'storedproc_schema';
GO 

-- New Changes Begin Here
-- Create required tables first
CREATE TABLE storedproc_schema.Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE storedproc_schema.Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES storedproc_schema.Departments(DepartmentID)
);
GO

-- Insert sample data into Departments table
INSERT INTO storedproc_schema.Departments (DepartmentName)
VALUES 
('HR'),
('IT'),
('Finance'),
('Marketing');
GO
-- Insert sample data into Employees table
INSERT INTO storedproc_schema.Employees (FirstName, LastName, Salary, DepartmentID)
VALUES 
('John', 'Doe', 60000, 1),
('Jane', 'Smith', 75000, 2),
('Emily', 'Jones', 50000, 3),
('Michael', 'Brown', 80000, 2),
('Sarah', 'Davis', 55000, 1);
GO
-- Verify storedproc_schema.Departments table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'             
AND TABLE_SCHEMA = 'storedproc_schema'
AND TABLE_NAME = 'Departments';
GO

-- Verify storedproc_schema.Employees table exists
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'             
AND TABLE_SCHEMA = 'storedproc_schema'
AND TABLE_NAME = 'Employees';
GO

-- See all tables in specified schema
SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'storedproc_schema';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'storedproc_schema';
GO


-- Create a basic stored procedure
CREATE OR ALTER PROCEDURE storedproc_schema.GetEmployeesByDepartment
    @DepartmentName NVARCHAR(50),
    @MinSalary DECIMAL(10,2) = 0  -- Optional parameter with default
AS
BEGIN
    SET NOCOUNT ON;  -- Suppress row count messages
    
    BEGIN TRY
        -- Input validation
        IF @DepartmentName IS NULL
            THROW 50001, 'Department name cannot be null', 1;

        -- Main query
        SELECT 
            e.EmployeeID,
            e.FirstName,
            e.LastName,
            e.Salary
        FROM storedproc_schema.Employees e
        INNER JOIN storedproc_schema.Departments d 
            ON e.DepartmentID = d.DepartmentID
        WHERE 
            d.DepartmentName = @DepartmentName
            AND e.Salary >= @MinSalary
        ORDER BY 
            e.Salary DESC;

    END TRY
    BEGIN CATCH
        -- Error handling
        THROW;
    END CATCH
END;
GO
-- 


-- Key Features Demonstrated:
-- Schema usage
-- Parameter declaration with defaults
-- Error handling with TRY-CATCH
-- Input validation
-- SET NOCOUNT ON
-- Proper naming conventions
-- 

-- SELECT * FROM storedproc_schema.Departments;


-- Execute the stored procedure correctly
EXEC storedproc_schema.GetEmployeesByDepartment 
    @DepartmentName = 'IT',    -- Specify the department name
    @MinSalary = 50000;        -- Specify minimum salary (optional)
GO

-- Or execute with just department name (using default MinSalary)
EXEC storedproc_schema.GetEmployeesByDepartment @DepartmentName = 'Finance';
GO

-- 

-- Use EXEC or EXECUTE to run stored procedures
-- Parameter names must be prefixed with @
-- Parameter values must match the expected data types
-- Optional parameters can be omitted (will use default values)
-- Parameters can be specified by position, but naming them is clearer

-- Key Benefits

-- Performance

-- Cached execution plans
-- Reduced network traffic
-- Batch operations

-- Security

-- Granular access control
-- Encapsulated logic
-- Reduced direct table access

-- Maintainability

-- Centralized business logic
-- Easier updates
-- Consistent implementation

-- Best Practices

-- Use schema prefix
-- Include error handling
-- Use meaningful names
-- Document parameters
-- Set NOCOUNT ON
-- Use parameters instead of dynamic SQL

-- Common Use Cases

-- Data validation
-- Complex calculations
-- Batch processing
-- API endpoints
-- Data transformations