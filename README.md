# 📊 Employee Attrition & Retention Analytics

![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)

An end-to-end HR People Analytics project investigating workforce turnover across **600 employees** (`employee_attrition_600.xlsx`). Built with a strict, non-overlapping workflow across **Microsoft Excel**, **SQL**, and **Tableau**, this project uncovers baseline attrition rates, departmental hotspots, key turnover drivers, and high-risk employee cohorts.

---

## 🎯 Business Problem & Questions Answered

Leadership wants to understand why employees are leaving, which departments are most affected, and which employee segments face the highest turnover risk so HR can design targeted retention strategies:

1. **Overall Attrition:** What is the overall employee attrition rate?
2. **Departmental Hotspots:** Which department has the highest attrition?
3. **Compensation Impact:** Are employees with lower salaries more likely to leave?
4. **Experience & Tenure:** Does employee experience influence attrition?
5. **Promotion Stagnation:** Are employees leaving because of limited promotions?
6. **Performance Correlation:** Is attrition higher among employees with lower performance ratings?
7. **High-Risk Segments:** Which employee groups have a higher concentrated risk of attrition?

---

## 🛠️ Project Architecture & Tool Division

Each tool handles a distinct layer of the analysis without redundant effort:

| Tool | Scope & Questions Covered | Key Deliverable |
| :--- | :--- | :--- |
| **Microsoft Excel** | **Baseline & Departmental Overview (Q1–Q2)**<br>• Data audit of `Employee_Data` and `Department_Summary`<br>• Formula-driven KPI cards & department attrition breakdown | `Employee_Attrition_Baseline_Excel.xlsx` |
| **SQL** | **Driver & High-Risk Segment Analysis (Q3–Q7)**<br>• Compensation, tenure bands, promotion lag, and performance ratings<br>• Multi-dimensional risk segmentation (`Department` + `Overtime`) | `employee_attrition_analysis.sql` |
| **Tableau** | **Executive & HR Retention Dashboard (Q1–Q7)**<br>• Unified KPI strip and 6 interactive diagnostic charts | `tableau_attrition_dashboard.png` |

---

## 📈 Key Findings (Q1–Q7)

### 1. Baseline & Departmental Attrition *(Excel — Q1 & Q2)*
* **Overall Attrition Rate (Q1):** **21.17%** (**127** employees left out of **600**; **473** remain active).
* **Departmental Hotspots (Q2):**
  * **Customer Support** has the highest attrition rate at **39.81%** (**43** of **108** employees).
  * **Sales** (**22.47%**, `20` of `89`) and **Operations** (**20.24%**, `17` of `84`) rank second and third.
  * **Human Resources** has the lowest attrition rate at **11.76%** (`4` of `34`).

### 2. Turnover Drivers & High-Risk Groups *(SQL — Q3 to Q7)*
* **Salary vs. Attrition (Q3):** Employees who left earned a slightly lower average annual CTC of **6.71 LPA** (**₹55,947**/month) compared to **6.91 LPA** (**₹57,618**/month) for active employees.
* **Experience & Tenure (Q4):** Early-career employees drive the bulk of turnover. Exited staff averaged **2.41 years** of tenure (median **1.69 years**) versus **4.93 years** (median **4.91 years**) for active staff—with the **0–2 Years** tenure band reaching **52.99%** attrition (`71` of `134`).
* **Promotion Stagnation (Q5):** Attrition rises sharply as `Years_Since_Last_Promotion` grows—climbing from **15.22%** at `0` years and **17.22%** at `1` year to **35.71%** at `5` years (`5` of `14`) and **66.67%** at `6` years (`2` of `3`).
* **Performance Rating (Q6):** Attrition is highest among employees rated **Below Expectations** (**24.36%**, `19` of `78`), compared to **Meets Expectations** (**21.49%**, `75` of `349`), **Exceeds Expectations** (**19.15%**, `27` of `141`), and **Outstanding** (**18.75%**, `6` of `32`).
* **Higher-Risk Employee Groups (Q7):** Among cohorts with at least `10` employees, **Customer Support** employees working **Overtime = Yes** experience **40.00%** attrition (`22` of `55`), closely followed by **Customer Support** with **Overtime = No** at **39.62%** (`21` of `53`).

---

## 📁 Repository Structure

```text
employee-attrition-analytics/
├── data/
│   └── employee_attrition_600.xlsx              # Raw dataset (Employee_Data, Department_Summary, Data_Dictionary)
├── excel/
│   └── Employee_Attrition_Baseline_Excel.xlsx   # Baseline KPIs, department summary table & chart
├── sql/
│   └── employee_attrition_analysis.sql          # SQL queries for Q3–Q7 driver & risk segmentation
├── tableau/
│   └── tableau_attrition_dashboard.png          # Executive Tableau dashboard preview
└── README.md
```

---

## 🚀 How to Use This Repository

1. **Excel Baseline:** Open `excel/Employee_Attrition_Baseline_Excel.xlsx` to explore the formula-driven KPI cards, department summary, and cleaned employee records.
2. **SQL Analysis:** Import `Employee_Data` from `data/employee_attrition_600.xlsx` into PostgreSQL, MySQL, SQL Server, or SQLite and execute `sql/employee_attrition_analysis.sql` to reproduce the Q3–Q7 tables.
3. **Tableau Dashboard:** Connect Tableau Desktop to `data/employee_attrition_600.xlsx` (`Employee_Data`) and recreate the KPI strip and six diagnostic visuals shown in `tableau/tableau_attrition_dashboard.png`.

---

## 💡 Strategic Recommendations

* **Stabilize Customer Support (`39.81%` Attrition):** Conduct workload reviews, shift-scheduling audits, and targeted retention check-ins in Customer Support.
* **Strengthen Early-Tenure Onboarding (`0–2 Years`):** Introduce 30-60-90 day onboarding milestones and peer mentorship to reduce the **52.99%** first-two-year exit rate.
* **Address Promotion Bottlenecks:** Establish transparent career progression reviews for employees approaching **3+ years** without a promotion, where attrition rises above **27%–35%**.
