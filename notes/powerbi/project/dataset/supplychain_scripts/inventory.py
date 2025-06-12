import csv
import random
from datetime import datetime, timedelta

header = [
    "Product ID", "Location ID", "Date", "On-Hand Quantity", "Available Quantity",
    "In-Transit Quantity", "Safety Stock Level", "Reorder Point", "Inventory Value", "Inventory Status"
]

products = ["PROD001", "PROD002", "PROD003", "PROD004", "PROD005"]
locations = ["WH001", "WH002", "RTL01", "RTL02"]
statuses = ["Available", "Low", "Out of Stock"]
start_date = datetime(2025, 6, 10)

with open("inventory_5000.csv", "w", newline="") as f:
    writer = csv.writer(f, delimiter=',')
    writer.writerow(header)
    for _ in range(5000):
        prod = random.choice(products)
        loc = random.choice(locations)
        date = (start_date + timedelta(days=random.randint(0, 30))).strftime("%-m/%-d/%y")
        on_hand = random.randint(50, 1000)
        available = max(on_hand - random.randint(0, 100), 0)
        in_transit = random.randint(0, 200)
        safety_stock = random.randint(10, 150)
        reorder_point = random.randint(10, 200)
        inv_value = f"{random.randint(1000, 50000):,}"
        status = "Available" if available > safety_stock else random.choice(statuses)
        writer.writerow([
            prod, loc, date, on_hand, available, in_transit,
            safety_stock, reorder_point, inv_value, status
        ])