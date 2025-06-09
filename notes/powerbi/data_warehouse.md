# 📚 What is a Data Warehouse?

A **Data Warehouse (DW)** is a centralized system used for **storing**, **processing**, and **analyzing** large volumes of historical data from different sources to support **business intelligence (BI)** and **decision-making**.

---

## 🔑 Key Characteristics of a Data Warehouse

| Feature               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| **Subject-Oriented**   | Organized around key subjects (e.g., sales, finance, customers).            |
| **Integrated**         | Combines data from various sources (e.g., ERP, CRM, Excel).                 |
| **Time-Variant**       | Maintains historical data for trend analysis (e.g., sales over 5 years).    |
| **Non-Volatile**       | Once data is entered, it’s not changed—only added.                          |
| **Optimized for Read** | Designed for complex queries, not frequent updates like transactional systems.|

---

## 🔄 How It Works

1. **Data Sources** (e.g., databases, APIs, files)
2. **ETL Process**:
   - **Extract**: Get data from source systems
   - **Transform**: Clean, format, and organize the data
   - **Load**: Store the data in the warehouse
3. **Storage in DW** (Structured using schemas like Star or Snowflake)
4. **Access via BI Tools** (Power BI, Tableau, SSRS, etc.)

---

## 🏢 Real-World Example

> A retail company wants to track **monthly sales**, **customer behavior**, and **inventory trends**.  
> They pull data from:
> - Their POS (Point of Sale) system  
> - Online store  
> - Inventory software  

All this is consolidated into a **Data Warehouse** where managers can analyze trends using Power BI or Excel dashboards.

---

## 🆚 Data Warehouse vs Database

| Feature           | Data Warehouse                  | Operational Database (OLTP)         |
|------------------|----------------------------------|-------------------------------------|
| **Purpose**       | Analytics, reporting             | Real-time transaction processing     |
| **Data Type**     | Historical, summarized           | Current, detailed                   |
| **Structure**     | Denormalized (Star/Snowflake)    | Highly normalized                   |
| **Performance**   | Optimized for read-heavy queries | Optimized for writes/inserts        |