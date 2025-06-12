USE PATIENTDATABASE;
GO

-- Create Departments table if it doesn't already exist
IF OBJECT_ID('Departments', 'U') IS NULL
BEGIN
    CREATE TABLE Departments (
        DepartmentID INT PRIMARY KEY IDENTITY(1,1),
        DepartmentName NVARCHAR(100) NOT NULL,
        Floor INT NOT NULL
    );
END
GO

-- Create Patients table if it doesn't already exist
IF OBJECT_ID('Patients', 'U') IS NULL
BEGIN
    CREATE TABLE Patients (
        PatientID INT PRIMARY KEY IDENTITY(1,1),
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        DateOfBirth DATE NOT NULL,
        Gender CHAR(1) NOT NULL,
        Address NVARCHAR(200),
        Phone NVARCHAR(20)
    );
END
GO

-- Create Staff table if it doesn't already exist
IF OBJECT_ID('Staff', 'U') IS NULL
BEGIN
    CREATE TABLE Staff (
        StaffID INT PRIMARY KEY IDENTITY(1,1),
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        DepartmentID INT NOT NULL,
        Position NVARCHAR(50),
        HireDate DATE,
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO

-- Create Treatments table if it doesn't already exist
IF OBJECT_ID('Treatments', 'U') IS NULL
BEGIN
    CREATE TABLE Treatments (
        TreatmentID INT PRIMARY KEY IDENTITY(1,1),
        PatientID INT NOT NULL,
        StaffID INT NOT NULL,
        DepartmentID INT NOT NULL,
        VisitDate DATE NOT NULL,
        Diagnosis NVARCHAR(200),
        TreatmentDescription NVARCHAR(500),
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO

-- Create Surveys table if it doesn't already exist
IF OBJECT_ID('Surveys', 'U') IS NULL
BEGIN
    CREATE TABLE Surveys (
        SurveyID INT PRIMARY KEY IDENTITY(1,1),
        PatientID INT NOT NULL,
        StaffID INT NOT NULL,
        DepartmentID INT NOT NULL,
        VisitDate DATE NOT NULL,
        SurveyScore INT CHECK (SurveyScore BETWEEN 1 AND 10),
        Comments NVARCHAR(500),
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO