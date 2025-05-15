
# Power BI Interview Questions and Answers

## 🟢 Basic-Level Questions

### 1. What is Power BI?
**Answer:** Power BI is a business analytics service by Microsoft that provides tools for data modeling, visualization, and reporting. It connects to various data sources and helps create interactive dashboards and reports.

### 2. What are the main components of Power BI?
**Answer:**
- Power BI Desktop (report creation)
- Power BI Service (online sharing)
- Power BI Mobile (mobile access)
- Power BI Gateway (connects on-premise data)
- Power BI Report Builder (for paginated reports)
- Power BI Embedded (for developers)

### 3. Difference between Power BI Desktop and Power BI Service?
**Answer:**
- **Desktop:** For building and designing reports (local use)
- **Service:** For publishing, sharing, and collaboration (cloud-based)

### 4. What is DAX?
**Answer:** DAX (Data Analysis Expressions) is a formula language used in Power BI for creating calculated columns, measures, and custom aggregations.

### 5. What is Power Query?
**Answer:** Power Query is a data transformation and preparation tool in Power BI. It helps users extract, transform, and load (ETL) data before modeling.

### 6. What is a measure vs a calculated column?
**Answer:**
- **Measure:** Calculated on the fly based on filters (dynamic).
- **Calculated column:** Stored in the data model (static until refresh).

### 7. What are the different types of filters in Power BI?
**Answer:**
- Visual-level filter
- Page-level filter
- Report-level filter
- Slicers

### 8. What is a dashboard?
**Answer:** A dashboard is a one-page, interactive summary of visuals, typically created in Power BI Service by pinning visuals from one or more reports.

---

## 🟡 Intermediate-Level Questions

### 9. Explain the star and snowflake schema.
**Answer:**
- **Star Schema:** Central fact table with denormalized dimension tables.
- **Snowflake Schema:** Dimension tables are normalized into sub-tables.

### 10. What is Row-Level Security (RLS)?
**Answer:** RLS restricts data access for users based on roles. You define DAX filters on a table and assign users to those roles.

### 11. What is the difference between DirectQuery and Import Mode?
**Answer:**
- **Import:** Loads data into Power BI; fast performance.
- **DirectQuery:** Queries the source in real-time; useful for large data sets but may be slower.

### 12. What is a relationship in Power BI?
**Answer:** A connection between two tables, defined by a common column (key), used to create a data model.

### 13. How do you handle performance issues in Power BI?
**Answer:**
- Optimize DAX measures
- Reduce number of visuals
- Use star schema
- Limit the number of rows and columns
- Aggregate data at the source

### 14. What is a slicer in Power BI?
**Answer:** A slicer is a visual filter that allows users to filter data interactively by categories like date, region, or product.

### 15. How is data refreshed in Power BI?
**Answer:** Through:
- Manual refresh (in Power BI Desktop)
- Scheduled refresh (in Power BI Service)
- Live connection (DirectQuery)

### 16. What is the difference between SUMX and SUM?
**Answer:**
- **SUM:** Adds up a single column.
- **SUMX:** Evaluates a row-by-row expression over a table and sums the result.

---

## 🔴 Advanced-Level Questions

### 17. What is CALCULATE in DAX?
**Answer:** `CALCULATE` modifies the filter context of an expression and is often used to apply custom filters in measures.

### 18. What are context types in DAX?
**Answer:**
- **Row Context:** The current row being evaluated.
- **Filter Context:** Filters applied to the data model, such as slicers and visuals.

### 19. What is ALL() used for in DAX?
**Answer:** `ALL()` removes filters from a column or table. Useful for calculating totals or percentages.

### 20. What is a composite model in Power BI?
**Answer:** A model that combines DirectQuery and Import mode in the same report.

### 21. Can you explain cross filter direction?
**Answer:** Determines how filters flow between related tables. It can be single or both directions.

### 22. What is a drillthrough page?
**Answer:** A page designed to show detailed information when a user clicks on a value in another report page.

### 23. What are bookmarks?
**Answer:** Bookmarks save the current state of a report page (filters, visuals) for storytelling or navigation.

### 24. How would you implement time intelligence in DAX?
**Answer:** Use functions like:
- `TOTALYTD`
- `SAMEPERIODLASTYEAR`
- `DATESMTD`
- `PREVIOUSMONTH`

### 25. How do you handle many-to-many relationships in Power BI?
**Answer:** Use bridge tables, composite models, or relationship cardinality settings.

---

## 💼 Scenario-Based / Real-World Questions

### 26. How would you approach a new Power BI project?
**Answer:**
1. Understand business requirements
2. Identify and connect to data sources
3. Clean and model the data
4. Build visualizations
5. Review with stakeholders
6. Publish and share via Power BI Service

### 27. How do you track KPIs in Power BI?
**Answer:** Use KPI visuals or card visuals with DAX measures that calculate progress against goals.

### 28. How do you secure sensitive financial data in reports?
**Answer:**
- Implement RLS
- Use role-based access
- Share only with authorized users
- Disable export/download if needed

### 29. What would you do if report performance is slow?
**Answer:**
- Review data model (remove unused columns)
- Optimize DAX
- Reduce visuals on a page
- Limit cross-filtering
- Use aggregations or pre-aggregated tables

### 30. How do you test your Power BI reports before sharing?
**Answer:**
- Verify DAX logic
- Check all filters and slicers
- Test visuals on different screen sizes
- Use dummy data for RLS testing
