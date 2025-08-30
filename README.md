# Retail Sales SQL Project

## 1. Database Setup

- **Database Creation:** The project starts by creating a database named `project01`.  
- **Table Creation:** A table named `retail_sales` is created to store the sales data.  
  The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.  

```sql
CREATE DATABASE project01;

USE project01;

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,	
    sale_date DATE,	 
    sale_time TIME,	
    customer_id	INT,
    gender	VARCHAR(15),
    age	INT,
    category VARCHAR(15),	
    quantity	INT,
    price_per_unit FLOAT,	
    cogs	FLOAT,
    total_sale FLOAT
);
2. Data Cleaning

Check for missing values:

SELECT * FROM retail_sales WHERE transaction_id IS NULL;
SELECT * FROM retail_sales WHERE sale_date IS NULL;
SELECT * FROM retail_sales WHERE sale_time IS NULL;

SELECT *
FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

Remove missing values:
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;


3. Business Analysis & SQL Queries
Q1. Retrieve all columns for sales made on 2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';



Q2. Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE sale_date BETWEEN '2022-11-01' AND '2022-11-30'
  AND category = 'Clothing'
  AND quantity > 10;


Q3. Calculate the total sales (total_sale) for each category

SELECT 
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;


Q4. Find the average age of customers who purchased items from the 'Beauty' category
SELECT 
    ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';



Q5. Find all transactions where the total_sale is greater than 1000
SELECT * 
FROM retail_sales
WHERE total_sale > 1000;


Q6. Find the total number of transactions made by each gender in each category
SELECT 
    category,
    gender,
    COUNT(transaction_id) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;


Q7. Calculate the average sale for each month and find out the best selling month in each year

SELECT year, month, avg_sales
FROM (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sales,
        RANK() OVER(
            PARTITION BY YEAR(sale_date) 
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) t1
WHERE rank = 1;



Q8. Find the top 5 customers based on the highest total sales
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


Q9. Find the number of unique customers who purchased items from each category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM retail_sales
GROUP BY category;


Q10. Create sales shifts and count the number of orders in each shift

(Morning < 12, Afternoon 12–17, Evening > 17)

SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;


🔎 Findings

👥 Customer Demographics – Sales spread across different age groups & genders.

💰 High-Value Purchases – Some transactions exceeded 1000 in value.

📈 Sales Trends – Certain months show peak sales, helping identify seasonal patterns.

🏆 Top Customers – A small group of customers contributes heavily to total sales.

🎨 Category Insights – Clothing and Beauty categories are among the most active.

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













