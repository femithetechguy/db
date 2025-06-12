import csv
import random
from datetime import datetime, timedelta

header = [
    "Claim ID",
    "Reserve Date",
    "Initial Reserve Amount",
    "Current Reserve Amount",
    "Reserve Type"
]

# Seed data
seed_rows = [
    ["CLM001", "1/16/24", 7000, 0, "Indemnity Reserve"],
    ["CLM002", "2/2/24", 30000, 5000, "Indemnity Reserve"],
    ["CLM004", "3/5/24", 1000, 500, "Indemnity Reserve"],
    ["CLM005", "3/20/24", 12000, 2000, "Indemnity Reserve"],
    ["CLM006", "4/2/24", 8000, 8000, "Indemnity Reserve"],
]

def random_date(start, end):
    delta = end - start
    random_days = random.randint(0, delta.days)
    return (start + timedelta(days=random_days)).strftime("%-m/%-d/%y")

def generate_row(idx):
    claim_id = f"CLM{idx:03d}"
    reserve_date = random_date(datetime(2023, 1, 1), datetime(2024, 6, 30))
    initial_reserve = random.randint(1000, 50000)
    # Current reserve is less than or equal to initial
    current_reserve = random.randint(0, initial_reserve)
    reserve_type = "Indemnity Reserve"
    return [claim_id, reserve_date, initial_reserve, current_reserve, reserve_type]

with open("claims_reserve.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(header)
    for row in seed_rows:
        writer.writerow(row)
    for i in range(7, 5001+1):  # Start from CLM007 to CLM5001
        writer.writerow(generate_row(i))