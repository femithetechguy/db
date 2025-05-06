# SQL Server Triggers Code Explanation

## 1. Schema and Table Setup
```sql
-- Create schema and base tables
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'trigger_schema')
    EXEC('CREATE SCHEMA trigger_schema')

CREATE TABLE trigger_schema.Orders (...)
CREATE TABLE trigger_schema.OrderHistory (...)
```
- Creates a new schema for triggers
- Creates Orders table for main data
- Creates OrderHistory table for audit tracking

## 2. AFTER Trigger
```sql
CREATE OR ALTER TRIGGER trigger_schema.trg_OrdersAudit
ON trigger_schema.Orders
AFTER INSERT, UPDATE, DELETE
```
This trigger:
- Fires after INSERT, UPDATE, or DELETE operations
- Uses special tables `inserted` and `deleted`
- Logs all changes to OrderHistory table
- Tracks which action occurred (INSERT/UPDATE/DELETE)

## 3. INSTEAD OF Trigger
```sql
CREATE OR ALTER TRIGGER trigger_schema.trg_PreventDelete
ON trigger_schema.Orders
INSTEAD OF DELETE
```
This trigger:
- Prevents deletion of orders
- Raises an error if deletion is attempted
- Suggests using status update instead

## 4. Test Operations
```sql
-- Insert test
INSERT INTO trigger_schema.Orders (ProductName, Quantity)
VALUES ('Laptop', 5);

-- Update test
UPDATE trigger_schema.Orders 
SET Quantity = 10;

-- Delete test (will fail)
DELETE FROM trigger_schema.Orders;
```

To view results in VS Code's integrated terminal:
```bash
sqlcmd -S localhost -U sa -P YourPassword -d fttg_db -Q "SELECT * FROM trigger_schema.OrderHistory ORDER BY ModifiedDate DESC;"
```

Expected outcomes:
1. Insert adds new order and audit record
2. Update changes quantity and adds audit record
3. Delete attempt fails with error message