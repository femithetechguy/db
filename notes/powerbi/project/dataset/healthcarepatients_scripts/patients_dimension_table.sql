-- Create Patients table with ZipCode as CHAR(5)
CREATE TABLE Patients (
    PatientID VARCHAR(20) PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    AgeGroup VARCHAR(20),
    InsuranceType VARCHAR(20),
    PreExistingConditions VARCHAR(255),
    ZipCode CHAR(5) CHECK (ZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]')
);
GO

-- Insert sample data (first 6 rows as per your data)
INSERT INTO Patients (PatientID, FullName, Gender, DateOfBirth, AgeGroup, InsuranceType, PreExistingConditions, ZipCode) VALUES
('PAT1000', 'John Smith', 'Male', '1949-06-15', '65+', 'Medicare', 'Asthma', '10001'),
('PAT1001', 'Michael Brown', 'Male', '1974-03-22', '36-64', 'Medicaid', 'Hypertension', '30301'),
('PAT1002', 'Emily Davis', 'Female', '2019-11-05', '0-18', 'Medicaid', 'None', '60601'),
('PAT1003', 'David Wilson', 'Male', '2009-08-10', '0-18', 'Medicaid', 'Hypertension', '94105'),
('PAT1004', 'Robert Johnson', 'Male', '1961-01-30', '65+', 'Medicare', 'Asthma', '73301'),
('PAT1005', 'William Lee', 'Male', '1969-12-12', '36-64', 'Private', 'Asthma', '33101');
GO

-- Generate and insert 4994 more rows of synthetic data with valid US ZIP codes
DECLARE @i INT = 1006;
WHILE @i <= 5999
BEGIN
    INSERT INTO Patients (PatientID, FullName, Gender, DateOfBirth, AgeGroup, InsuranceType, PreExistingConditions, ZipCode)
    VALUES (
        CONCAT('PAT', FORMAT(@i, '0000')),
        CONCAT('Patient', @i),
        CASE WHEN @i % 2 = 0 THEN 'Male' ELSE 'Female' END,
        DATEADD(DAY, -((@i % 90) * 365 + (@i % 365)), GETDATE()),
        CASE 
            WHEN (@i % 80) < 18 THEN '0-18'
            WHEN (@i % 80) < 36 THEN '19-35'
            WHEN (@i % 80) < 65 THEN '36-64'
            ELSE '65+'
        END,
        CASE 
            WHEN @i % 3 = 0 THEN 'Medicare'
            WHEN @i % 3 = 1 THEN 'Medicaid'
            ELSE 'Private'
        END,
        CASE 
            WHEN @i % 5 = 0 THEN 'Asthma'
            WHEN @i % 5 = 1 THEN 'Hypertension'
            WHEN @i % 5 = 2 THEN 'Diabetes'
            WHEN @i % 5 = 3 THEN 'None'
            ELSE 'Asthma,Hypertension'
        END,
        RIGHT('00000' + CAST(501 + (@i % (99950 - 501 + 1)) AS VARCHAR(5)), 5) -- Generates 00501 to 99950
    );
    SET @i = @i + 1;
END
GO
