import csv
import random
from datetime import datetime, timedelta

header = [
    "Policy Number",
    "Policy Effective Date",
    "Policy Expiration Date",
    "Product Name/Type",
    "Coverage Limits",
    "Deductible Amount",
    "Premium Amount",
    "Agent/Broker ID",
    "Underwriting Segment/Risk Class"
]

product_types = [
    ("Auto Standard", 100000, 500, 1200, "Standard"),
    ("Homeowners Plus", 300000, 1000, 1800, "Preferred"),
    ("Health Basic", 5000, 250, 500, "Standard"),
    ("Property Commercial", 500000, 2000, 2500, "Commercial"),
    ("Workers' Comp Small Business", 50000, 0, 1000, "Small Business")
]

agents = ["AGT101", "AGT102", "AGT103"]

def random_date(start, end):
    delta = end - start
    days = random.randint(0, delta.days)
    return start + timedelta(days=days)

def format_date(dt):
    return dt.strftime("%-m/%-d/%y")

rows = []
for i in range(5000):
    policy_num = f"POL{78901 + i:05d}"
    prod = random.choice(product_types)
    agent = random.choice(agents)
    eff_date = random_date(datetime(2022, 1, 1), datetime(2024, 1, 1))
    exp_date = eff_date + timedelta(days=364)
    row = [
        policy_num,
        format_date(eff_date),
        format_date(exp_date),
        prod[0],
        prod[1],
        prod[2],
        prod[3],
        agent,
        prod[4]
    ]
    rows.append(row)

with open("policies.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerows(rows)