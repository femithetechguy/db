
# 🏥 Power BI Project: Hospital Patient Care Dashboard

## 🎯 Objective
Build a Power BI dashboard that enables hospital administrators and clinicians to monitor patient flow, department performance, treatment efficiency, and care quality.

---

## 🗂️ Dataset Structure (Star Schema)

### 1. Patient Dimension Table
| Column Name             | Description                             |
|------------------------|-----------------------------------------|
| `PatientID`            | Unique patient identifier               |
| `FullName`             | Full name of the patient                |
| `Gender`               | Male/Female                             |
| `DateOfBirth`          | For age calculations                    |
| `AgeGroup`             | Bucketed ages (e.g., 0–18, 19–35...)    |
| `InsuranceType`        | Private, Medicaid, Medicare, etc.       |
| `PreExistingConditions`| Comma-separated health conditions       |
| `ZipCode`              | For regional analysis                   |

### 2. Visit Fact Table
| Column Name       | Description                                 |
|------------------|---------------------------------------------|
| `VisitID`         | Unique identifier per hospital visit        |
| `PatientID`       | FK to Patient table                         |
| `AdmissionDate`   | Admission timestamp                         |
| `DischargeDate`   | Discharge timestamp                         |
| `LengthOfStay`    | Derived (Discharge - Admission)             |
| `DepartmentID`    | FK to Department table                      |
| `VisitReason`     | Surgery, Emergency, Checkup, etc.           |
| `Outcome`         | Recovered, Transferred, Deceased, etc.      |
| `ReadmissionFlag` | 1 if readmitted within 30 days              |

### 3. Department Dimension Table
| Column Name       | Description              |
|-------------------|--------------------------|
| `DepartmentID`     | Primary Key              |
| `DepartmentName`   | Cardiology, ER, etc.     |
| `Floor`            | Hospital floor location  |

### 4. Treatment Fact Table
| Column Name        | Description                            |
|--------------------|----------------------------------------|
| `TreatmentID`       | Unique treatment record                |
| `VisitID`           | FK to Visit                            |
| `TreatmentCode`     | Medical procedure code (e.g., CPT)     |
| `Medication`        | Drugs prescribed                       |
| `Cost`              | Cost of the treatment                  |
| `StaffID`           | FK to Staff                            |
| `TreatmentDate`     | Date of treatment                      |

### 5. Staff Dimension Table
| Column Name      | Description                |
|------------------|----------------------------|
| `StaffID`        | Unique ID per clinician    |
| `FullName`       | Name of doctor/nurse       |
| `Role`           | Doctor, Nurse, Tech, etc.  |
| `DepartmentID`   | Affiliated department      |
| `EmploymentDate` | Tenure tracking            |

### 6. Satisfaction Survey Fact Table
| Column Name     | Description                         |
|------------------|-------------------------------------|
| `SurveyID`        | Unique survey ID                   |
| `VisitID`         | Associated hospital visit          |
| `Rating`          | Score from 1–5                     |
| `Comment`         | Free text feedback                 |
| `ResponseDate`    | Date survey was submitted          |

---

## 🔁 Data Model Relationships
```
         ┌─────────────┐
         │ Department  │
         └────┬────────┘
              │
┌─────────────▼─────────────┐
│         Visit Fact        │
├──────────┬──────────────┬─┤
│ Patient  │  Treatment   │ │
│  Info    │   Records    │ │
└──────────┴──────────────┘ │
        ▲         ▲          │
     Survey    Staff         │
```

---

## 📊 Dashboard Pages & KPIs

### 1. Executive Summary
- Avg. Length of Stay (ALOS)
- Patient Volume (weekly/monthly)
- Bed Occupancy %
- Readmission Rate
- Net Promoter Score

### 2. Department Performance
- Admissions/discharges by department
- Avg. satisfaction score
- Cost per visit
- Top diagnoses/treatments

### 3. Patient Demographics
- Age/Gender breakdown
- Insurance coverage
- Prevalent conditions

### 4. Readmission Risk Tracker
- Risk flags
- Drill-through to patient journey

### 5. Treatment Cost & Utilization
- Cost by treatment type
- Staff workload and productivity

---

## 🛠️ Implementation Steps

### 1. Data Preparation
- Clean and normalize data (Power Query or SQL)
- Add calculated columns (`LengthOfStay`, `AgeGroup`, etc.)
- Join datasets using foreign keys

### 2. Data Modeling
- Star schema with clear relationships
- Hide unnecessary technical columns

### 3. DAX Measures
```dax
Average Length of Stay = AVERAGE('Visit Fact'[LengthOfStay])

Readmission Rate = 
    DIVIDE(
        CALCULATE(COUNTROWS('Visit Fact'), 'Visit Fact'[ReadmissionFlag] = 1),
        COUNTROWS('Visit Fact')
    )

Satisfaction Score = AVERAGE('Survey Feedback'[Rating])
```

### 4. Visualizations
- KPI cards, slicers, bar/line charts, matrix views
- Drill-through pages (patient → visit → treatment)
- Tooltips and bookmarks

### 5. Advanced Features
- Row-level security (staff views)
- Predictive model integration (optional)
- Export/print view for compliance reports

---

## 🧪 Bonus: Predictive Add-On

**Objective:** Predict readmission risk using logistic regression.

### Inputs:
- Age
- Length of Stay
- Diagnosis
- Pre-existing Conditions
- Visit Reason

### Output:
- Probability of readmission (visualized in Power BI)
- List of high-risk patients for case review

---

## 🧰 Tools Required
- Power BI Desktop
- Power Query
- DAX
- SQL Server (optional)
- Python/R (for predictive model, optional)

---

## ✅ Outcome
A data-driven dashboard that helps hospitals:
- Optimize care delivery
- Improve patient outcomes
- Enhance resource allocation
- Monitor clinical and operational KPIs
