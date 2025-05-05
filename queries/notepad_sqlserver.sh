# Login to SQL Server using sqlcmd and execute a query
fttg@Mac db % sqlcmd -S localhost -U sa -P Fttg@powerbi143 

# Connect and execute query in one command
sqlcmd -S localhost -U sa -P Fttg@powerbi143 -Q "
SELECT name AS Username,
       type_desc AS AccountType,
       create_date AS Created,
       modify_date AS LastModified
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G')
ORDER BY type_desc, name;
"

# OR use heredoc in terminal

sqlcmd -S localhost -U sa -P Fttg@powerbi143 << EOF
SELECT name AS Username,
       type_desc AS AccountType,
       create_date AS Created,
       modify_date AS LastModified
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G')
ORDER BY type_desc, name;
GO
EOF

# Note:

# The -Q flag executes the query and exits
# The heredoc approach (<< EOF) allows for multiple queries
# Add GO when using heredoc
# Type codes: 'S' = SQL login, 'U' = Windows login, 'G' = Windows group

-- List all database users and their types
SELECT name AS Username,
       type_desc AS AccountType,
       create_date AS Created,
       modify_date AS LastModified
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G')
ORDER BY type_desc, name;
GO


# For a more detailed view including server-level logins:

-- List server logins with additional details
SELECT 
    sp.name AS LoginName,
    sp.type_desc AS AccountType,
    sp.create_date,
    sp.modify_date,
    LOGINPROPERTY(sp.name, 'PasswordLastSetTime') AS PasswordLastSet
FROM sys.server_principals sp
WHERE sp.type IN ('S', 'U', 'G')
AND sp.name NOT LIKE '##%'
ORDER BY sp.type_desc, sp.name;
GO

# Note:

# Run these queries in your sqlcmd session
# Make sure to press Enter after GO
# You need appropriate permissions to view this information
# Type codes: 'S' = SQL login, 'U' = Windows login, 'G' = Windows group

# EXIT a RUN
# Exit sqlcmd
-- Exit sqlcmd interactive mode
EXIT  
# OR

-- Alternative exit command
QUIT

# OR as a last resort
Control + C


# If you're stuck in a query prompt (numbered lines like 1>, 2>), first:

# Press Enter
# Type GO
# Press Enter again
# Then type EXIT
# For macOS terminal:

# Press Ctrl + C to abort the current command if needed
# Then type EXIT to quit sqlcmd
# You'll return to your regular terminal prompt (fttg@Mac db %)
# Remember to save any important queries before exiting the session.

sqlcmd -S localhost -U sa -P 'Fttg@powerbi143' -Q "SELECT name FROM sys.databases;"