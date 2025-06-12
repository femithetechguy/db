import csv
import random
from datetime import datetime, timedelta

header = [
    "Claim ID", "Transaction Date", "Transaction Type", "Amount Paid",
    "Payment Category", "Payee Type", "Currency"
]

# Seed data
seed_rows = [
    ["CLM001", "2/1/24", "Payment", 5000, "Repair", "Vendor", "USD"],
    ["CLM001", "2/15/24", "Payment", 1500, "Medical", "Medical Provider", "USD"],
    ["CLM002", "3/1/24", "Payment", 25000, "Indemnity", "Policyholder", "USD"],
    ["CLM004", "4/1/24", "Payment", 500, "Indemnity", "Policyholder", "USD"],
    ["CLM005", "4/5/24", "Payment", 10000, "Repair", "Vendor", "USD"],
    ["CLM005", "4/8/24", "Expense", 200, "Legal", "Legal Counsel", "USD"]
]

claim_ids = [f"CLM{str(i).zfill(3)}" for i in range(1, 201)]
transaction_types = ["Payment", "Expense"]
payment_categories = ["Repair", "Medical", "Indemnity", "Legal", "Replacement", "Investigation"]
payee_types = ["Vendor", "Medical Provider", "Policyholder", "Legal Counsel", "Investigator"]
currency = "USD"

def random_date(start, end):
    delta = end - start
    random_days = random.randint(0, delta.days)
    return (start + timedelta(days=random_days)).strftime("%-m/%-d/%y")

start_date = datetime.strptime("1/1/24", "%m/%d/%y")
end_date = datetime.strptime("6/30/24", "%m/%d/%y")

rows = seed_rows.copy()
while len(rows) < 5000:
    claim_id = random.choice(claim_ids)
    t_type = random.choice(transaction_types)
    if t_type == "Payment":
        p_cat = random.choice(payment_categories[:-2])
        payee = random.choice(payee_types[:3])
        amt = random.randint(100, 50000)
    else:
        p_cat = random.choice(payment_categories[-2:])
        payee = random.choice(payee_types[3:])
        amt = random.randint(50, 5000)
    t_date = random_date(start_date, end_date)
    rows.append([claim_id, t_date, t_type, amt, p_cat, payee, currency])

with open("claims_payment.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerows(rows)