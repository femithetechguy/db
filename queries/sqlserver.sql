-- ====================================================
-- SQL Server Query Reference Guide
-- Description: Essential queries for data manipulation
-- ====================================================

-- Section: Data Retrieval and Filtering
-- 1. Select All Records from a Table
SELECT * FROM Employees;

-- 2. Select Specific Columns
SELECT FirstName, LastName FROM Employees;

-- 3. Filter Records with WHERE Clause
SELECT * FROM Employees WHERE Department = 'Sales';

-- 4. Sort Records with ORDER BY
SELECT * FROM Employees ORDER BY LastName ASC;

-- 5. Retrieve Unique Records with DISTINCT
SELECT DISTINCT Department FROM Employees;

-- 6. Pattern Matching with LIKE
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

-- 7. Range Filtering with BETWEEN
SELECT * FROM Employees WHERE HireDate BETWEEN '2020-01-01' AND '2021-01-01';

-- 8. Set Filtering with IN
SELECT * FROM Employees WHERE Department IN ('Sales', 'Marketing');

-- ====================================================
-- Section: Aggregate Functions and Grouping
-- ====================================================

-- 9. Count Records
SELECT COUNT(*) FROM Employees;

-- 10. Calculate Average Salary
SELECT AVG(Salary) FROM Employees;

-- 11. Find Maximum and Minimum Salary
SELECT MAX(Salary), MIN(Salary) FROM Employees;

-- 12. Group Records with GROUP BY
SELECT Department, COUNT(*) FROM Employees GROUP BY Department;

-- 13. Filter Groups with HAVING
SELECT Department, COUNT(*) FROM Employees 
GROUP BY Department 
HAVING COUNT(*) > 10;

-- ====================================================
-- Section: Joining Tables
-- ====================================================

-- 14. Inner Join
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 15. Left Join
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 16. Right Join
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 17. Full Outer Join
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
FULL OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- ====================================================
-- Section: Data Modification
-- ====================================================

-- 18. Insert New Record
INSERT INTO Employees (FirstName, LastName, DepartmentID)
VALUES ('Jane', 'Doe', 3);

-- 19. Update Existing Records
UPDATE Employees SET Salary = Salary * 1.1 WHERE Department = 'Sales';

-- 20. Delete Records
DELETE FROM Employees WHERE Resigned = 1;

-- ====================================================
-- Section: Database and Table Management
-- ====================================================

-- 21. Create New Database
CREATE DATABASE CompanyDB;

-- 22. Create New Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 23. Alter Table to Add Column
ALTER TABLE Employees ADD Email VARCHAR(100);

-- 24. Drop Table
DROP TABLE OldEmployees;

-- 25. Create Index
CREATE INDEX idx_lastname ON Employees (LastName);

-- ====================================================
-- Section: Advanced Queries
-- ====================================================

-- 26. Subquery in WHERE Clause
SELECT FirstName, LastName FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');

-- 27. Common Table Expression (CTE)
WITH DepartmentCounts AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employees
    GROUP BY DepartmentID
)
SELECT * FROM DepartmentCounts WHERE EmployeeCount > 5;

-- 28. Window Function
SELECT FirstName, LastName, Salary,
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 29. Case Statement
SELECT FirstName, LastName,
       CASE
           WHEN Salary >= 100000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryBracket
FROM Employees;

-- 30. Pivot Table
SELECT *
FROM (
    SELECT Department, Gender FROM Employees
) AS SourceTable
PIVOT (
    COUNT(Gender) FOR Gender IN ([Male], [Female])
) AS PivotTable;

-- ====================================================
-- End of SQL Query Reference Guide
-- ====================================================