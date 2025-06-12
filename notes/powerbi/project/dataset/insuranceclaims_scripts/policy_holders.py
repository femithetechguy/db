import csv
import random

header = [
    "Insured/Policyholder ID",
    "Demographics",
    "Location",
    "Customer Segment",
    "Years as Customer",
    "Number of Policies Held",
    "Previous Claims History"
]

demographics_options = [
    "45, Male, Married",
    "55, Female, Single",
    "30, Female, Married",
    "60, Male, Single",
    "40, Male, Married",
    "50, Female, Married",
    "35, Male, Single",
    "28, Female, Single"
]

locations = [
    "Atlanta, GA, 30303",
    "Macon, GA, 31201",
    "Savannah, GA, 31401",
    "Augusta, GA, 30901",
    "Columbus, GA, 31901",
    "Athens, GA, 30601",
    "Albany, GA, 31701",
    "Roswell, GA, 30075"
]

segments = ["Standard", "High Value", "Commercial", "Small Business"]

def random_claims_history():
    options = [
        "0 prior claims",
        "1 prior claim, $2000 total paid",
        "2 prior claims, $15000 total paid",
        "1 prior claim, $5000 total paid",
        "3 prior claims, $20000 total paid"
    ]
    return random.choice(options)

with open("policy_holders.csv", "w", newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(header)
    # Write the 5 sample rows
    writer.writerow(["INS54321", "45, Male, Married", "Atlanta, GA, 30303", "Standard", 5, 2, "1 prior claim, $2000 total paid"])
    writer.writerow(["INS54322", "55, Female, Single", "Macon, GA, 31201", "High Value", 10, 1, "0 prior claims"])
    writer.writerow(["INS54323", "30, Female, Married", "Savannah, GA, 31401", "Standard", 2, 1, "0 prior claims"])
    writer.writerow(["INS54324", "60, Male, Single", "Augusta, GA, 30901", "Standard", 7, 1, "2 prior claims, $15000 total paid"])
    writer.writerow(["INS54325", "40, Male, Married", "Columbus, GA, 31901", "Standard", 3, 1, "0 prior claims"])
    # Generate 4995 more rows
    for i in range(4995):
        pid = f"INS{54326 + i}"
        demo = random.choice(demographics_options)
        loc = random.choice(locations)
        seg = random.choice(segments)
        years = random.randint(1, 20)
        policies = random.randint(1, 4)
        claims = random_claims_history()
        writer.writerow([pid, demo, loc, seg, years, policies, claims])