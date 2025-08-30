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
