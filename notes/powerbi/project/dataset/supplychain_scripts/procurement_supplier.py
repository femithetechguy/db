import csv
import random
from datetime import datetime, timedelta

header = [
    "Purchase Order ID", "Product ID", "Supplier ID", "Order Date",
    "Requested Delivery Date (Supplier)", "Actual Delivery Date (Supplier)",
    "Quantity Ordered", "Quantity Received", "Unit Cost", "Total PO Value",
    "Payment Terms", "Supplier Lead Time (Standard)", "Supplier Quality Rating"
]

products = ["PROD001", "PROD002", "PROD003", "PROD004", "PROD005"]
suppliers = ["SUPP001", "SUPP002", "SUPP003", "SUPP004"]
payment_terms = ["Net 30", "Net 45", "Net 60"]
quality_ratings = ["A", "B", "C"]
start_date = datetime(2025, 4, 1)

with open("procurement_supplier_5000.csv", "w", newline="") as f:
    writer = csv.writer(f, delimiter=',')
    writer.writerow(header)
    for i in range(1, 5001):
        po_id = f"PO{str(i).zfill(4)}"
        prod = random.choice(products)
        supp = random.choice(suppliers)
        order_date = start_date + timedelta(days=random.randint(0, 60))
        lead_time = random.randint(10, 20)
        req_delivery = order_date + timedelta(days=lead_time)
        # Actual delivery can be on time, early, or late by up to 3 days
        actual_delivery = req_delivery + timedelta(days=random.randint(-2, 3))
        qty_ordered = random.randint(20, 500)
        qty_received = qty_ordered - random.randint(0, 5)
        unit_cost = random.randint(40, 200)
        total_value = f"{qty_ordered * unit_cost:,}"
        terms = random.choice(payment_terms)
        quality = random.choice(quality_ratings)
        writer.writerow([
            po_id, prod, supp,
            order_date.strftime("%-m/%-d/%y"),
            req_delivery.strftime("%-m/%-d/%y"),
            actual_delivery.strftime("%-m/%-d/%y"),
            qty_ordered, qty_received, unit_cost, total_value,
            terms, lead_time, quality
        ])