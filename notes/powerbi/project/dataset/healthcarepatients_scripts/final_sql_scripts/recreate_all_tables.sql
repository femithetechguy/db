-- Departments
SELECT 
    'INSERT INTO Departments (DepartmentID, DepartmentName, Floor) VALUES (''' 
    + DepartmentID + ''', ''' 
    + REPLACE(DepartmentName, '''', '''''') + ''', ' 
    + CAST(Floor AS VARCHAR) + ');'
FROM Departments;

-- Patients
SELECT 
    'INSERT INTO Patients (PatientID, FullName, Gender, DateOfBirth, AgeGroup, InsuranceType, PreExistingConditions, ZipCode) VALUES (''' 
    + PatientID + ''', ''' 
    + REPLACE(FullName, '''', '''''') + ''', ''' 
    + REPLACE(Gender, '''', '''''') + ''', ''' 
    + CONVERT(varchar, DateOfBirth, 23) + ''', ' 
    + CASE WHEN AgeGroup IS NULL THEN 'NULL' ELSE '''' + REPLACE(AgeGroup, '''', '''''') + '''' END + ', ' 
    + CASE WHEN InsuranceType IS NULL THEN 'NULL' ELSE '''' + REPLACE(InsuranceType, '''', '''''') + '''' END + ', ' 
    + CASE WHEN PreExistingConditions IS NULL THEN 'NULL' ELSE '''' + REPLACE(PreExistingConditions, '''', '''''') + '''' END + ', ' 
    + CASE WHEN ZipCode IS NULL THEN 'NULL' ELSE '''' + REPLACE(ZipCode, '''', '''''') + '''' END + ');'
FROM Patients;

-- Staff
SELECT 
    'INSERT INTO Staff (StaffID, FullName, Role, DepartmentID, EmploymentDate) VALUES (''' 
    + StaffID + ''', ''' 
    + REPLACE(FullName, '''', '''''') + ''', ''' 
    + REPLACE(Role, '''', '''''') + ''', ''' 
    + CAST(DepartmentID AS VARCHAR) + ''', ''' 
    + CONVERT(varchar, EmploymentDate, 23) + ''');'
FROM Staff;

-- Visits
SELECT 
    'INSERT INTO Visits (VisitID, PatientID, AdmissionDate, DischargeDate, DepartmentID, VisitReason, Outcome, ReadmissionFlag) VALUES (''' 
    + VisitID + ''', ''' 
    + PatientID + ''', ''' 
    + CONVERT(varchar, AdmissionDate, 120) + ''', ' 
    + CASE WHEN DischargeDate IS NULL THEN 'NULL' ELSE '''' + CONVERT(varchar, DischargeDate, 120) + '''' END + ', ' 
    + CAST(DepartmentID AS VARCHAR) + ', ' 
    + CASE WHEN VisitReason IS NULL THEN 'NULL' ELSE '''' + REPLACE(VisitReason, '''', '''''') + '''' END + ', ' 
    + CASE WHEN Outcome IS NULL THEN 'NULL' ELSE '''' + REPLACE(Outcome, '''', '''''') + '''' END + ', ' 
    + CASE WHEN ReadmissionFlag IS NULL THEN 'NULL' ELSE CAST(ReadmissionFlag AS VARCHAR) END + ');'
FROM Visits;

-- Treatments
SELECT 
    'INSERT INTO Treatments (TreatmentID, VisitID, TreatmentCode, Medication, Cost, StaffID, TreatmentDate) VALUES (' 
    + CAST(TreatmentID AS VARCHAR) + ', ''' 
    + VisitID + ''', ' 
    + CASE WHEN TreatmentCode IS NULL THEN 'NULL' ELSE '''' + REPLACE(TreatmentCode, '''', '''''') + '''' END + ', ' 
    + CASE WHEN Medication IS NULL THEN 'NULL' ELSE '''' + REPLACE(Medication, '''', '''''') + '''' END + ', ' 
    + CASE WHEN Cost IS NULL THEN 'NULL' ELSE CAST(Cost AS VARCHAR) END + ', ''' 
    + StaffID + ''', ''' 
    + CONVERT(varchar, TreatmentDate, 23) + ''');'
FROM Treatments;

-- Surveys
SELECT 
    'INSERT INTO Surveys (SurveyID, VisitID, Rating, Comment, ResponseDate) VALUES (''' 
    + SurveyID + ''', ''' 
    + VisitID + ''', ' 
    + CAST(Rating AS VARCHAR) + ', ' 
    + CASE WHEN Comment IS NULL THEN 'NULL' ELSE '''' + REPLACE(Comment, '''', '''''') + '''' END + ', ''' 
    + CONVERT(varchar, ResponseDate, 23) + ''');'
FROM Surveys;