/*
===============================================================================
Part-to-Whole Analysis (Proportional Analysis)
===============================================================================
Purpose:
    - Analyze how an individual part is performing compared to the overall
	- Allowing us to understand which category has the greatest impact on the business. 

Formula:
	- ([Measure] / Total[Measure]) * 100 By [Dimension]
	- Ex: (Sales / SUM(sales)) * 100 By Category | (Quantity / SUM(Quantity)) * 100 By Country

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- Which categories contribute the most to overall sales?

WITH category_sales AS (
	SELECT
		category,
		SUM(sales_amount) AS total_sales
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY category
)
SELECT
	category,
	total_sales,
	SUM(total_sales) OVER() AS overall_sales,
	CONCAT(ROUND((total_sales / SUM(total_sales) OVER()) * 100,2), '%') AS percentage_of_total 
FROM category_sales
ORDER BY total_sales DESC;
