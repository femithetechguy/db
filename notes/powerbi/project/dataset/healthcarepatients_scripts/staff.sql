USE PATIENTDATABASE;
GO

-- Create Staff table if it doesn't already exist
IF OBJECT_ID('Staff', 'U') IS NULL
BEGIN
    CREATE TABLE Staff (
        StaffID VARCHAR(20) PRIMARY KEY,
        FullName NVARCHAR(100) NOT NULL,
        Role NVARCHAR(50) NOT NULL, -- Doctor, Nurse, Tech, etc.
        DepartmentID VARCHAR(10),
        EmploymentDate DATE NOT NULL,
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO