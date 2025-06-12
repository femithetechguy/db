erDiagram
      
"dbo.Departments" {
    varchar(10) DepartmentID "PK"
          nvarchar(100) DepartmentName ""
          int Floor ""
          
}
"dbo.Patients" {
    varchar(20) PatientID "PK"
          nvarchar(100) FullName ""
          nvarchar(10) Gender ""
          date DateOfBirth ""
          nvarchar(20) AgeGroup ""
          nvarchar(50) InsuranceType ""
          nvarchar(500) PreExistingConditions ""
          nvarchar(10) ZipCode ""
          
}
"dbo.Staff" {
    varchar(20) StaffID "PK"
          nvarchar(100) FullName ""
          nvarchar(50) Role ""
          varchar(10) DepartmentID "FK"
          date EmploymentDate ""
          
}
"dbo.Visits" {
    varchar(20) VisitID "PK"
          varchar(20) PatientID "FK"
          datetime AdmissionDate ""
          datetime DischargeDate ""
          int LengthOfStay ""
          varchar(10) DepartmentID "FK"
          nvarchar(100) VisitReason ""
          nvarchar(50) Outcome ""
          bit ReadmissionFlag ""
          
}
"dbo.Treatments" {
    varchar(10) TreatmentID "PK"
          varchar(20) VisitID "FK"
          nvarchar(10) TreatmentCode ""
          nvarchar(20) Medication ""
          decimal Cost ""
          varchar(20) StaffID "FK"
          date TreatmentDate ""
          
}
"dbo.Surveys" {
    varchar(10) SurveyID "PK"
          varchar(20) VisitID "FK"
          int Rating ""
          nvarchar(500) Comment ""
          date ResponseDate ""
          
}
      "dbo.Staff" |o--|{ "dbo.Departments": "DepartmentID"
"dbo.Visits" ||--|{ "dbo.Patients": "PatientID"
"dbo.Visits" |o--|{ "dbo.Departments": "DepartmentID"
"dbo.Treatments" ||--|{ "dbo.Visits": "VisitID"
"dbo.Treatments" ||--|{ "dbo.Staff": "StaffID"
"dbo.Surveys" ||--|{ "dbo.Visits": "VisitID"
