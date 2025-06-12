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
        PatientID VARCHAR(20) NOT NULL PRIMARY KEY,
        FullName NVARCHAR(100) NOT NULL,
        Gender NVARCHAR(10) NOT NULL, -- Male/Female
        DateOfBirth DATE NOT NULL,
        AgeGroup NVARCHAR(20), -- e.g., '0–18', '19–35'
        InsuranceType NVARCHAR(50),
        PreExistingConditions NVARCHAR(500),
        ZipCode NVARCHAR(10)
    );
END
GO

-- Create Staff table if it doesn't already exist
IF OBJECT_ID('Staff', 'U') IS NULL
BEGIN
    CREATE TABLE Staff (
        StaffID VARCHAR(20) PRIMARY KEY,
        FullName NVARCHAR(100) NOT NULL,
        Role NVARCHAR(50) NOT NULL, -- Doctor, Nurse, Tech, etc.
        DepartmentID INT NOT NULL,
        EmploymentDate DATE NOT NULL,
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO

-- Create Visits table if it doesn't already exist
IF OBJECT_ID('Visits', 'U') IS NULL
BEGIN
    CREATE TABLE Visits (
        VisitID VARCHAR(20) PRIMARY KEY,
        PatientID VARCHAR(20) NOT NULL,
        AdmissionDate DATETIME NOT NULL,
        DischargeDate DATETIME,
        LengthOfStay AS (DATEDIFF(DAY, AdmissionDate, DischargeDate)),
        DepartmentID INT NOT NULL,
        VisitReason NVARCHAR(100),
        Outcome NVARCHAR(50),
        ReadmissionFlag BIT,
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO

-- Create Treatments table if it doesn't already exist
IF OBJECT_ID('Treatments', 'U') IS NULL
BEGIN
    CREATE TABLE Treatments (
        TreatmentID INT PRIMARY KEY IDENTITY(1,1),
        VisitID VARCHAR(20) NOT NULL,
        TreatmentCode NVARCHAR(50),
        Medication NVARCHAR(200),
        Cost DECIMAL(18,2),
        StaffID VARCHAR(20) NOT NULL,
        TreatmentDate DATE NOT NULL,
        FOREIGN KEY (VisitID) REFERENCES Visits(VisitID),
        FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
    );
END
GO

-- Create Surveys table if it doesn't already exist
IF OBJECT_ID('Surveys', 'U') IS NULL
BEGIN
    CREATE TABLE Surveys (
        SurveyID INT PRIMARY KEY IDENTITY(1,1),
        VisitID VARCHAR(20) NOT NULL,
        Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
        Comment NVARCHAR(500),
        ResponseDate DATE NOT NULL,
        FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
    );
END
GO