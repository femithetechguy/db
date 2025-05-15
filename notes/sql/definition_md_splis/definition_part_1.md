# One-Day SQL Study Plan

**Total Duration:** ~9.5 hours (excluding breaks) 

You can spread this over a weekend or do it in chunks. 

**Hour 1: SQL Basics & RDBMS Concepts (60 min)** 

1.  **Topics:** 
    * A. Introduction 
    * B. What are Relational Databases? 
    * C. RDBMS Benefits and Limitations 
    * D. SQL vs NoSQL 
    * E. Basic SQL Syntax

## Introduction

SQL, which stands for Structured Query Language, is a programming language that is used to communicate with and manage databases. SQL is a standard language for manipulating data held in relational database management systems (RDBMS), or for stream processing in a relational data stream management system (RDSMS).  It was first developed in the 1970s by IBM. 

SQL consists of several components, each serving their own unique purpose in database communication: 

* **Queries:** This is the component that allows you to retrieve data from a database.  The SELECT statement is most commonly used for this purpose. 
* **Data Definition Language (DDL):** It lets you to create, alter, or delete databases and their related objects like tables, views, etc.  Commands include CREATE, ALTER, DROP, and TRUNCATE. 
* **Data Manipulation Language (DML):** It lets you manage data within database objects.  These commands include SELECT, INSERT, UPDATE, and DELETE. 
* **Data Control Language (DCL):** It includes commands like GRANT and REVOKE, which primarily deal with rights, permissions and other control-level management tasks for the database system. 

SQL databases come in a number of forms, such as Oracle Database, Microsoft SQL Server, and MySQL.  Despite their many differences, all SQL databases utilise the same language commands - SQL. 

Learn more about SQL from the following resources: 

## What are Relational Databases?

Relational databases are a type of database management system (DBMS) that stores and provides access to data points that are related to one another.  Based on the relational model introduced by E.F. Codd in 1970, they use a structure that allows data to be organized into tables with rows and columns. 

Key features include: 

* Use of SQL (Structured Query Language) for querying and managing data 
* Support for ACID transactions (Atomicity, Consistency, Isolation, Durability) 
* Enforcement of data integrity through constraints (e.g., primary keys, foreign keys) 
* Ability to establish relationships between tables, enabling complex queries and data retrieval 
* Scalability and support for multi-user environments 

Examples of popular relational database systems include MySQL, PostgreSQL, Oracle, and Microsoft SQL Server.  They are widely used in various applications, from small-scale projects to large enterprise systems, due to their reliability, consistency, and powerful querying capabilities. 

Learn more from the following resources: 

## RDBMS Benefits and Limitations

Here are some of the benefits of using an RDBMS: 

* **Structured Data:** RDBMS allows data storage in a structured way, using rows and columns in tables.  This makes it easy to manipulate the data using SQL (Structured Query Language), ensuring efficient and flexible usage. 
* **ACID Properties:** ACID stands for Atomicity, Consistency, Isolation, and Durability.  These properties ensure reliable and safe data manipulation in a RDBMS, making it suitable for mission-critical applications. 
* **Normalization:** RDBMS supports data normalization, a process that organizes data in a way that reduces data redundancy and improves data integrity. 
* **Scalability:** RDBMSs generally provide good scalability options, allowing for the addition of more storage or computational resources as the data and workload grow. 
* **Data Integrity:** RDBMS provides mechanisms like constraints, primary keys, and foreign keys to enforce data integrity and consistency, ensuring that the data is accurate and reliable. 
* **Security:** RDBMSs offer various security features such as user authentication, access control, and data encryption to protect sensitive data. 

Here are some of the limitations of using an RDBMS: 

* **Complexity:** Setting up and managing an RDBMS can be complex, especially for large applications.  It requires technical knowledge and skills to manage, tune, and optimize the database. 
* **Cost:** RDBMSs can be expensive, both in terms of licensing fees and the computational and storage resources they require. 
* **Fixed Schema:** RDBMS follows a rigid schema for data organization, which means any changes to the schema can be time-consuming and complicated. 
* **Handling of Unstructured Data:** RDBMSs are not suitable for handling unstructured data like multimedia files, social media posts, and sensor data, as their relational structure is optimized for structured data. 
* **⚫Horizontal Scalability:** RDBMSs are not as easily horizontally scalable as NoSQL databases.  Scaling horizontally, which involves adding more machines to the system, can be challenging in terms of 