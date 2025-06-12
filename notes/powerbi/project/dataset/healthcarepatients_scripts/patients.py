from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()
for _ in range(50000):
    full_name = fake.name()
    gender = fake.random_element(elements=('Male', 'Female'))
    dob = fake.date_of_birth(minimum_age=0, maximum_age=90)
    age = (fake.date_time_this_year().year - dob.year)
    if age <= 18:
        age_group = '0–18'
    elif age <= 35:
        age_group = '19–35'
    elif age <= 60:
        age_group = '36–60'
    else:
        age_group = '61+'
    insurance_type = fake.random_element(elements=('Private', 'Public', 'None'))
    pre_existing_conditions = ', '.join(fake.words(nb=3))
    zip_code = fake.zipcode()
    patient_id = f"PAT{fake.unique.random_int(min=1, max=1000000)}"

    cursor.execute(
        "INSERT INTO Patients (PatientID, FullName, Gender, DateOfBirth, AgeGroup, InsuranceType, PreExistingConditions, ZipCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        patient_id,
        full_name,
        gender,
        dob,
        age_group,
        insurance_type,
        pre_existing_conditions,
        zip_code
    )
conn.commit()   