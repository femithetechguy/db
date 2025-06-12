import csv
import random

# Sample data for generating rows
adjusters = [
    {"Adjuster ID": "ADJ001", "Adjuster Name": "Alice Smith", "Team/Department": "Auto Claims", "Adjuster Experience Level": "Senior"},
    {"Adjuster ID": "ADJ002", "Adjuster Name": "Bob Johnson", "Team/Department": "Property Claims", "Adjuster Experience Level": "Junior"},
    {"Adjuster ID": "ADJ003", "Adjuster Name": "Charlie Brown", "Team/Department": "Health Claims", "Adjuster Experience Level": "Intermediate"},
    {"Adjuster ID": "ADJ003", "Adjuster Name": "Charlie Brown", "Team/Department": "Workers' Comp", "Adjuster Experience Level": "Intermediate"},
]

header = [
    "Claim ID",
    "Adjuster ID",
    "Adjuster Name",
    "Team/Department",
    "Adjuster Experience Level"
]

def generate_claim_id(idx):
    return f"CLM{idx:04d}"

def random_adjuster():
    return random.choice(adjusters)

with open("claims_adjuster.csv", "w", newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(header)
    # Write the first 6 rows as provided
    writer.writerow(["CLM001", "ADJ001", "Alice Smith", "Auto Claims", "Senior"])
    writer.writerow(["CLM002", "ADJ002", "Bob Johnson", "Property Claims", "Junior"])
    writer.writerow(["CLM003", "ADJ003", "Charlie Brown", "Health Claims", "Intermediate"])
    writer.writerow(["CLM004", "ADJ001", "Alice Smith", "Auto Claims", "Senior"])
    writer.writerow(["CLM005", "ADJ002", "Bob Johnson", "Property Claims", "Junior"])
    writer.writerow(["CLM006", "ADJ003", "Charlie Brown", "Workers' Comp", "Intermediate"])
    # Generate the rest of the rows
    for i in range(7, 5001):
        claim_id = generate_claim_id(i)
        adj = random_adjuster()
        writer.writerow([
            claim_id,
            adj["Adjuster ID"],
            adj["Adjuster Name"],
            adj["Team/Department"],
            adj["Adjuster Experience Level"]
        ])