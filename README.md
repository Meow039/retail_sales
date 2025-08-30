# 🛍️ Retail Sales Analysis (SQL Project)

## 📌 Project Overview
**Project Title:** Retail Sales Analysis  
**Level:** Beginner  
**Database:** `p1_retail_db`  

This project demonstrates **SQL skills** and techniques commonly used by data analysts to **explore, clean, and analyze retail sales data**.  

The project was built step by step by following [this YouTube tutorial](https://www.youtube.com/watch?v=ChIQjGBI3AM&t=1558s). It is designed as a **practical learning project** for beginners who want to strengthen their SQL fundamentals while working on a real-world dataset.  

---

## 🎯 Objectives
- ✅ **Database Setup** – Create and populate a retail sales database.  
- ✅ **Data Cleaning** – Identify and remove records with missing/null values.  
- ✅ **Exploratory Data Analysis (EDA)** – Understand dataset characteristics.  
- ✅ **Business Analysis** – Write SQL queries to answer specific business questions and generate insights.  

---

## 🗂️ Project Structure

### 1. Database Setup
```sql
CREATE DATABASE project01;

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
Null Value Check – Detect and delete records with nulls

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



## 3. Business Analysis & SQL Queries


### 1. Retrieve all columns for sales made on `2022-11-05`
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


2. Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
















