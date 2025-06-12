import csv
import random
from datetime import datetime, timedelta

header = [
    "Shipment ID", "Order ID", "Product ID", "Origin Location ID", "Destination Location ID",
    "Carrier ID", "Planned Ship Date", "Actual Ship Date", "Planned Delivery Date", "Actual Delivery Date",
    "Delivery Status", "Quantity Shipped", "Transportation Cost", "Freight Type", "Tracking Number", "Reason for Delay"
]

products = ["PROD001", "PROD002", "PROD003", "PROD004", "PROD005"]
orders = [f"ORD{str(i).zfill(5)}" for i in range(1, 6000)]
origins = ["WH001", "WH002", "WH003"]
destinations = [f"CUST{str(i).zfill(3)}_ADDR" for i in range(101, 201)]
carriers = ["CAR001", "CAR002", "CAR003", "CAR004"]
freight_types = ["Ground", "Air", "LTL", "Rail"]
delivery_statuses = ["Delivered", "Delayed"]
reasons_for_delay = ["N/A", "Weather", "Traffic", "Mechanical", "Customs"]

start_date = datetime(2025, 5, 15)

def random_tracking():
    return "TRK" + "".join([str(random.randint(0, 9)) for _ in range(5)])

with open("logistics_transportation_5000.csv", "w", newline="") as f:
    writer = csv.writer(f, delimiter=',')
    writer.writerow(header)
    for i in range(1, 5001):
        ship_id = f"SHIP{str(i).zfill(4)}"
        order_id = random.choice(orders)
        prod = random.choice(products)
        origin = random.choice(origins)
        dest = random.choice(destinations)
        carrier = random.choice(carriers)
        planned_ship = start_date + timedelta(days=random.randint(0, 30))
        actual_ship = planned_ship + timedelta(days=random.choice([0, 0, 1]))  # Most on time, some 1 day late
        planned_delivery = planned_ship + timedelta(days=random.randint(2, 7))
        # Actual delivery: on time, early, or late
        delivery_shift = random.choices([0, 1, -1, 2], weights=[70, 15, 10, 5])[0]
        actual_delivery = planned_delivery + timedelta(days=delivery_shift)
        status = "Delivered" if delivery_shift <= 0 else "Delayed"
        qty_shipped = random.randint(10, 200)
        trans_cost = random.randint(300, 2000)
        freight = random.choice(freight_types)
        tracking = random_tracking()
        reason = "N/A" if status == "Delivered" else random.choice(reasons_for_delay[1:])
        writer.writerow([
            ship_id, order_id, prod, origin, dest, carrier,
            planned_ship.strftime("%-m/%-d/%y"),
            actual_ship.strftime("%-m/%-d/%y"),
            planned_delivery.strftime("%-m/%-d/%y"),
            actual_delivery.strftime("%-m/%-d/%y"),
            status, qty_shipped, trans_cost, freight, tracking, reason
        ])