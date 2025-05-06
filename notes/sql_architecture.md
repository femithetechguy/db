# SQL Architecture Overview

## 1. Logical Architecture Layers

### Client Layer
- Application/User interface
- Query tools (e.g., SSMS, VS Code)
- Connection handling
- Query submission

### Database Engine Layer
1. **Query Processing**
   - Parser
   - Optimizer
   - Execution plan generator
   - Execution engine

2. **Storage Engine**
   - Buffer management
   - Transaction management
   - Lock management
   - Recovery management

### Storage Layer
- Data files (.mdf)
- Log files (.ldf)
- System databases
- Filegroups

## 2. Key Components

### System Databases
```
master    - Server-level metadata
model     - Template for new databases
msdb      - Jobs and backup info
tempdb    - Temporary objects
```

### Objects Hierarchy
```
Server
└── Database
    └── Schema
        ├── Tables
        ├── Views
        ├── Stored Procedures
        ├── Functions
        └── Triggers
```

### File Structure
````sql
-- Example database files location on Mac (Docker)
/var/opt/mssql/data/DatabaseName.mdf    -- Primary data file
/var/opt/mssql/data/DatabaseName.ldf    -- Transaction log file
````

## 3. Security Architecture
```
Server Login
└── Database User
    └── Schema Permission
        └── Object Permission
```

## 4. Memory Architecture
- Buffer Pool
- Plan Cache
- Memory Grants
- Working Memory

## 5. Process Architecture
```
SQLOS
├── Worker Threads
├── I/O Threads
├── Network Listeners
└── Background Processes
```

To view your database architecture:
````sql
-- View database files
SELECT name, physical_name, type_desc 
FROM sys.master_files 
WHERE database_id = DB_ID();
GO
````