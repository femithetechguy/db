from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()
for _ in range(1000):
    cursor.execute(
        "INSERT INTO Departments (DepartmentID, DepartmentName, Floor) VALUES (?, ?, ?)",
        f"DEP{fake.unique.random_int(min=1, max=10000)}",  # DepartmentID as varchar starting with DEP
        fake.company(),                                    # DepartmentName as company name
        fake.random_int(min=1, max=15)                     # Floor as integer
    )
conn.commit()   