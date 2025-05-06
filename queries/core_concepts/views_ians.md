# Querying SQL Views Explanation

These statements are querying three different views in the `view_schema`. Let's break down each one:

## 1. Basic Employee Information
````sql
SELECT * FROM view_schema.EmployeeBasicInfo;
````
This retrieves:
- EmployeeID
- FullName (concatenated FirstName + LastName)
- Simple view without joins
- Shows basic employee list

## 2. Detailed Employee Information
````sql
SELECT * FROM view_schema.EmployeeDetails;
````
This retrieves:
- EmployeeID
- FullName
- Salary
- DepartmentName
- Includes JOIN with Departments table
- Shows complete employee details with department

## 3. Department Statistics
````sql
SELECT * FROM view_schema.DepartmentSummary;
````
This retrieves:
- DepartmentName
- EmployeeCount (COUNT of employees)
- AverageSalary (AVG of salaries)
- Uses GROUP BY
- Shows department-level metrics

To execute in VS Code's integrated terminal:
```bash
sqlcmd -S localhost -U sa -P YourPassword -d fttg_db -Q "SELECT * FROM view_schema.EmployeeBasicInfo; SELECT * FROM view_schema.EmployeeDetails; SELECT * FROM view_schema.DepartmentSummary;"
```

Key points:
- Views act like virtual tables
- Each view provides different level of detail
- Views abstract complex queries into simple SELECT statements
- Views can combine data from multiple tables