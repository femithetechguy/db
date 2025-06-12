from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()

# Fetch all PatientIDs and DepartmentIDs once
cursor.execute("SELECT PatientID FROM Patients")
patient_ids = [row[0] for row in cursor.fetchall()]
cursor.execute("SELECT DepartmentID FROM Departments")
department_ids = [row[0] for row in cursor.fetchall()]

batch_size = 1000
data = []

try:
    for i in range(550000):
        admission_date = fake.date_time_between(start_date='-2y', end_date='now')
        if fake.random_int(1, 10) == 1:
            discharge_date = None
        else:
            discharge_date = fake.date_time_between(start_date=admission_date, end_date='+30d')
        visit_id = f"VIS{fake.unique.random_int(min=1, max=550000)}"
        patient_id = fake.random_element(elements=patient_ids)
        department_id = fake.random_element(elements=department_ids)
        visit_reason = fake.sentence(nb_words=4)
        outcome = fake.random_element(elements=['Recovered', 'Improved', 'Unchanged', 'Deceased'])
        readmission_flag = int(fake.boolean(chance_of_getting_true=15))
        data.append((
            visit_id,
            patient_id,
            admission_date,
            discharge_date,
            department_id,
            visit_reason,
            outcome,
            readmission_flag
        ))
        if len(data) == batch_size:
            cursor.executemany(
                "INSERT INTO Visits (VisitID, PatientID, AdmissionDate, DischargeDate, DepartmentID, VisitReason, Outcome, ReadmissionFlag) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                data
            )
            conn.commit()
            data = []
    # Insert any remaining records
    if data:
        cursor.executemany(
            "INSERT INTO Visits (VisitID, PatientID, AdmissionDate, DischargeDate, DepartmentID, VisitReason, Outcome, ReadmissionFlag) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            data
        )
        conn.commit()
finally:
    cursor.close()
    conn.close()