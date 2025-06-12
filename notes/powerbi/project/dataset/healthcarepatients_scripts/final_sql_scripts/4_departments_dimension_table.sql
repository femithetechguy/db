USE PATIENTDATABASE;
GO

IF OBJECT_ID('Departments', 'U') IS NULL
BEGIN
    CREATE TABLE Departments (
        DepartmentID VARCHAR(10) PRIMARY KEY,
        DepartmentName NVARCHAR(100) NOT NULL,
        Floor INT NOT NULL
    );
END
GO