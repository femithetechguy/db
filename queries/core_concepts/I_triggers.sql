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
AND TABLE_SCHEMA = 'trigger_schema';
GO

-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'trigger_schema';
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

-- Verify trigger_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'trigger_schema';
GO 

-- Create trigger_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'trigger_schema')
    EXEC('CREATE SCHEMA trigger_schema')
GO

-- Double Verify trigger_schema exists
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'trigger_schema';
GO 


-- New Changes Begin Here
-- Create trigger_schema if not exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'trigger_schema')
    EXEC('CREATE SCHEMA trigger_schema')
GO

-- Create Orders table
CREATE TABLE trigger_schema.Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(50),
    Quantity INT,
    OrderDate DATETIME DEFAULT GETDATE()
);

-- Create OrderHistory table for audit
CREATE TABLE trigger_schema.OrderHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductName NVARCHAR(50),
    Quantity INT,
    Action NVARCHAR(10),
    ModifiedDate DATETIME DEFAULT GETDATE()
);
GO

-- Confirm the tables were created
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'trigger_schema';
GO  


-- 
-- AFTER (FOR) Trigger
CREATE OR ALTER TRIGGER trigger_schema.trg_OrdersAudit
ON trigger_schema.Orders
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Handle INSERT
    INSERT INTO trigger_schema.OrderHistory (OrderID, ProductName, Quantity, Action)
    SELECT 
        i.OrderID,
        i.ProductName,
        i.Quantity,
        'INSERT'
    FROM inserted i
    WHERE NOT EXISTS (SELECT 1 FROM deleted);

    -- Handle UPDATE
    INSERT INTO trigger_schema.OrderHistory (OrderID, ProductName, Quantity, Action)
    SELECT 
        i.OrderID,
        i.ProductName,
        i.Quantity,
        'UPDATE'
    FROM inserted i
    INNER JOIN deleted d ON i.OrderID = d.OrderID;

    -- Handle DELETE
    INSERT INTO trigger_schema.OrderHistory (OrderID, ProductName, Quantity, Action)
    SELECT 
        d.OrderID,
        d.ProductName,
        d.Quantity,
        'DELETE'
    FROM deleted d
    WHERE NOT EXISTS (SELECT 1 FROM inserted);
END;
GO

-- INSTEAD OF Trigger
CREATE OR ALTER TRIGGER trigger_schema.trg_PreventDelete
ON trigger_schema.Orders
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR ('Deleting orders is not allowed. Use status update instead.', 16, 1);
    RETURN;
END;
GO

-- COnfirm the triggers were created
SELECT name AS TriggerName
FROM sys.triggers
WHERE parent_id = OBJECT_ID('trigger_schema.Orders');
GO


-- Test created triggers
-- Insert test data
INSERT INTO trigger_schema.Orders (ProductName, Quantity)
VALUES ('Laptop', 5);
GO

-- Update test
UPDATE trigger_schema.Orders 
SET Quantity = 10 
WHERE ProductName = 'Laptop';
GO

-- Try delete (will be prevented)
DELETE FROM trigger_schema.Orders 
WHERE ProductName = 'Laptop';
GO

-- View audit trail
SELECT * FROM trigger_schema.OrderHistory
ORDER BY ModifiedDate DESC;
GO

-- ### Types of Triggers

-- 1. **DML Triggers**
--    - AFTER triggers (fired after the event)
--    - INSTEAD OF triggers (replace the event)
--    - Events: INSERT, UPDATE, DELETE

-- 2. **DDL Triggers**
--    - Database level
--    - Server level
--    - Events: CREATE, ALTER, DROP

-- ### Best Practices

-- 1. **Performance**
--    - Keep triggers lightweight
--    - Avoid recursion
--    - Use SET NOCOUNT ON
--    - Minimize transactions

-- 2. **Error Handling**
--    - Include TRY-CATCH blocks
--    - Log errors appropriately
--    - Handle rollbacks carefully

-- 3. **Maintainability**
--    - Document purpose clearly
--    - Use meaningful names
--    - Keep logic simple
--    - Test thoroughly

-- ### Common Use Cases
-- - Audit logging
-- - Data validation
-- - Business rules enforcement
-- - Maintaining data integrity
-- - Automatic updates

-- To execute in VS Code's integrated terminal:
-- ```bash
-- sqlcmd -S localhost -U sa -P YourPassword -d fttg_db -i "/Users/fttg/fttg_workspace/db/queries/core_concepts/I_triggers.sql"
-- ```