# Common Azure SQL Queries Reference Guide

## 1. Database Performance Monitoring

### Resource Usage
````sql
-- Check current resource usage
SELECT TOP 10
    end_time,
    avg_cpu_percent,
    avg_data_io_percent,
    avg_log_write_percent,
    max_worker_percent
FROM sys.dm_db_resource_stats
ORDER BY end_time DESC;
GO
````

## 2. Query Performance Analysis

### Query Store Information
````sql
-- Get top resource-consuming queries
SELECT 
    qt.query_sql_text,
    qrs.count_executions,
    qrs.avg_duration,
    qrs.avg_cpu_time,
    qrs.avg_logical_io_reads
FROM sys.query_store_query_text qt
JOIN sys.query_store_query q 
    ON qt.query_text_id = q.query_text_id
JOIN sys.query_store_plan qp 
    ON q.query_id = qp.query_id
JOIN sys.query_store_runtime_stats qrs 
    ON qp.plan_id = qrs.plan_id
ORDER BY qrs.avg_cpu_time DESC;
GO
````

## 3. Security Monitoring

### Auditing and Compliance
````sql
-- Check database encryption status
SELECT 
    DB_NAME(database_id) as DatabaseName,
    encryption_state_desc,
    key_algorithm,
    key_length
FROM sys.dm_database_encryption_keys;
GO

-- View firewall rules
SELECT 
    name AS RuleName,
    start_ip_address,
    end_ip_address
FROM sys.firewall_rules;
GO
````

## 4. Elastic Pool Management

### Pool Resource Usage
````sql
-- Monitor elastic pool resource usage
SELECT 
    elastic_pool_name,
    avg_cpu_percent,
    avg_data_io_percent,
    avg_log_write_percent
FROM sys.elastic_pool_resource_stats
WHERE elastic_pool_name = 'YourPoolName'
ORDER BY end_time DESC;
GO
````

## 5. Database Space Usage

### Storage Analysis
````sql
-- Check database size and space usage
SELECT 
    DB_NAME() AS DatabaseName,
    CAST(SUM(size * 8.0 / 1024) AS DECIMAL(10,2)) AS DatabaseSizeMB,
    CAST(SUM(CASE WHEN type_desc = 'LOG' 
        THEN size * 8.0 / 1024 
        ELSE 0 END) AS DECIMAL(10,2)) AS LogSizeMB
FROM sys.database_files;
GO
````

## 6. Connectivity Troubleshooting

### Connection Monitoring
````sql
-- Check active connections
SELECT 
    session_id,
    login_time,
    host_name,
    program_name,
    client_interface_name
FROM sys.dm_exec_sessions 
WHERE is_user_process = 1;
GO
````

To execute these queries in VS Code's Azure Data Studio extension:
1. Install Azure Data Studio
2. Connect to your Azure SQL Database
3. Open a new query window
4. Paste and execute the queries

Or using Azure CLI:
```bash
az sql db query \
  --resource-group myResourceGroup \
  --server myServer \
  --database myDatabase \
  --query "SELECT @@VERSION"
```