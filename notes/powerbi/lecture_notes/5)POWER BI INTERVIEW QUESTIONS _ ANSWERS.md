**Q1. Why we need BI?**

**Answer:**  
We can take data and create the reports at the click of a button.  
Helps in attracting new customers to servicing and monitoring existing customers.  
We can keep Track of information and set our goals accordingly. In general, completely [building an ETL solution](https://www.educba.com/etl-interview-questions/). (Extraction, Transformation, Loading) ultimately helping management to make better decisions.

The efficiency of an Investment (ROI) is very high here.

Making unwanted data into progressive information.

**Q2. How to import the data in Power BI desktop?**

**Answer:**  
This is the basic Power BI Interview Questions asked in an interview. Go to getting data Sources (where we find data sources from a different domain) and select the sources (Excel, CSV, SQL) then Load it. To see the data, click Data view.

To choose the table click on the fields and you can pick a visualization to generate a report.

**Q3. Give the difference between POWER BI vs TABLEAU?**

**Answer:**

| **Feature** | &nbsp;**POWER BI** | **TABLEAU** |
| --- | --- | --- |
| **Data visualization** | Focuses only on modeling and reporting. | Best tool |
| **Data handling** | It drags down slow when handling huge data. | Handles bulk data. |
| **User Interface** | Simple and easy to use. | Use a customized dashboard. |
| **Cost** | Less expensive | Very expensive since it uses data warehousing. |
| **Machine Learning** | It is associated with Microsoft Azure. | It has python Machine learning. |

Let us move to the next Power BI Interview Questions.

**Q4. What are the Building blocks in Power BI?**

**Answer:**  
The building blocks of Power BI are,

1. Visualizations.
2. Data Sets.
3. Reports.
4. Dashboard.
5. Tiles.

**Q5. What is power Pivot and what are the filter writes in Power BI?**

**Answer:**  
Power Pivot is an in-memory component that enables highly compressed data storage. It is used to build a data model, relationship, creating formulas, calculated columns from various resources.

Filters are applicable in:

- Visualization level
- Page Level
- Report Level.

&nbsp;

**Part 2 –Power BI Interview Questions (Advanced)**

Let us now have a look at the advanced Power BI Interview Questions.

**Q6. Give the difference between Power BI Gateway and Data Management Gateway?**

**Answer:**

**Power BI Gateway** – It is a software that works on-premise Network (the data that are not stored in the cloud). It can be used for a single data or multiple data sources (SQL Server, SQL SERVER ANALYSIS SERVICES, other data sources, files, share point). The data are stored encrypted in the gateway-cloud service.

**Data Management Gateway** – This component gets continuous data, expose tables and views.

**Q7. What is the need of the new selection pane in the report Power BI desktop?**

**Answer:**  
It is used to control the tab order between visuals on a page.  
We can combine two or more visual page into one visual group.  
It is used to select data in a visual for highlighting and drill down.

Let us move to the next Power BI Interview Questions.

**Q8. What data sets can be used to create a dashboard with streaming data tiles?**

**Answer:**  
1.Streaming datasets (we need to have data which is cached in a memory before we use streaming data sets).  
2.Hybrid Datasets.

**Q9. What are DAX and the criteria to write DAX Expressions that references Calculated columns and measures?**

**Answer:**  
This is the advanced Power BI Interview Questions asked in an interview. DAX is the language used by Power BI, abbreviated as Data Analysis Expressions. It is a functional Language, the execution flows with function calls. They are structured to work with tables.  
Example of DAX formula

**\=** SUM( FILTER( Values(‘Date\[Year\]’),)))

Execution in DAX starts from inner function and works outside. It includes a variety of Time intelligence functions. There are two types of context:

1. **Row context –** It applies to measures.
2. **Filter context –** Applying filters to calculations.

When referencing a Calculated column, we must include a table name and DAX code automatically has row context for the table in which calculated column is defined.

When referencing a measure, we can optionally include a table name.

&nbsp;**Q10. How Dynamic filtering in Power BI is performed?**

**Answer:**  
Dynamic Filtering in Power BI is done by the following steps:

- Once all the data are set up publish detail report to Power BI.
- Publish it to Group Work Space.
- Create Filter Link (Ex: in url tab(? filter = Salesperson// Employee))
- Create DAX calculated Column.
- Public Overview Report

&nbsp;