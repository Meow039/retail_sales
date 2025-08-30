CREATE DATABASE project01;

use project01;
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

SELECT * FROM retail_sales
LIMIT 10;


    

SELECT COUNT(*) FROM retail_sales;

-- Data Cleaning
SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- 
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- Data Exploration

-- Q1. Retrieve all columns for sales made on '2022-11-05'
-- Write your query below:

select * from retail_sales
where sale_date = '2022-11-05';



-- Q2. Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Write your query below:

SELECT * 
FROM retail_sales
WHERE 
  sale_date BETWEEN '2022-11-01' AND '2022-11-30'
  and  category = "Clothing"
  and quantiy >= 4;
  
 SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND  
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'  -- Converts 'sale_date' to a string in 'YYYY-MM-DD' format
    AND
    quantiy >= 4; 
  


-- Q3. Calculate the total sales (total_sale) for each category
-- Write your query below:

select sum(total_sale) as total_Sales , category from retail_sales
group by category;

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;


-- Q4. Find the average age of customers who purchased items from the 'Beauty' category
-- Write your query below:

select round(avg(age)) as avg_age , category from retail_sales
where category = "Beauty"
group by age;


-- Q5. Find all transactions where the total_sale is greater than 1000
-- Write your query below:

 select * from retail_sales
 where total_sale > 1000 ;


-- Q6. Find the total number of transactions (transaction_id) made by each gender in each category
-- Write your query below:

select count(transactions_id) , gender , category from retail_sales
group by gender , category; 


SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1 ; -- Orders the result by the first column in the SELECT list (i.e., 'category')

-- Q7. Calculate the average sale for each month and find the best selling month in each year
-- Write your query below:

 -- Step 1: Calculate average monthly total_sale
   select YEAR(STR_TO_DATE(sale_date, '%Y-%m-%d')) AS sale_year,
  MONTH(STR_TO_DATE(sale_date, '%Y-%m-%d')) AS sale_month,
  AVG(total_sale) AS avg_monthly_sale
FROM retail_sales
GROUP BY sale_year, sale_month
ORDER BY sale_year, avg_monthly_sale DESC;

SELECT 
  year,
  month,
  avg_sales 
FROM (
  SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sales,
    RANK() OVER (
      PARTITION BY YEAR(sale_date)
      ORDER BY avg_sales DESC
    ) AS rank
  FROM retail_sales
  GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1 
WHERE rank = 1;

-- Q8. Find the top 5 customers based on the highest total sales
-- Write your query below:

select customer_id , sum(total_sale) as total_Sales from retail_sales 
group by customer_id 
order by total_Sales desc
limit 5 ;



-- Q9. Find the number of unique customers who purchased items from each category
-- Write your query below:

select count(distinct customer_id), category from retail_sales
group by category ;

-- Q10. Create each shift and number of orders (Morning <=12, Afternoon Between 12 & 17, Evening >17)
-- Write your query below:

SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;


