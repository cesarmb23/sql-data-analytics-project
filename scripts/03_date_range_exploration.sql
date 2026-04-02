/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - Identify the earliest and latest dates (boundaries) of key data points.
    - To understand the scope of data and the timespan.

Formula:
	- MIN/MAX[Date Dimension]	

SQL Functions Used:
    - MIN(), MAX(), TIMESTAMPDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
  TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS years_of_sales,
  TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS months_of_sales
FROM gold.fact_sales;

-- Find the youngest and oldest customer based on birthdate

SELECT
  MIN(birth_date) AS older_birthdate,
  TIMESTAMPDIFF(YEAR, MIN(birth_date), CURDATE()) AS oldest_age,
  MAX(birth_date) AS youngest_birthdate,
  TIMESTAMPDIFF(YEAR, MAX(birth_date), CURDATE()) AS youngest_age
FROM gold.dim_customers;
