USE PATIENTDATABASE;
GO

-- Create Treatments table if it doesn't already exist
IF OBJECT_ID('Treatments', 'U') IS NULL
BEGIN
    CREATE TABLE Treatments (
        TreatmentID VARCHAR(10) PRIMARY KEY,
        VisitID VARCHAR(20) NOT NULL,
        TreatmentCode NVARCHAR(10),
        Medication NVARCHAR(20),
        Cost DECIMAL(18,2),
        StaffID VARCHAR(20) NOT NULL,
        TreatmentDate DATE NOT NULL,
        FOREIGN KEY (VisitID) REFERENCES Visits(VisitID),
        FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
    );
END
GO