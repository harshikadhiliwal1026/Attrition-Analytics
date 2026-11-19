-- ============================================================================
-- EMPLOYEE ATTRITION & RETENTION ANALYTICS — SQL QUERIES (Q3 TO Q7)
-- Source Table: Employee_Data (from employee_attrition_600.xlsx)
-- ============================================================================

-- Q3: Salary (Annual CTC & Monthly Income) vs. Attrition
SELECT
    Attrition,
    COUNT(*) AS headcount,
    ROUND(AVG(Annual_CTC_LPA), 2) AS avg_annual_ctc_lpa,
    ROUND(AVG(Monthly_Income_INR), 0) AS avg_monthly_income_inr
FROM Employee_Data
GROUP BY Attrition;

-- Q4: Experience / Tenure Influence on Attrition
SELECT
    CASE
        WHEN Tenure_Years < 2 THEN '0 - 2 Years'
        WHEN Tenure_Years < 5 THEN '2 - 5 Years'
        ELSE '5+ Years'
    END AS tenure_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM Employee_Data
GROUP BY
    CASE
        WHEN Tenure_Years < 2 THEN '0 - 2 Years'
        WHEN Tenure_Years < 5 THEN '2 - 5 Years'
        ELSE '5+ Years'
    END
ORDER BY attrition_rate_pct DESC;

-- Q5: Promotion Stagnation (Years Since Last Promotion)
SELECT
    Years_Since_Last_Promotion,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(AVG(Number_of_Promotions), 2) AS avg_promotions,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM Employee_Data
GROUP BY Years_Since_Last_Promotion
ORDER BY Years_Since_Last_Promotion;

-- Q6: Performance Rating vs. Attrition
SELECT
    Performance_Rating,
    Performance_Score,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM Employee_Data
GROUP BY Performance_Rating, Performance_Score
ORDER BY attrition_rate_pct DESC;

-- Q7: Higher-Risk Employee Groups (Department + Overtime)
SELECT
    Department,
    Overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM Employee_Data
GROUP BY Department, Overtime
HAVING COUNT(*) >= 10
ORDER BY attrition_rate_pct DESC, employees_left DESC;
