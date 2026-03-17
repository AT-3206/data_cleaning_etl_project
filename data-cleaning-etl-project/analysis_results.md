# Analysis Results – Data Cleaning & ETL Project

## Overview
This analysis summarizes key insights derived from the cleaned Online Retail dataset after completing the ETL workflow.

---

## Data Cleaning Summary

- Removed records with missing customer IDs
- Removed negative quantities (returns)
- Removed invalid pricing (≤ 0)
- Trimmed and standardized text fields
- Created a derived revenue column

Result: A clean, analytics-ready dataset with improved data quality and consistency.

---

## Key Insights

### 1. Revenue by Country

The dataset shows that a small number of countries contribute the majority of total revenue.

**Insight:**
- Revenue is highly concentrated geographically
- Key markets drive most business performance

**Business Impact:**
- Focus marketing and operations on top-performing countries
- Identify opportunities in underperforming regions

---

### 2. Top Customers

A small percentage of customers generate a disproportionately high amount of revenue.

**Insight:**
- Customer spending follows a Pareto distribution (80/20 rule)

**Business Impact:**
- Prioritize retention strategies for high-value customers
- Develop loyalty or reward programs

---

### 3. Monthly Revenue Trends

Revenue trends show fluctuations across different months.

**Insight:**
- Potential seasonality in customer purchasing behavior

**Business Impact:**
- Align inventory and promotions with high-demand periods
- Plan campaigns during peak months

---

## Data Quality Improvements

| Issue | Resolution |
|------|-----------|
Missing Customer IDs | Removed |
Negative Quantities | Filtered out |
Invalid Prices | Removed |
Duplicate Records | Identified and reduced |
Text Inconsistencies | Cleaned using TRIM |

---

## Conclusion

This project demonstrates how raw, messy data can be transformed into a reliable dataset for analysis through a structured ETL workflow.

The cleaned dataset enables accurate reporting, better decision-making, and improved business insights.

---

