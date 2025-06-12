USE PATIENTDATABASE;
GO

-- Drop the table if it exists
IF OBJECT_ID('dbo.Treatments', 'U') IS NOT NULL
    DROP TABLE dbo.Treatments;
GO

CREATE TABLE dbo.Treatments (
    TreatmentID     INT IDENTITY(1,1) PRIMARY KEY,
    VisitID         VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES dbo.Visits(VisitID),
    TreatmentCode   VARCHAR(10) NOT NULL,
    Medication      VARCHAR(50) NOT NULL,
    Cost            INT NOT NULL,
    StaffID         VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES dbo.Staff(StaffID),
    TreatmentDate   DATE NOT NULL
);
GO
-- Insert initial sample rows
INSERT INTO dbo.Treatments (VisitID, TreatmentCode, Medication, Cost, StaffID, TreatmentDate) VALUES
('VIS100000', 'TRT1001', 'Aspirin', 50, 'STF1001', '2019-04-03'),
('VIS100001', 'TRT1002', 'Ibuprofen', 75, 'STF1002', '2021-08-19'),
('VIS100002', 'TRT1003', 'Antibiotics', 120, 'STF1003', '2019-12-25'),
('VIS100003', 'TRT1004', 'Pain Relief', 60, 'STF1004', '2021-10-22'),
('VIS100004', 'TRT1005', 'Antihistamine', 30, 'STF1005', '2023-12-22');
-- Generate additional 4995 rows of synthetic data
DECLARE @i INT = 100005;
WHILE @i < 105000
BEGIN
    INSERT INTO dbo.Treatments (VisitID, TreatmentCode, Medication, Cost, StaffID, TreatmentDate)
    VALUES (
        CONCAT('VIS', FORMAT(@i, '000000')),
        CONCAT('TRT', FORMAT(1000 + (@i % 1000), '0000')),
        CASE (ABS(CHECKSUM(NEWID())) % 5)
            WHEN 0 THEN 'Aspirin'
            WHEN 1 THEN 'Ibuprofen'
            WHEN 2 THEN 'Antibiotics'
            WHEN 3 THEN 'Pain Relief'
            WHEN 4 THEN 'Antihistamine'
            ELSE 'Aspirin'
        END,
        ABS(CHECKSUM(NEWID())) % 200 + 50,
        CONCAT('STF', FORMAT(1000 + (@i % 1000), '0000')),
        DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 2000, GETDATE())
    );
    SET @i = @i + 1;
END;
GO
