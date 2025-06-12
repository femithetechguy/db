from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()

# Fetch all existing DepartmentIDs
cursor.execute("SELECT DepartmentID FROM Departments")
department_ids = [row[0] for row in cursor.fetchall()]

for _ in range(9500):
    cursor.execute(
        "INSERT INTO Staff (StaffID, FullName, Role, DepartmentID, EmploymentDate) VALUES (?, ?, ?, ?, ?)",
        f"STF{fake.unique.random_int(min=1, max=10000)}",
        fake.name(),
        fake.random_element(elements=['Doctor', 'Nurse', 'Tech', 'Admin', 'Therapist']),
        fake.random_element(department_ids),  # Use only existing DepartmentIDs
        fake.date_between(start_date='-10y', end_date='today')
    )
conn.commit()
cursor.close()
conn.close()