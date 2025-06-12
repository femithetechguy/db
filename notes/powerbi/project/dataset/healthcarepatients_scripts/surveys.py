from faker import Faker
import pyodbc

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=PATIENTDATABASE;UID=sa;PWD=Fttg@powerbi143')
cursor = conn.cursor()
fake = Faker()

# Fetch all VisitIDs once to avoid repeated queries
cursor.execute("SELECT VisitID FROM Visits")
visit_ids = [row[0] for row in cursor.fetchall()]

batch_size = 1000
total_records = 100000
records = []

try:
    for i in range(total_records):
        visit_id = fake.random_element(visit_ids)
        survey_id = f"SURV{100000 + i:06}"  # Guaranteed unique and sequential
        rating = fake.random_int(min=1, max=5)
        comment = fake.sentence(nb_words=10)
        response_date = fake.date_between(start_date='-2y', end_date='today')
        records.append((survey_id, visit_id, rating, comment, response_date))

        # Insert in batches
        if (i + 1) % batch_size == 0 or (i + 1) == total_records:
            cursor.executemany(
                "INSERT INTO Surveys (SurveyID, VisitID, Rating, Comment, ResponseDate) VALUES (?, ?, ?, ?, ?)",
                records
            )
            records = []
            if (i + 1) % (batch_size * 10) == 0:
                print(f"{i + 1} records inserted...")

    conn.commit()
finally:
    cursor.close()
    conn.close()

