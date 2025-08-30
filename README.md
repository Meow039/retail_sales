🛍️ Retail Sales Analysis (SQL Project)
📌 Project Overview

Project Title: Retail Sales Analysis
Level: Beginner
Database: p1_retail_db

This project demonstrates SQL skills and techniques commonly used by data analysts to explore, clean, and analyze retail sales data.

The project was built step by step by following this YouTube tutorial
. It is designed as a practical learning project for beginners who want to strengthen their SQL fundamentals while working on a real-world dataset.

🎯 Objectives

Database Setup – Create and populate a retail sales database.

Data Cleaning – Identify and remove records with missing/null values.

Exploratory Data Analysis (EDA) – Understand dataset characteristics.

Business Analysis – Write SQL queries to answer specific business questions and generate insights.

🗂️ Project Structure
1. Database Setup

Created database: p1_retail_db

Created table: retail_sales

CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);

2. Data Exploration & Cleaning

Record Count – Count total records.

Customer Count – Find unique customers.

Category Count – Identify unique product categories.

Null Value Check – Detect and delete records with nulls.

SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

-- Delete null records
DELETE FROM retail_sales
WHERE sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR age IS NULL 
   OR category IS NULL 
   OR quantity IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL;

3. Data Analysis & Business Queries

Key SQL queries used to answer business questions:

Sales on specific date (2022-11-05):

SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';


Clothing sales with quantity ≥ 4 (Nov-2022):

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantity >= 4;


Total sales by category:

SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;


Average age of Beauty category customers:

SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';


High-value transactions (> 1000):

SELECT * 
FROM retail_sales
WHERE total_sale > 1000;


Transactions by gender & category:

SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;


Best selling month each year:

SELECT year, month, avg_sale
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
    FROM retail_sales
    GROUP BY 1,2
) t1
WHERE rank = 1;


Top 5 customers by sales:

SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


Unique customers by category:

SELECT category, COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM retail_sales
GROUP BY category;


Sales by shift (Morning, Afternoon, Evening):

WITH hourly_sale AS (
  SELECT *,
    CASE
      WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
      WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
    END AS shift
  FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

🔎 Findings

Customer Demographics – Sales spread across different age groups & genders.

High-Value Purchases – Some transactions exceeded 1000 in value.

Sales Trends – Certain months show peak sales, helping identify seasonal patterns.

Top Customers – A small group of customers contributes heavily to total sales.

Category Insights – Clothing and Beauty categories are among the most active.

📊 Reports

Sales Summary – Overall sales by category and customer demographics.

Trend Analysis – Monthly and shift-based sales performance.

Customer Insights – Top-spending customers & unique buyers per category.

✅ Conclusion

This project serves as a beginner-friendly SQL portfolio project, covering:
✔ Database setup
✔ Data cleaning
✔ Exploratory data analysis (EDA)
✔ Business-driven SQL queries

The insights derived help understand customer behavior, product performance, and sales trends, making it a great learning exercise for aspiring data analysts.

✨ Prepared by following this YouTube tutorial
 as part of my SQL learning journey.
