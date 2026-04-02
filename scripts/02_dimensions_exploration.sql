/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - Identifying the unique values (or categories) in each dimension.
	- Recognizing how data might be grouped or segmented, which is useful for later analysis.

Formula:
	- DISTINCT[Dimension] e.g. Country, Category, Product
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Retrieve a list of unique countries from which customers originate

SELECT DISTINCT country 
FROM gold.dim_customers;

-- Retrieve a list of unique categories, subcategories, and products

SELECT DISTINCT
	category, 
    subcategory, 
    product_name 
FROM gold.dim_products 
ORDER BY 1, 2, 3;
