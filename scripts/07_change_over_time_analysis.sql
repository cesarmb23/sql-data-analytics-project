/*
===============================================================================
Change Over Time Analysis (Trends)
===============================================================================
Purpose:
    - Analyze how a measure evolves over time. 
    - Helps track trends, time-series analysis and identify seasonality in your data.
    - To measure growth or decline over specific periods.

Formula:
	- Aggregate[Measure] By [Date Dimension]
	- Ex: SUM(Sales) By Year | AVG(cost) By Month 

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions

SELECT
	YEAR(order_date) AS order_year,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date) DESC;

-- FORMAT()
SELECT
	DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
ORDER BY SUM(sales_amount) DESC;
