# Data Cleaning & ETL Workflow (Excel + SQL)

## Project Overview

This project demonstrates an end-to-end ETL (Extract, Transform, Load) workflow using Excel and PostgreSQL.

The objective was to clean and transform a real-world dataset and prepare it for analytics and reporting.

---

## Tools & Technologies

- Microsoft Excel
- PostgreSQL
- SQL
- Data Cleaning Techniques
- ETL Workflow Design

---

## Dataset

The dataset used is the **Online Retail Dataset**, which contains transactional data for an ecommerce business.

It includes:

- Orders and invoices
- Product details
- Customer information
- Sales transactions across countries

---

## ETL Process

### 1. Extract
- Imported raw CSV dataset into a PostgreSQL staging table

### 2. Transform (Excel + SQL)
Performed multiple data cleaning steps:

- Removed missing customer IDs
- Filtered out negative quantities (returns)
- Removed invalid pricing values
- Trimmed and standardized text fields
- Created a revenue column

### 3. Load
- Loaded cleaned data into a new SQL table (`retail_clean`)

### 4. Validation
Performed SQL checks to ensure:

- No missing values
- No invalid records
- No duplicate entries
- Accurate revenue calculations

---

## Key Features

- End-to-end ETL pipeline
- Real-world messy dataset
- Data validation and quality checks
- Analytics-ready dataset creation
- SQL-based transformation logic

---
