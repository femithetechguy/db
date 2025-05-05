-- INTRODUCTION
-- SQL Server Command Line Utility (sqlcmd) Guide
-- This guide covers essential commands for database management via terminal

-- =================================================================
-- SECTION 1: Basic Connection Commands
-- =================================================================

-- Default instance with Windows Authentication
sqlcmd -S <ServerName>

-- Example for local connection
sqlcmd -S localhost

-- Named instance connection syntax
sqlcmd -S <ServerName>\<InstanceName>

-- Example for named instance
sqlcmd -S localhost\SQLEXPRESS

-- SQL Server Authentication syntax
sqlcmd -S <ServerName> -U <Username> -P <Password>

-- Example with SQL Authentication
sqlcmd -S localhost -U sa -P your_password

-- =================================================================
-- SECTION 2: Query Execution Commands
-- =================================================================

-- Execute single query and exit (-Q flag)
sqlcmd -S <ServerName> -Q "SELECT GETDATE();"

-- Example of immediate query execution
sqlcmd -S localhost -Q "SELECT GETDATE();"

-- Execute query and remain in sqlcmd (-q flag)
sqlcmd -S <ServerName> -q "SELECT GETDATE();"

-- Example of persistent query execution
sqlcmd -S localhost -q "SELECT GETDATE();"

-- =================================================================
-- SECTION 3: Database Specific Commands
-- =================================================================

-- Connect to specific database syntax
sqlcmd -S <ServerName> -d <DatabaseName>

-- Example database connection
sqlcmd -S localhost -d AdventureWorks

-- =================================================================
-- SECTION 4: Interactive Mode Commands
-- =================================================================

-- Start interactive session
sqlcmd -S <ServerName>

-- Example interactive session
sqlcmd -S localhost

-- Interactive query example
-- Note: Must type GO on new line to execute
SELECT name FROM sys.databases;
GO

-- =================================================================
-- SECTION 5: Script Execution Commands
-- =================================================================

-- Execute SQL script from file
sqlcmd -S <ServerName> -i <InputFile.sql>

-- Example script execution
sqlcmd -S localhost -i C:\Scripts\CreateTables.sql

-- Script execution with output to file
sqlcmd -S <ServerName> -i <InputFile.sql> -o <OutputFile.txt>

-- Example with output redirection
sqlcmd -S localhost -i C:\Scripts\CreateTables.sql -o C:\Scripts\Output.txt

-- =================================================================
-- SECTION 6: Database Creation Commands
-- =================================================================

-- Interactive database creation example
-- Note: Execute these commands in sequence
CREATE DATABASE TestDB;
GO

-- Single-line database creation
sqlcmd -S <ServerName> -Q "CREATE DATABASE TestDB;"

-- Example of quick database creation
sqlcmd -S localhost -Q "CREATE DATABASE TestDB;"

-- =================================================================
-- SECTION 7: Database Listing Commands
-- =================================================================

-- List all databases command
sqlcmd -S <ServerName> -Q "SELECT name FROM sys.databases;"

-- Example of database listing
sqlcmd -S localhost -Q "SELECT name FROM sys.databases;"

-- =================================================================
-- SECTION 8: Session Management
-- =================================================================

-- To exit interactive session, type:
EXIT

-- =================================================================
-- ADDITIONAL TIPS
-- =================================================================

-- IMPORTANT COMMANDS:
-- GO - Executes the current batch
-- :RESET - Clears the input buffer
-- :ED - Opens default editor
-- -? - Shows help information

-- For more information, visit the official Microsoft documentation
-- for sqlcmd utility and SQL Server command-line tools.