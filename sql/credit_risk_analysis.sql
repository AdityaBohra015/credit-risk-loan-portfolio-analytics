-- Query 1: Overall default rate
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate_pct
FROM loan_data;


-- Query 2: View first 10 records
SELECT *
FROM loan_data
LIMIT 10;


-- Query 3: Default rate by loan grade
SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate_pct
FROM loan_data
GROUP BY loan_grade
ORDER BY default_rate_pct DESC;

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate_pct,
    ROUND(
        SUM(loan_status = 1) * 100.0 /
        (SELECT SUM(loan_status = 1) FROM loan_data),
        2
    ) AS share_of_total_defaults_pct,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM loan_data
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;

SELECT
    MIN(loan_percent_income) AS min_loan_income_ratio,
    MAX(loan_percent_income) AS max_loan_income_ratio,
    MIN(person_emp_length) AS min_employment_length,
    MAX(person_emp_length) AS max_employment_length
FROM loan_data;

WITH loan_bands AS (
    SELECT
        loan_intent,
        loan_status,
        loan_percent_income,
        person_emp_length,

        CASE
            WHEN loan_percent_income < 0.10 THEN 'Low: 0-10%'
            WHEN loan_percent_income < 0.20 THEN 'Moderate: 10-20%'
            WHEN loan_percent_income < 0.30 THEN 'Elevated: 20-30%'
            WHEN loan_percent_income < 0.40 THEN 'High: 30-40%'
            ELSE 'Very High: 40%+'
        END AS loan_income_band,

        CASE
            WHEN person_emp_length <= 2 THEN 'Early Career: 0-2 Years'
            WHEN person_emp_length <= 5 THEN 'Developing: 3-5 Years'
            WHEN person_emp_length <= 10 THEN 'Established: 6-10 Years'
            ELSE 'Experienced: 10+ Years'
        END AS employment_band

    FROM loan_data
)

SELECT
    loan_intent,
    loan_income_band,
    employment_band,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaulted_loans,

    ROUND(AVG(loan_status) * 100, 2) AS default_rate_pct,

    ROUND(AVG(loan_percent_income) * 100, 2)
        AS avg_loan_income_pct

FROM loan_bands

GROUP BY
    loan_intent,
    loan_income_band,
    employment_band

HAVING COUNT(*) >= 30

ORDER BY
    loan_intent,
    default_rate_pct DESC;
    
    

WITH loan_bands AS (
    SELECT
        loan_status,

        CASE
            WHEN loan_percent_income < 0.10 THEN '1. Below 10%'
            WHEN loan_percent_income < 0.20 THEN '2. 10% to <20%'
            WHEN loan_percent_income < 0.30 THEN '3. 20% to <30%'
            WHEN loan_percent_income < 0.40 THEN '4. 30% to <40%'
            ELSE '5. 40%+'
        END AS loan_income_band,

        CASE
            WHEN person_emp_length <= 2 THEN '1. 0-2 years'
            WHEN person_emp_length <= 5 THEN '2. >2-5 years'
            WHEN person_emp_length <= 10 THEN '3. >5-10 years'
            ELSE '4. >10 years'
        END AS employment_band

    FROM loan_data
)

SELECT
    loan_income_band,
    employment_band,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate_pct

FROM loan_bands

GROUP BY
    loan_income_band,
    employment_band

HAVING COUNT(*) >= 30

ORDER BY
    loan_income_band,
    employment_band;
