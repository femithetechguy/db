-- Switch to the new database
USE fttg_db;
GO

-- identify which database is currently in use
SELECT DB_NAME() AS CurrentDatabase;
GO

-- List all schemas in the current database
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA;
GO

-- OR 

SELECT name AS SchemaName
FROM sys.schemas;
GO

--  See current schema
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

--  See all tables in current schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'join_schema';
GO
-- OR
SELECT name AS TableName
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) = 'join_schema';
GO

-- See all tables in the current database with associated schema
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- BEGIN OTHER QUERIES HERE
-- Create schemas with proper batch separation
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'select_schema')
    EXEC('CREATE SCHEMA select_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'join_schema')
    EXEC('CREATE SCHEMA join_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'group_schema')
    EXEC('CREATE SCHEMA group_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'case_schema')
    EXEC('CREATE SCHEMA case_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'subquery_schema')
    EXEC('CREATE SCHEMA subquery_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'windowfunction_schema')
    EXEC('CREATE SCHEMA windowfunction_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'storedproc_schema')
    EXEC('CREATE SCHEMA storedproc_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'view_schema')
    EXEC('CREATE SCHEMA view_schema')
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'trigger_schema')
    EXEC('CREATE SCHEMA trigger_schema')
GO

-- Confirm the schema creation
SELECT SCHEMA_NAME AS SchemaName
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME IN ('select_schema', 'join_schema', 'group_schema', 'case_schema', 'subquery_schema', 'windowfunction_schema', 'storedproc_schema', 'view_schema', 'trigger_schema');
GO


-- Create Student table in the join_schema
CREATE TABLE join_schema.Students (
    student_id INT,
    name NVARCHAR(50)
);
GO
-- Create Score table in the join_schema
CREATE TABLE join_schema.Scores (
    student_id INT,
    score INT,
);
GO

-- Verify join_schema.Students & join_schema.Scores were created
SELECT TABLE_NAME, TABLE_SCHEMA
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'join_schema';
GO

-- Insert student data
INSERT INTO join_schema.Students (student_id, name)
VALUES 
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Cara'),
    (4, 'Dan');
GO

-- Verify the insertion
SELECT * FROM join_schema.Students ORDER BY student_id;
GO

-- Insert scores data
INSERT INTO join_schema.Scores (student_id, score)
VALUES 
    (1, 85),
    (2, 90),
    (4, 75),
    (5, 88);
GO

-- Verify the insertion
SELECT * FROM join_schema.Scores ORDER BY student_id;
GO

-- LEFT JOIN
-- Show All rows from Students and matching rows from Scores(if any)

SELECT s.student_id, s.name, sc.score
FROM join_schema.Students s
LEFT JOIN join_schema.Scores sc ON s.student_id = sc.student_id
ORDER BY s.student_id;
GO

-- RIGHT JOIN
-- Show All rows from Scores and matching rows from Students(if any)

SELECT s.student_id, s.name, sc.score
FROM join_schema.Students s
RIGHT JOIN join_schema.Scores sc ON s.student_id = sc.student_id
ORDER BY s.student_id;
GO

-- INNER JOIN
-- Show ONLY rows with matching IDs in both tables

SELECT s.student_id, s.name, sc.score
FROM join_schema.Students s
INNER JOIN join_schema.Scores sc ON s.student_id = sc.student_id
ORDER BY s.student_id;
GO



