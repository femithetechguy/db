# SQL Server Terminal Commands Reference Guide
# ==========================================

# Section 1: Basic Connection
# --------------------------
sqlcmd -S localhost -U sa -P 'YourPasswordHere'

# Section 2: Direct Query Execution
# -------------------------------
sqlcmd -S localhost -U sa -P 'YourPasswordHere' -Q "SELECT name FROM sys.databases;"

# Section 3: Script File Execution
# ------------------------------
# Example script execution
sqlcmd -S localhost -U sa -P 'YourPasswordHere' -i init.sql

# Section 4: Example Queries
# ------------------------
sqlcmd -S localhost -U sa -P 'Fttg@powerbi143' -Q "SELECT name FROM sys.databases;"

# Section 5: Quick Reference Commands
# --------------------------------
# Start interactive session
sqlcmd -S localhost -U sa -P 'password'

# Execute single query
sqlcmd -S localhost -U sa -P 'password' -Q "SQL QUERY"

# Execute script file
sqlcmd -S localhost -U sa -P 'password' -i file.sql

# Section 6: Troubleshooting
# -------------------------
# Common Issues:
# - sqlcmd: command not found -> Install using brew install mssql-tools
# - Authentication error -> Check username/password
# - Server not found -> Verify SQL Server is running

# Notes:
# - Use single quotes for passwords with special characters
# - Use GO after SQL batches in interactive mode
# - -Q flag for quick execution and exit
# - -i flag for input file execution

# ----------

# Interactive Query Example
# ------------------------
# Connection command:
sqlcmd -S localhost -U sa -P 'YourPassword'

# Sample query to run in sqlcmd:
SELECT name, database_id
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;
GO

# Notes on Query Execution:
# - Type line by line
# - Execute with GO
# - Semicolons optional
# - Can break at any point
# - Must use GO to execute

# Shell Query Example
# ------------------
# One-line execution:
sqlcmd -S localhost -U sa -P 'YourPassword' -Q "SELECT name, database_id FROM sys.databases WHERE state_desc = 'ONLINE' ORDER BY name;"

# File-based Query Example
# -----------------------
# Contents for query.sql:
SELECT name, database_id
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;

# Execute file command:
sqlcmd -S localhost -U sa -P 'YourPassword' -i query.sql

# Additional Notes:
# - GO not needed in single-query files
# - Better for longer queries
# - Useful for CTEs, joins, subqueriesGood — let’s go deeper! 🔥
You’re asking: “How to run a multiline SQL query?” — especially when using the terminal and sqlcmd.

⸻

🛠️ How to Run a Multiline Query in SQLCMD (Interactive Mode)

When you’re inside sqlcmd, it’s normal to type multiple lines of SQL.

✅ Here’s the rule:
	•	Keep typing lines.
	•	Only end the query with GO when you’re ready to send it for execution.

⸻

✍️ Example:

sqlcmd -S localhost -U sa -P 'YourPassword'

Then inside sqlcmd, type:

SELECT name, database_id
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;
GO

✅ Notes:
	•	You type line by line.
	•	Nothing happens until you type GO.
	•	After GO, SQL Server will execute the whole block.

⸻

🧠 Key Points

Thing	Explanation
No semicolon needed between lines	Semicolon (;) is optional except in some advanced cases
GO sends all previous lines to server	Mandatory to actually execute
You can break at any point	Doesn’t matter where you split lines
SQLCMD won’t run mid-query	Only after GO



⸻

🛠️ How to Run a Multiline Query From Shell (without Interactive Mode)

If you want to run a full multiline query directly from the terminal using -Q, you must use escaped quotes properly.

Example:

sqlcmd -S localhost -U sa -P 'YourPassword' -Q "SELECT name, database_id FROM sys.databases WHERE state_desc = 'ONLINE' ORDER BY name;"

OR for multiline scripts — better to put your query in a .sql file.

Example:
	•	Create a file query.sql:

SELECT name, database_id
FROM sys.databases
WHERE state_desc = 'ONLINE'
ORDER BY name;

	•	Then run:

sqlcmd -S localhost -U sa -P 'YourPassword' -i query.sql

✅ Very clean for longer queries!

⸻

⚡ Quick Summary

Method	How
Interactive (manual typing)	Type lines ➔ Finish with GO
One-liner shell	Use -Q "your query"
Multiline from file	Use -i filename.sql



⸻

🎯 Pro Tip:

If you’re practicing big queries (like with CTEs, joins, or subqueries), it’s easier to write them in .sql files and -i them into sqlcmd.

⸻

🔥 Final Note

You DO NOT need GO inside the .sql file unless you have multiple separate batches.
One normal query = no GO inside.

⸻

Would you like me to show you an example of a bigger multiline query, like a JOIN between two tables, that you can try right now in your sqlcmd? 🚀
👉 Want me to make one? 🎯 (good practice!)