LECT statements to merge data from multiple columns, create custom output formats, or generate dynamic SQL statements. 



### LENGTH
The LENGTH function in SQL returns the number of characters in a string.  It's used to measure the size of text data, which can be helpful for data validation, formatting, or analysis.  In some database systems, LENGTH may count characters differently for multi-byte character sets.  Most SQL dialects support LENGTH, but some may use alternative names like LEN (in SQL Server) or CHAR_LENGTH.  This function is particularly useful for enforcing character limits, splitting strings, or identifying anomalies in string data.  

### SUBSTRING 
SUBSTRING is a SQL function used to extract a portion of a string.  It allows you to specify the starting position and length of the substring you want to extract.  This function is valuable for data manipulation, parsing, and formatting tasks.  The exact syntax may vary slightly between database systems, but the core functionality remains consistent, making it a versatile tool for working with string data in databases.  

### REPLACE
The REPLACE function in SQL is used to substitute all occurrences of a specified substring within a string with a new substring.  It takes three arguments: the original string, the substring to be replaced, and the substring to replace it with.  If the specified substring is found in the original string, REPLACE returns the modified string with all instances of the old substring replaced by the new one.  If the substring is not found, the original string is returned unchanged.  This function is particularly useful for data cleaning tasks, such as correcting typos, standardizing formats, or replacing obsolete data.

### UPPER

UPPER() is a string function in SQL used to convert all characters in a specified string to uppercase.  This function is particularly useful for data normalization, case-insensitive comparisons, or formatting output.  UPPER() typically works on alphabetic characters and leaves non-alphabetic characters unchanged.  It's often used in SELECT statements to display data, in WHERE clauses for case-insensitive searches, or in data manipulation operations.  Most SQL databases also provide a complementary LOWER() function for converting to lowercase.  When working with international character sets, it's important to be aware of potential locale-specific behavior of UPPER().  

### LOWER

The LOWER function in SQL converts all characters in a specified string to lowercase.  It's a string manipulation function that takes a single argument (the input string) and returns the same string with all alphabetic characters converted to their lowercase equivalents.  LOWER is useful for standardizing data, making case-insensitive comparisons, or formatting output.  It doesn't affect non-alphabetic characters or numbers in the string.  LOWER is commonly used in data cleaning, search operations, and ensuring consistent data representation across different systems.  

#### Date & Time: DATE, TIME, TIMESTAMP, DATEADD, DATEPART

### DATE

The DATE data type in SQL is used to store calendar dates (typically in the format YYYY-MM-DD).  It represents a specific day without any time information.  DATE columns are commonly used for storing birthdates, event dates, or any other data that requires only day-level precision.  SQL provides various functions to manipulate and format DATE values, allowing for date arithmetic, extraction of date components, and comparison between dates.  The exact range of valid dates may vary depending on the specific database




### TIME

The TIME data type in SQL is used to store time values, typically in the format of hours, minutes, and seconds.  It's useful for recording specific times of day without date information.  SQL provides various functions for manipulating and comparing TIME values, allowing for time-based calculations and queries.  The exact range and precision of TIME can vary between different database management systems. 

### TIMESTAMP

SQL TIMESTAMP is a data type that allows you to store both date and time.  It is typically used to track updates and changes made to a record, providing a chronological time of happenings.  Depending on the SQL platform, the format and storage size can slightly vary.  For instance, MySQL uses the 'YYYY-MM-DD HH:MI:SS' format and in PostgreSQL, it's stored as a 'YYYY-MM-DD HH:MI:SS' format but it additionally can store microseconds. 

### DATEPART

DATEPART is a useful function in SQL that allows you to extract a specific part of a date or time field.  You can use it to get the year, quarter, month, day of the year, day, week, weekday, hour, minute, second, or millisecond from any date or time expression. 



### DATEADD

DATEADD is an SQL function used to add or subtract a specified time interval to a date or datetime value.  It typically takes three arguments: the interval type (e.g., day, month, year), the number of intervals to add or subt