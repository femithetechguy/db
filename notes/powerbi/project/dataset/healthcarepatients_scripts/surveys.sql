USE PATIENTDATABASE;
GO

-- Create Surveys table if it doesn't already exist
IF OBJECT_ID('Surveys', 'U') IS NULL
BEGIN
    CREATE TABLE Surveys (
        SurveyID VARCHAR(10) PRIMARY KEY,
        VisitID VARCHAR(20) NOT NULL,
        Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
        Comment NVARCHAR(500),
        ResponseDate DATE NOT NULL,
        FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
    );
END
GO