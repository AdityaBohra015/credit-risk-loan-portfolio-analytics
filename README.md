# Credit Risk & Loan Portfolio Analytics

## Project Overview

This project analyzes a loan portfolio to understand borrower default patterns and identify factors associated with higher default risk.

Using SQL, Python, and Tableau, the project examines loan purpose, borrower income, loan-to-income ratio, employment history, and credit-related characteristics. The analysis translates these patterns into practical insights that can help lenders focus their risk review efforts.

The project follows an end-to-end data analytics workflow, from data cleaning and exploratory analysis to SQL-based analysis, dashboard development, and business recommendations.

## Business Problem

Lenders need to understand which borrower groups and loan categories experience higher default rates and contribute the most defaults.

The objective of this project is to answer:

- Which loan purposes have the highest default rates?
- Which loan purposes contribute the largest number of defaults?
- How does the loan amount relative to annual income relate to default risk?
- How does employment history relate to default rates across different loan-to-income groups?
- What practical actions could lenders consider based on the observed patterns?

## Dataset

The project uses a loan-risk dataset containing borrower demographics, financial information, loan characteristics, and loan repayment status.

The dataset includes information such as:

- Borrower age and annual income
- Employment length and home ownership
- Loan purpose, amount, and interest rate
- Loan grade and credit history
- Loan-to-income ratio
- Loan default status

### Data Preparation

The original dataset contained 32,581 records and 12 columns.

Data preparation included:

- Identifying and removing duplicate records
- Reviewing invalid and unrealistic values
- Handling missing values in selected columns
- Creating analytical groups for income, employment history, loan amount, and loan-to-income ratio
- Validating the cleaned dataset before analysis

The final cleaned dataset contains **32,411 loan records**.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data preparation and analysis |
| SQL | Aggregation, grouping, and risk analysis |
| MySQL | Database storage and querying |
| Tableau | Interactive visualizations and dashboards |

## Analysis & Dashboards

### 1. Risk Overview

This dashboard provides a high-level view of the loan portfolio.

It includes:

- Total number of loans
- Total number of defaults
- Overall default rate
- Default rates across loan purposes
- Number of defaults by loan purpose

**Key findings:**

- The portfolio contains 32,411 loans.
- A total of 7,089 loans are recorded as defaults.
- The overall default rate is 21.87%.
- Debt consolidation has the highest default rate at 28.68%.
- Medical loans account for the largest number of defaults, with 1,617 defaults.

### 2. Borrower Risk Analysis

This dashboard explores how borrower and loan characteristics relate to default risk.

The analysis includes:

- Default rates across loan grades
- Default rates across income groups
- Default rates across interest-rate bands
- Loan-to-income ratio and employment history analysis

The visualizations help identify patterns across borrower groups and highlight areas that may require closer review.

### 3. Recommendations & Business Impact

The final dashboard presents practical actions based on the observed default patterns.

The recommendations focus on:

- Reviewing repayment capacity when loan amounts are high relative to annual income
- Investigating loan purposes that account for higher default rates or larger default volumes
- Considering employment history alongside income and loan characteristics
- Monitoring default patterns over time to evaluate whether future changes are associated with improvements

These recommendations are intended to support further review and decision-making rather than serve as a standalone lending approval rule.

## Key Insights

- Debt consolidation has the highest observed default rate among the loan purposes analyzed.
- Medical loans contribute the largest number of defaults.
- Higher loan-to-income ratios are associated with substantially higher default rates.
- Borrowers with shorter employment histories generally show higher default rates within comparable loan-to-income groups.
- Default patterns vary across loan grades, income groups, and interest-rate bands.

## Business Recommendations

Based on the analysis, lenders could consider:

1. **Reviewing repayment capacity:** Give closer attention to loans where the loan amount is high relative to annual income.
2. **Investigating loan purpose:** Review the reasons behind higher default rates in debt consolidation and medical loans.
3. **Using multiple borrower indicators:** Consider employment history alongside income and loan characteristics.
4. **Monitoring portfolio risk:** Track default rates and default volumes across borrower groups over time.

## Limitations

- The analysis identifies relationships and patterns; it does not establish causation.
- The dataset is a sample and may not represent the lending market or an actual bank's portfolio.
- Some missing employment-length values were filled during data cleaning.
- Results for small borrower groups should be interpreted cautiously.
- The dataset does not provide sufficient information to calculate actual financial losses, recoveries, or the impact of lending policy changes.

## Conclusion

This project demonstrates how SQL, Python, and Tableau can be used together to analyze loan portfolio data and communicate risk patterns in a business-friendly manner.

The analysis highlights how loan purpose, loan-to-income ratio, and employment history can provide useful context when reviewing borrower default patterns.

The dashboards present the findings in a clear and accessible format, helping stakeholders understand portfolio risk and identify areas for further investigation.

---

**Project Type:** End-to-End Data Analytics  
**Domain:** Credit Risk & Financial Analytics  
**Status:** Completed
