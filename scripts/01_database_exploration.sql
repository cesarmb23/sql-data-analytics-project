/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- Retrieve a list of all tables in the database

SELECT * 
FROM INFORMATION_SCHEMA.TABLES;

-- Retrieve all columns

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
-- To receive the columns for a specifc table (dim_customers)
WHERE TABLE_NAME = 'dim_customers';
