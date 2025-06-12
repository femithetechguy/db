USE PATIENTDATABASE;
GO

-- Drop Surveys table if it already exists
IF OBJECT_ID('Surveys', 'U') IS NOT NULL
    DROP TABLE Surveys;
GO

-- Create Visits table if it does not exist (for demonstration)
IF OBJECT_ID('Visits', 'U') IS NULL
BEGIN
    CREATE TABLE Visits (
        VisitID NVARCHAR(20) PRIMARY KEY
    );
    -- Insert sample VisitIDs
    INSERT INTO Visits (VisitID) VALUES ('V001'), ('V002'), ('V003');
END
GO

CREATE TABLE Surveys (
    SurveyID INT IDENTITY(1,1) PRIMARY KEY,
    VisitID NVARCHAR(20) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(255),
    ResponseDate DATE
);
GO

-- Example: Insert one survey per VisitID from Visits table, with sample data
INSERT INTO Surveys (VisitID, Rating, Comment, ResponseDate)
SELECT 
    VisitID,
    (ABS(CHECKSUM(NEWID())) % 5) + 1 AS Rating, -- Random rating 1-5
    'Sample comment for visit ' + VisitID,
    DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 30), GETDATE())
FROM Visits;
GO

