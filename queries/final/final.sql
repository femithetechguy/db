-- Select the desired database
USE fttg_db;
GO

-- Confirm current database, user and schemas
SELECT
    USER_NAME() AS CurrentUser,
    SCHEMA_NAME() AS CurrentSchema,
    DB_NAME() AS CurrentDb;
GO

-- List all tables schemas, tables and db names
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_CATALOG
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA;
GO

-- List all views schemas, tables and db names
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_CATALOG
FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_SCHEMA;
GO

-- List all stored procedures schemas, tables and db names
SELECT
    ROUTINE_SCHEMA,
    ROUTINE_NAME,
    ROUTINE_CATALOG
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
ORDER BY ROUTINE_SCHEMA;
GO

-- List all functions schemas, tables and db names
SELECT
    ROUTINE_SCHEMA,
    ROUTINE_NAME,
    ROUTINE_CATALOG
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'FUNCTION'
ORDER BY ROUTINE_SCHEMA;
GO 
-- List all triggers schemas, tables and db names
SELECT
    name AS TriggerName,
    parent_class_desc AS ParentObjectType,
    parent_id AS ParentObjectId,
    is_disabled AS IsDisabled
FROM sys.triggers;
GO
