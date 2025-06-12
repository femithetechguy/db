USE PATIENTDATABASE;
GO

-- Drop the table if it already exists
IF OBJECT_ID('Departments', 'U') IS NOT NULL
    DROP TABLE Departments;
GO

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    Floor INT NOT NULL,
    HeadOfDepartment NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    NumberOfBeds INT NOT NULL
);
GO

-- Insert 100 rows of sample data (100 unique departments)
WITH Numbers AS (
    SELECT TOP (100) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
)
INSERT INTO Departments (DepartmentName, Floor, HeadOfDepartment, PhoneNumber, NumberOfBeds)
SELECT
    'Department_' + CAST(n AS NVARCHAR(10)),
    ((n - 1) % 10) + 1, -- Floors 1 to 10
    'Dr. Head_' + CAST(n AS NVARCHAR(10)),
    '+1-555-' + RIGHT('0000' + CAST(n AS NVARCHAR(4)), 4),
    ((n - 1) % 50) + 10 -- Beds 10 to 59
FROM Numbers;
GO
