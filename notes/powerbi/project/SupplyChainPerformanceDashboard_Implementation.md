# Datasets for a Supply Chain Performance Dashboard

A comprehensive Supply Chain Performance Dashboard requires data from various stages and systems within your supply chain. The ability to link these datasets using common identifiers (like **Product ID**, **Order ID**, **Location ID**, **Supplier ID**) is crucial for holistic analysis.

---

## 1. Sales & Demand Data

This dataset provides the upstream demand signals that drive the entire supply chain.

- **Product ID**: Unique identifier for each product/SKU.
- **Customer ID**: Unique identifier for the customer.
- **Order ID**: Unique identifier for the sales order.
- **Order Date**: Date the order was placed.
- **Requested Delivery Date**: Date customer requested delivery.
- **Quantity Ordered**: Number of units ordered.
- **Sales Value**: Total value of the order line item.
- **Forecasted Quantity**: Predicted demand for the product (at a specific period).
- **Sales Region/Channel**: (e.g., North America, Online, Retail).

---

## 2. Inventory Data

Crucial for managing stock levels, identifying potential stockouts or overstock, and optimizing working capital.

- **Product ID**
- **Location ID**: (e.g., Warehouse ID, Store ID).
- **Date**: Date of inventory count/snapshot.
- **On-Hand Quantity**: Current physical quantity in stock.
- **Available Quantity**: Quantity available for sale/allocation.
- **In-Transit Quantity**: Quantity currently in shipment between locations.
- **Safety Stock Level**: Designated minimum stock level.
- **Reorder Point**: Quantity level that triggers a new order.
- **Inventory Value**: Monetary value of the inventory.
- **Inventory Status**: (e.g., Available, Damaged, Expired, On Hold).

---

## 3. Procurement & Supplier Data

Essential for managing supplier relationships, procurement costs, and inbound material flow.

- **Purchase Order ID**: Unique identifier for the purchase order.
- **Product ID**
- **Supplier ID**: Unique identifier for the supplier.
- **Order Date**: Date the purchase order was placed.
- **Requested Delivery Date (Supplier)**: Date supplier committed to deliver.
- **Actual Delivery Date (Supplier)**: Date supplier actually delivered.
- **Quantity Ordered**: Number of units ordered from supplier.
- **Quantity Received**: Number of units actually received.
- **Unit Cost**: Cost per unit from the supplier.
- **Total PO Value**: Total value of the purchase order.
- **Payment Terms**: (e.g., Net 30, Net 60).
- **Supplier Lead Time (Standard)**: Expected lead time from supplier.
- **Supplier Quality Rating**: (e.g., from supplier performance evaluations).

---

## 4. Production & Manufacturing Data (for manufacturing companies)

Provides insights into production efficiency, capacity, and bottlenecks.

- **Production Order ID**: Unique identifier for the production run.
- **Product ID (Finished Goods)**
- **Component Product ID**: (for Bill of Materials)
- **Start Date**: Date production began.
- **End Date**: Date production completed.
- **Quantity Produced (Good)**: Number of good units produced.
- **Quantity Produced (Scrap/Defect)**: Number of units that were scrapped or defective.
- **Actual Production Time**: Time taken to complete the production order.
- **Planned Production Time**: Expected time for production.
- **Machine ID/Work Center**: Where production occurred.
- **Labor Hours**: Hours spent on production.
- **Production Cost**: Total cost of production (materials, labor, overhead).

---

## 5. Logistics & Transportation Data

Tracks the movement of goods, delivery performance, and transportation costs.

- **Shipment ID**: Unique identifier for each shipment.
- **Order ID** (linking to sales or purchase orders).
- **Product ID**
- **Origin Location ID**: (e.g., Warehouse ID, Supplier Location).
- **Destination Location ID**: (e.g., Customer Address, Store ID).
- **Carrier ID**: Unique identifier for the transportation carrier.
- **Planned Ship Date**
- **Actual Ship Date**
- **Planned Delivery Date**
- **Actual Delivery Date**
- **Delivery Status**: (e.g., In Transit, Delivered, Delayed, Lost, Damaged).
- **Quantity Shipped**: Number of units in the shipment.
- **Transportation Cost**: Cost of shipping.
- **Freight Type**: (e.g., FTL, LTL, Air, Ocean).
- **Tracking Number**: For external tracking.
- **Reason for Delay**: (if applicable).

---

## 6. Returns & Quality Data

Important for understanding product quality, customer satisfaction, and reverse logistics.

- **Return ID**: Unique identifier for each return.
- **Order ID** (linking to original sales order).
- **Product ID**
- **Return Date**: Date the product was returned.
- **Return Reason**: (e.g., Damaged, Wrong Item, Customer Changed Mind, Defective).
- **Quantity Returned**: Number of units returned.
- **Resolution**: (e.g., Refund, Replacement, Repair).
- **Quality Issue Type**: (e.g., Manufacturing Defect, Shipping Damage).
- **Cost of Return**: (e.g., shipping cost, restocking fee).

---

## 7. Master Data (Reference Data)

These are static or slowly changing datasets that provide context for your transactional data.

### Product Master Data

- **Product ID**
- **Product Name/Description**
- **Product Category/Subcategory**
- **Unit of Measure (UOM)**
- **Weight/Volume**
- **SKU Status**: (e.g., Active, Discontinued).

### Location Master Data

- **Location ID**
- **Location Type**: (e.g., Warehouse, Distribution Center, Store, Manufacturing Plant).
- **Address**: City, State, Zip Code, Country.
- **Capacity**: (e.g., storage capacity for warehouses).

### Supplier Master Data

- **Supplier ID**
- **Supplier Name**
- **Supplier Contact Information**
- **Supplier Category**: (e.g., Raw Material, Component, Logistics).

### Customer Master Data

- **Customer ID**
- **Customer Name**
- **Customer Address**
- **Customer Type/Segment**

### Carrier Master Data

- **Carrier ID**
- **Carrier Name**
- **Service Level Agreements (SLAs)**

---

## Key Considerations for Your Dashboard

- **Data Integration**: Your ability to link these diverse datasets is paramount. A robust data warehousing solution is often required.
- **Granularity vs. Aggregation**: Decide at what level of detail you need the data. Some dashboards might need daily transactional data, while others benefit from weekly or monthly aggregates.
- **Data Latency**: How fresh does your data need to be? Real-time, daily, or weekly updates?
- **Data Quality**: Inaccurate or incomplete data will lead to misleading insights. Implement strong data governance practices.
- **Key Performance Indicators (KPIs)**: Define your supply chain KPIs first (e.g., On-Time Delivery, Inventory Turns, Perfect Order Rate, Lead Time, Carrying Cost). This will guide which data points are essential.
- **Source Systems**: Identify the systems where this data resides (e.g., ERP, WMS, TMS, CRM, MES, Forecasting software).
- **Security & Access**: Ensure proper controls are in place for sensitive data.

---