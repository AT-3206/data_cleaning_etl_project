-- =========================================
-- Data Cleaning & ETL Workflow
-- Dataset: Online Retail
-- =========================================

-- 1. Create staging (raw) table
CREATE TABLE retail_raw (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC,
    customer_id VARCHAR(20),
    country VARCHAR(50)
);

-- 2. Load raw CSV into staging table
COPY retail_raw
FROM '/path/online_retail_raw.csv'
DELIMITER ','
CSV HEADER;


-- =========================================
-- DATA QUALITY CHECKS (RAW DATA)
-- =========================================

-- Total row count
SELECT COUNT(*) AS total_rows FROM retail_raw;

-- Missing customer IDs
SELECT COUNT(*) AS missing_customers
FROM retail_raw
WHERE customer_id IS NULL;

-- Negative quantities (returns)
SELECT COUNT(*) AS negative_quantity_rows
FROM retail_raw
WHERE quantity < 0;

-- Invalid prices
SELECT COUNT(*) AS invalid_price_rows
FROM retail_raw
WHERE unit_price <= 0;

-- Duplicate records
SELECT invoice_no, stock_code, COUNT(*) AS duplicate_count
FROM retail_raw
GROUP BY invoice_no, stock_code
HAVING COUNT(*) > 1;


-- =========================================
-- DATA CLEANING & TRANSFORMATION
-- =========================================

-- Create cleaned table
CREATE TABLE retail_clean AS
SELECT
    invoice_no,
    stock_code,
    TRIM(description) AS description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    (quantity * unit_price) AS revenue
FROM retail_raw
WHERE
    quantity > 0
    AND unit_price > 0
    AND customer_id IS NOT NULL;


-- =========================================
-- VALIDATION CHECKS (CLEAN DATA)
-- =========================================

-- Row count after cleaning
SELECT COUNT(*) AS clean_rows FROM retail_clean;

-- Ensure no missing customer IDs remain
SELECT COUNT(*) AS remaining_null_customers
FROM retail_clean
WHERE customer_id IS NULL;

-- Ensure no negative values remain
SELECT COUNT(*) AS invalid_rows
FROM retail_clean
WHERE quantity <= 0 OR unit_price <= 0;

-- Check duplicates again
SELECT invoice_no, stock_code, COUNT(*) AS duplicate_count
FROM retail_clean
GROUP BY invoice_no, stock_code
HAVING COUNT(*) > 1;

-- Validate revenue calculation
SELECT quantity, unit_price, revenue,
       (quantity * unit_price) AS expected_revenue
FROM retail_clean
LIMIT 10;


-- =========================================
-- ANALYTICS-READY VIEW
-- =========================================

CREATE VIEW country_sales_summary AS
SELECT
    country,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_units
FROM retail_clean
GROUP BY country
ORDER BY total_revenue DESC;


-- =========================================
-- ANALYSIS QUERIES
-- =========================================

-- Top 10 countries by revenue
SELECT country, SUM(revenue) AS revenue
FROM retail_clean
GROUP BY country
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 customers by spending
SELECT customer_id, SUM(revenue) AS total_spent
FROM retail_clean
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly revenue trend
SELECT DATE_TRUNC('month', invoice_date) AS month,
       SUM(revenue) AS revenue
FROM retail_clean
GROUP BY month
ORDER BY month;
