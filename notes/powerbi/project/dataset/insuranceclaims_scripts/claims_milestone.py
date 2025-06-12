import csv
import random
from datetime import datetime, timedelta

# Milestone stages and typical durations (in days)
milestones = [
    ("Claim Assigned", 0),
    ("Initial Contact Made", 1),
    ("Investigation Complete", lambda: random.randint(10, 40)),
    ("Settlement Offer Made", lambda: random.randint(3, 15)),
    ("Claim Closed", lambda: random.randint(3, 15)),
]

def random_date(start, days_range):
    return start + timedelta(days=random.randint(0, days_range))

def generate_claim_id(idx):
    return f"CLM{idx:04d}"

def generate_rows(num_claims=1000):
    rows = []
    base_date = datetime(2024, 1, 1)
    claim_counter = 1
    milestone_counter = 0

    while len(rows) < 5000:
        claim_id = generate_claim_id(claim_counter)
        claim_counter += 1
        curr_date = random_date(base_date, 90)
        milestone_dates = [curr_date]
        durations = [0]

        # Generate milestone dates and durations
        for i in range(1, len(milestones)):
            duration = milestones[i][1]
            if callable(duration):
                duration = duration()
            durations.append(duration)
            curr_date = curr_date + timedelta(days=duration)
            milestone_dates.append(curr_date)

        # Randomly decide how many milestones this claim will have (at least 2)
        num_milestones = random.randint(2, len(milestones))
        for i in range(num_milestones):
            rows.append([
                claim_id,
                milestones[i][0],
                milestone_dates[i].strftime("%-m/%-d/%y"),
                durations[i]
            ])
            milestone_counter += 1
            if len(rows) >= 5000:
                break
    return rows

header = ["Claim ID", "Milestone Name", "Milestone Date", "Duration in Stage"]
rows = generate_rows()

with open("claims_milestone.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerows(rows)