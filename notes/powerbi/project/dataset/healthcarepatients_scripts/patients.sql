USE PATIENTDATABASE;
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

