from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()

# Fetch VisitIDs and StaffIDs once before the loop
cursor.execute("SELECT VisitID FROM Visits")
visit_ids = [row[0] for row in cursor.fetchall()]
cursor.execute("SELECT StaffID FROM Staff")
staff_ids = [row[0] for row in cursor.fetchall()]

batch_size = 1000
data = []

for _ in range(550000):
    if not visit_ids or not staff_ids:
        continue

    visit_id = fake.random_element(visit_ids)
    staff_id = fake.random_element(staff_ids)

    data.append((
        f"TRT{fake.unique.random_int(min=1, max=999999):06}",         # TreatmentID as TRT + 6 digits
        visit_id,                                                    # Use existing VisitID
        fake.bothify(text='TREAT###'),                               # TreatmentCode as TREAT###
        fake.word().capitalize(),                                    # Medication as a random word
        round(fake.pyfloat(left_digits=4, right_digits=2, positive=True, min_value=10, max_value=5000), 2),  # Cost
        staff_id,                                                    # Use StaffID
        fake.date_between(start_date='-2y', end_date='today')        # TreatmentDate
    ))

    if len(data) == batch_size:
        cursor.executemany(
            "INSERT INTO Treatments (TreatmentID, VisitID, TreatmentCode, Medication, Cost, StaffID, TreatmentDate) VALUES (?, ?, ?, ?, ?, ?, ?)",
            data
        )
        conn.commit()
        data = []

# Insert any remaining records
if data:
    cursor.executemany(
        "INSERT INTO Treatments (TreatmentID, VisitID, TreatmentCode, Medication, Cost, StaffID, TreatmentDate) VALUES (?, ?, ?, ?, ?, ?, ?)",
        data
    )
    conn.commit()

cursor.close()
conn.close()