-- =================================================================
-- SQL Server Command Reference Guide
-- Description: Essential queries and commands for SQL Server management
-- =================================================================

-- SECTION 1: User Information
-- --------------------------
-- Query to check current user
SELECT SUSER_NAME(); 

-- Alternative user check query
SELECT SYSTEM_USER;

-- SECTION 2: Database Management
-- ----------------------------
-- Query to list all databases
SELECT name FROM sys.databases;

-- Database context switching
USE YourDatabaseName;
GO

-- SECTION 3: Schema Information
-- ---------------------------
-- Query to list all tables in current database
SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

-- Query to list column information for a specific table
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'YourTableName';

-- SECTION 4: Data Preview
-- ----------------------
-- Query to preview table data
SELECT TOP 10 * FROM YourTableName;

-- SECTION 5: System Information
-- ---------------------------
-- Query to check SQL Server version
SELECT @@VERSION;

-- SECTION 6: Security
-- ------------------
-- Query to list database users
SELECT name, type_desc 
FROM sys.database_principals 
WHERE type IN ('S', 'U');

-- Query to check current user permissions
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');

-- SECTION 7: Common Commands Reference
-- ---------------------------------
-- NOTE: Quick reference for common tasks
-- Current user check:
SELECT SYSTEM_USER;

-- Database listing:
SELECT name FROM sys.databases;

-- Change database context:
USE dbName;
GO

-- List all tables:
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Get column information:
SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Table';

-- Preview data:
SELECT TOP 10 * FROM Table;

-- Version check:
SELECT @@VERSION;

-- SECTION 8: Command Line Usage
-- ---------------------------
-- NOTE: Basic sqlcmd connection syntax
-- Windows Authentication:
-- sqlcmd -S localhost

-- SQL Authentication:
-- sqlcmd -S localhost -U youruser -P yourpassword

-- Example database exploration:
USE AdventureWorks;
GO

SELECT name FROM sys.tables;
GO

-- =================================================================
-- End of SQL Server Command Reference Guide
-- =================================================================