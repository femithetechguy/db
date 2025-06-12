USE PATIENTDATABASE;
GO

-- Assuming Patient and Department tables already exist

CREATE TABLE Visits (
    VisitID VARCHAR(20) PRIMARY KEY,
    PatientID VARCHAR(20) NOT NULL,
    AdmissionDate DATETIME NOT NULL,
    DischargeDate DATETIME NOT NULL,
    LengthOfStay INT NOT NULL,
    DepartmentID INT NOT NULL,
    VisitReason VARCHAR(50) NOT NULL,
    Outcome VARCHAR(50) NOT NULL,
    ReadmissionFlag BIT NOT NULL,
    CONSTRAINT FK_Visits_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT FK_Visits_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Sample Department mapping for demonstration
-- Neurology: 1, Oncology: 2, Cardiology: 3

INSERT INTO Visits (VisitID, PatientID, AdmissionDate, DischargeDate, LengthOfStay, DepartmentID, VisitReason, Outcome, ReadmissionFlag) VALUES
('VIS100000', 'PAT1000', '2019-04-02 00:00:00', '2019-04-11 00:00:00', DATEDIFF(DAY, '2019-04-02 00:00:00', '2019-04-11 00:00:00'), 1, 'Follow-up', 'Transferred', 0),
('VIS100001', 'PAT1001', '2021-08-18 00:00:00', '2021-08-25 00:00:00', DATEDIFF(DAY, '2021-08-18 00:00:00', '2021-08-25 00:00:00'), 2, 'Checkup', 'Readmitted', 1),
('VIS100002', 'PAT1002', '2019-12-24 00:00:00', '2019-12-27 00:00:00', DATEDIFF(DAY, '2019-12-24 00:00:00', '2019-12-27 00:00:00'), 3, 'Surgery', 'Deceased', 0),
('VIS100003', 'PAT1003', '2021-10-21 00:00:00', '2021-10-22 00:00:00', DATEDIFF(DAY, '2021-10-21 00:00:00', '2021-10-22 00:00:00'), 1, 'Emergency', 'Transferred', 0),
('VIS100004', 'PAT1004', '2023-12-21 00:00:00', '2023-12-30 00:00:00', DATEDIFF(DAY, '2023-12-21 00:00:00', '2023-12-30 00:00:00'), 1, 'Checkup', 'Readmitted', 1);
GO

-- Generate additional 4995 rows of synthetic data
-- Example using a loop for SQL Server (for demonstration; for large data, use ETL tools or scripts)

DECLARE @i INT = 100005;
WHILE @i < 105000
BEGIN
    INSERT INTO Visits (VisitID, PatientID, AdmissionDate, DischargeDate, LengthOfStay, DepartmentID, VisitReason, Outcome, ReadmissionFlag)
    VALUES (
        CONCAT('VIS', FORMAT(@i, '000000')),
        CONCAT('PAT', FORMAT(1000 + (@i % 1000), '0000')),
        DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 2000, GETDATE()),
        DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 1990, GETDATE()),
        ABS(CHECKSUM(NEWID())) % 15 + 1,
        1 + (ABS(CHECKSUM(NEWID())) % 3),
        CASE (ABS(CHECKSUM(NEWID())) % 4)
            WHEN 0 THEN 'Surgery'
            WHEN 1 THEN 'Emergency'
            WHEN 2 THEN 'Checkup'
            WHEN 3 THEN 'Follow-up'
            ELSE 'Checkup'
        END,
        CASE (ABS(CHECKSUM(NEWID())) % 4)
            WHEN 0 THEN 'Recovered'
            WHEN 1 THEN 'Transferred'
            WHEN 2 THEN 'Deceased'
            WHEN 3 THEN 'Readmitted'
            ELSE 'Recovered'
        END,
        ABS(CHECKSUM(NEWID())) % 2
    );
    SET @i = @i + 1;
END
GO