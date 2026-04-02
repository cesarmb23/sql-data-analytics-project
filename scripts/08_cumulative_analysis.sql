/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - Aggregate the data progressively over time.
	- Helps to understand whether our business is growing or declining.

Formula:
	- Aggregate[Cumulative Measure] By [Date Dimension]
	- Ex: Running Total Sales by Year | Moving Avg Sales by Month

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
	TRUNCATE(AVG(avg_price) OVER (ORDER BY order_date), 0) AS moving_avg_price
FROM
(
SELECT
	YEAR(order_date) AS order_date,
	SUM(sales_amount) AS total_sales,
	AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
) t2;
