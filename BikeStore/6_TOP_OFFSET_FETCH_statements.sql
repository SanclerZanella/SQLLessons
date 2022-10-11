-- Retrieve all products with brand_id 6:
SELECT * FROM production.products WHERE brand_id = 6;

-- Retrieve all customers from New York that have telephone number listed:
SELECT * FROM sales.customers WHERE [state] = 'NY' AND phone IS NOT NULL;

-- Retrieve the products in order of the most expensive to least expensive:
SELECT * FROM production.products ORDER BY list_price DESC;

--============================================================================================

-- SELECT TOP
-- Retrieve the 10 most expensive products:
SELECT TOP 10 * FROM production.products ORDER BY list_price DESC;

-- Retrieve the 10% most expensive products:
SELECT TOP 10 PERCENT * FROM production.products ORDER BY list_price DESC;

--============================================================================================

-- SELECT TOP WITH TIES
-- Retrieve the product_name and  list_price for 3 most expensive products
-- and include the products with the same price as the the last one:
SELECT TOP 3 WITH TIES product_name, list_price
FROM production.products
ORDER BY list_price DESC;

--============================================================================================

-- OFFSET and FETCH
-- Skipping the first 10 most expensive products, list the product_name and list_price
-- for the next 10 most expensive products:
SELECT product_name, list_price
FROM production.products
ORDER BY list_price DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

