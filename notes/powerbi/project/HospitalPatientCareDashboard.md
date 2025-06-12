# 🏥 Power BI Project: Hospital Patient Care Dashboard

## 🧠 Objective
Create a Power BI dashboard to help hospital administrators and care teams monitor patient flow, treatment efficiency, staff allocation, and overall care quality across different departments and time periods.

---

## 📊 Data Sources
- **Patient Visits:** Visit ID, Patient ID, Admission Date, Discharge Date, Department, Reason for Visit, Outcome
- **Patient Info:** Patient ID, Age, Gender, Insurance Type, Pre-existing Conditions
- **Treatment Records:** Visit ID, Treatment Code, Medication, Cost, Staff Involved
- **Staff Data:** Staff ID, Role, Department, Shifts, Assigned Patients
- **Satisfaction Surveys:** Visit ID, Rating (1-5), Comments, Response Date

---

## 📈 Key Metrics & KPIs
- Average Length of Stay (ALOS)
- Patient Admission & Discharge Trends
- Bed Occupancy Rate
- Readmission Rate (within 30 days)
- Patient Satisfaction Score
- Staff-to-Patient Ratio
- Treatment Costs per Visit
- Common Diagnoses and Conditions

---

## 🛠️ Dashboard Features
- **Interactive Filters:** Filter by department, doctor, diagnosis, time range, or patient demographics
- **Trend Analysis:** Track admissions, discharges, and readmissions over time
- **Department Comparison:** See which departments have higher readmissions or lower satisfaction
- **Resource Allocation View:** Monitor which doctors or nurses are over- or under-utilized
- **Patient Journey Drillthrough:** From high-level stats to a patient's detailed treatment and outcomes

---

## 🧩 Skills Showcased
- Data modeling with star schema (Patients, Visits, Treatments, Staff)
- DAX for ALOS, readmission flag, and rolling averages
- Power Query for merging and cleaning health records
- Visualization design for clarity, with KPI cards, slicers, heatmaps, and line charts
- Bookmark navigation and drillthrough pages

---

## 🧪 Bonus Feature
**Predictive Analytics:** Integrate a logistic regression model (in Python or Excel) to estimate **readmission risk** based on patient history and treatment patterns, and visualize high-risk patients in Power BI.

---

## 🧰 Tools Used
- Power BI Desktop
- Power Query (ETL)
- DAX
- Python/R (for optional predictive modeling)
- SQL Server (optional for data backend)

---

## 💡 Outcome
A modern healthcare analytics dashboard that helps improve operational efficiency, care quality, patient satisfaction, and hospital resource management — crucial for value-based care and compliance reporting.