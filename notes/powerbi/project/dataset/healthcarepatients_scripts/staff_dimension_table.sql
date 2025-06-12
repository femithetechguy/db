USE PATIENTDATABASE;
GO

IF OBJECT_ID('Staff', 'U') IS NOT NULL
    DROP TABLE Staff;
GO

CREATE TABLE Staff (
    StaffID VARCHAR(20) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    EmploymentDate DATE NOT NULL
);
GO

-- Insert initial sample rows (count Doctors here)
INSERT INTO Staff (FullName, Role, DepartmentID, EmploymentDate) VALUES
('Dr. Emily Carter', 'Doctor', 1, '2015-03-12'),
('Nurse John Smith', 'Nurse', 2, '2018-07-23'),
('Dr. Priya Patel', 'Doctor', 3, '2012-11-05'),
('Tech Michael Lee', 'Tech', 4, '2019-01-15'),
('Nurse Sarah Kim', 'Nurse', 1, '2017-05-30'),
('Dr. David Brown', 'Doctor', 2, '2010-09-18'),
('Tech Anna White', 'Tech', 3, '2020-06-10'),
('Nurse Carlos Gomez', 'Nurse', 4, '2016-02-28'),
('Dr. Linda Green', 'Doctor', 1, '2013-12-01'),
('Tech Brian Black', 'Tech', 2, '2021-04-19');

-- Create temp tables for names
IF OBJECT_ID('tempdb..#FirstNames') IS NOT NULL DROP TABLE #FirstNames;
IF OBJECT_ID('tempdb..#LastNames') IS NOT NULL DROP TABLE #LastNames;
CREATE TABLE #FirstNames (FirstName NVARCHAR(50));
CREATE TABLE #LastNames (LastName NVARCHAR(50));

INSERT INTO #FirstNames VALUES
('James'), ('Mary'), ('Robert'), ('Patricia'), ('John'), ('Jennifer'), ('Michael'), ('Linda'),
('William'), ('Elizabeth'), ('David'), ('Barbara'), ('Richard'), ('Susan'), ('Joseph'), ('Jessica'),
('Thomas'), ('Sarah'), ('Charles'), ('Karen'), ('Christopher'), ('Nancy'), ('Daniel'), ('Lisa'),
('Matthew'), ('Betty'), ('Anthony'), ('Margaret'), ('Mark'), ('Sandra'), ('Donald'), ('Ashley'),
('Steven'), ('Kimberly'), ('Paul'), ('Emily'), ('Andrew'), ('Donna'), ('Joshua'), ('Michelle');

INSERT INTO #LastNames VALUES
('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'), ('Garcia'), ('Miller'), ('Davis'),
('Rodriguez'), ('Martinez'), ('Hernandez'), ('Lopez'), ('Gonzalez'), ('Wilson'), ('Anderson'),
('Thomas'), ('Taylor'), ('Moore'), ('Jackson'), ('Martin'), ('Lee'), ('Perez'), ('Thompson'),
('White'), ('Harris'), ('Sanchez'), ('Clark'), ('Ramirez'), ('Lewis'), ('Robinson'), ('Walker'),
('Young'), ('Allen'), ('King'), ('Wright'), ('Scott'), ('Torres'), ('Nguyen'), ('Hill'), ('Flores');

-- Count initial Doctors
DECLARE @InitialDoctors INT = (SELECT COUNT(*) FROM Staff WHERE Role = 'Doctor');
DECLARE @DoctorsToGenerate INT = 200 - @InitialDoctors;
DECLARE @OtherStaffToGenerate INT = 1500 - 10 - @DoctorsToGenerate; -- 10 initial rows

-- Generate Doctors
;WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < @DoctorsToGenerate
),
GeneratedDoctors AS (
    SELECT 
        CONCAT('Dr. ', fn.FirstName, ' ', ln.LastName) AS FullName,
        'Doctor' AS Role,
        (n % 4) + 1 AS DepartmentID,
        DATEADD(DAY, n, '2010-01-01') AS EmploymentDate,
        ROW_NUMBER() OVER (ORDER BY n, fn.FirstName, ln.LastName) AS rn
    FROM Numbers
    CROSS JOIN #FirstNames fn
    CROSS JOIN #LastNames ln
)
INSERT INTO Staff (FullName, Role, DepartmentID, EmploymentDate)
SELECT TOP (@DoctorsToGenerate) FullName, Role, DepartmentID, EmploymentDate
FROM GeneratedDoctors
WHERE FullName NOT IN (SELECT FullName FROM Staff)
OPTION (MAXRECURSION 0);

-- Generate Nurses and Techs
;WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < @OtherStaffToGenerate
),
GeneratedOtherStaff AS (
    SELECT 
        CONCAT(
            CASE WHEN n % 2 = 1 THEN 'Nurse ' ELSE 'Tech ' END,
            fn.FirstName, ' ', ln.LastName
        ) AS FullName,
        CASE WHEN n % 2 = 1 THEN 'Nurse' ELSE 'Tech' END AS Role,
        (n % 4) + 1 AS DepartmentID,
        DATEADD(DAY, n + 500, '2010-01-01') AS EmploymentDate,
        ROW_NUMBER() OVER (ORDER BY n, fn.FirstName, ln.LastName) AS rn
    FROM Numbers
    CROSS JOIN #FirstNames fn
    CROSS JOIN #LastNames ln
)
INSERT INTO Staff (FullName, Role, DepartmentID, EmploymentDate)
SELECT TOP (@OtherStaffToGenerate) FullName, Role, DepartmentID, EmploymentDate
FROM GeneratedOtherStaff
WHERE FullName NOT IN (SELECT FullName FROM Staff)
OPTION (MAXRECURSION 0);

DROP TABLE #FirstNames;
DROP TABLE #LastNames;