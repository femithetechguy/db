# Common SQL Server Queries Reference Guide

## 1. Database Information

### System Information
````sql
-- Get SQL Server version and instance info
SELECT @@VERSION AS SQLServerVersion,
       SERVERPROPERTY('Edition') AS Edition,
       @@SERVERNAME AS ServerName;
GO

-- List all databases
SELECT name, database_id, create_date
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;
GO
````

## 2. Schema & Object Management

### Schema Information
````sql
-- List all schemas in current database
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA;
GO

-- List tables by schema
SELECT TABLE_SCHEMA, 
       TABLE_NAME,
       TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;
GO
````

## 3. Data Manipulation

### Basic CRUD Operations
````sql
-- INSERT with OUTPUT
INSERT INTO schema_name.table_name (column1, column2)
OUTPUT INSERTED.*
VALUES ('value1', 'value2');
GO

-- UPDATE with OUTPUT
UPDATE schema_name.table_name
SET column1 = new_value
OUTPUT INSERTED.*, DELETED.*
WHERE condition;
GO

-- DELETE with OUTPUT
DELETE FROM schema_name.table_name
OUTPUT DELETED.*
WHERE condition;
GO
````

## 4. Performance Queries

### Index Information
````sql
-- Find missing indexes
SELECT 
    dm_mid.database_id,
    dm_migs.avg_user_impact,
    dm_migs.last_user_seek
FROM sys.dm_db_missing_index_details dm_mid
INNER JOIN sys.dm_db_missing_index_groups dm_mig
ON dm_mid.index_handle = dm_mig.index_handle;
GO

-- Find unused indexes
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    ius.user_seeks,
    ius.user_scans
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats ius
ON i.object_id = ius.object_id;
GO
````

## 5. Security Management

### User and Role Information
````sql
-- List users and their roles
SELECT 
    dp.name AS UserName,
    USER_NAME(drm.role_principal_id) AS RoleName
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm
ON dp.principal_id = drm.member_principal_id
WHERE dp.type IN ('S', 'U');
GO
````

## 6. Maintenance Queries

### Table Space Usage
````sql
-- Get table sizes
SELECT 
    t.name AS TableName,
    s.name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.object_id = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.object_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.name, s.name, p.rows
ORDER BY TotalSpaceKB DESC;
GO
````

To execute these queries in VS Code's integrated terminal:
```bash
sqlcmd -S localhost -U sa -P <YourPassword> -d <DatabaseName> -i "query_file.sql"
