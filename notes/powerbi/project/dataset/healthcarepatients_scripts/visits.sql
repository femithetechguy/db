USE PATIENTDATABASE;
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
        DepartmentID VARCHAR(10),
        VisitReason NVARCHAR(100),
        Outcome NVARCHAR(50),
        ReadmissionFlag BIT,
        FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );
END
GO