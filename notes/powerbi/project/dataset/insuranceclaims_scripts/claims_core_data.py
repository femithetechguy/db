import csv
import random
from datetime import datetime, timedelta

header = [
    "Claim ID", "Policy Number", "Insured/Policyholder ID", "Claim Status",
    "Date of Loss/Incident Date", "Date Claim Reported", "Date Claim Opened", "Date Claim Closed",
    "Claim Type/Line of Business", "Cause of Loss", "Claim Severity", "Claim Subtype/Specific Event",
    "Loss Location", "Reported By", "Fraud Indicator", "Subrogation Potential"
]

claim_statuses = ["Closed", "Open", "Denied", "In Progress", "Approved"]
claim_types = ["Auto", "Home", "Health", "Property", "Workers' Comp"]
causes = {
    "Auto": ["Accident", "Theft"],
    "Home": ["Fire", "Flood", "Theft"],
    "Health": ["Illness", "Injury"],
    "Property": ["Flood", "Fire", "Theft"],
    "Workers' Comp": ["Injury"]
}
severities = ["Major", "Moderate", "Minor", "Total Loss"]
subtypes = {
    "Accident": ["Rear-end collision", "Side collision", "Single vehicle"],
    "Theft": ["Vehicle contents stolen", "Home burglary", "Office theft"],
    "Fire": ["Kitchen Fire", "Electrical Fire", "Wildfire"],
    "Flood": ["Burst Pipe", "Storm Flood", "Sewer Backup"],
    "Illness": ["Flu", "COVID-19", "Food Poisoning"],
    "Injury": ["Slip and Fall", "Workplace Injury", "Sports Injury"]
}
locations = [
    "Atlanta, GA, 30303", "Macon, GA, 31201", "Savannah, GA, 31401",
    "Augusta, GA, 30901", "Columbus, GA, 31901", "Athens, GA, 30601"
]
reported_by = ["Policyholder", "Agent", "Third Party"]
fraud_indicator = ["No", "Yes"]
subrogation_potential = ["No", "Yes"]

def random_date(start, end):
    delta = end - start
    return start + timedelta(days=random.randint(0, delta.days))

def make_row(idx):
    claim_id = f"CLM{idx:03d}"
    policy_num = f"POL{random.randint(78900, 78999)}"
    insured_id = f"INS{random.randint(54321, 54399)}"
    status = random.choice(claim_statuses)
    base_date = random_date(datetime(2023, 1, 1), datetime(2024, 6, 1))
    date_loss = base_date.strftime("%-m/%-d/%y")
    date_reported = (base_date + timedelta(days=random.randint(0,2))).strftime("%-m/%-d/%y")
    date_opened = (base_date + timedelta(days=random.randint(0,2))).strftime("%-m/%-d/%y")
    date_closed = ""
    if status == "Closed" or status == "Approved":
        date_closed = (base_date + timedelta(days=random.randint(10,60))).strftime("%-m/%-d/%y")
    claim_type = random.choice(claim_types)
    cause = random.choice(causes[claim_type])
    severity = random.choice(severities)
    subtype = random.choice(subtypes.get(cause, ["Other"]))
    location = random.choice(locations)
    reporter = random.choice(reported_by)
    fraud = random.choices(fraud_indicator, weights=[95,5])[0]
    subro = random.choice(subrogation_potential)
    return [
        claim_id, policy_num, insured_id, status, date_loss, date_reported, date_opened, date_closed,
        claim_type, cause, severity, subtype, location, reporter, fraud, subro
    ]

with open("claims_core_data.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    # Write the 6 sample rows first
    writer.writerow([
        "CLM001","POL78901","INS54321","Closed","1/15/24","1/16/24","1/16/24","3/1/24",
        "Auto","Accident","Major","Rear-end collision","Atlanta, GA, 30303","Policyholder","No","Yes"
    ])
    writer.writerow([
        "CLM002","POL78902","INS54322","Open","2/1/24","2/2/24","2/2/24","",
        "Home","Fire","Total Loss","Kitchen Fire","Macon, GA, 31201","Policyholder","No","No"
    ])
    writer.writerow([
        "CLM003","POL78903","INS54323","Denied","2/10/24","2/11/24","2/11/24","",
        "Health","Illness","Moderate","Flu","Savannah, GA, 31401","Policyholder","No","No"
    ])
    writer.writerow([
        "CLM004","POL78901","INS54321","In Progress","3/5/24","3/5/24","3/5/24","",
        "Auto","Theft","Minor","Vehicle contents stolen","Atlanta, GA, 30303","Policyholder","Yes","No"
    ])
    writer.writerow([
        "CLM005","POL78904","INS54324","Approved","3/20/24","3/20/24","3/20/24","4/10/24",
        "Property","Flood","Major","Burst Pipe","Augusta, GA, 30901","Policyholder","No","Yes"
    ])
    writer.writerow([
        "CLM006","POL78905","INS54325","Open","4/1/24","4/2/24","4/2/24","",
        "Workers' Comp","Injury","Moderate","Slip and Fall","Columbus, GA, 31901","Policyholder","No","No"
    ])
    # Generate the rest
    for i in range(7, 5001):
        writer.writerow(make_row(i))