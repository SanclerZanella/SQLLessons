/*

	SUBQUERIES - queries within queries
		Can be used with SELECT, UPDATE, INSERT and DELETE

*/

SELECT TOP 5 * FROM sales.customers;
SELECT TOP 5 * FROM sales.orders;

SELECT * FROM sales.customers WHERE city = 'NEW YORK';
SELECT DISTINCT city FROM sales.customers ORDER BY city;

-- Show what order are for customers in NEW YORK city?
-- Basic way

SELECT *
FROM sales.customers
WHERE city = 'NEW YORK';

SELECT *
FROM sales.orders
WHERE customer_id IN(16, 178, 327, 411, 854, 927, 1016);

-- Using JOIN
SELECT c.first_name,
	   c.last_name,
	   c.city,
	   o.order_id,
	   o.order_date
FROM sales.customers c
INNER JOIN sales.orders o
ON o.customer_id = c.customer_id
WHERE city = 'NEW YORK';

-- Using a subquery
SELECT customer_id, order_id, order_date	-- OUTTER Query - runs last
FROM sales.orders
WHERE customer_id IN
	  (
		SELECT customer_id	-- Inner Query - runs first.
		FROM sales.customers
		WHERE city = 'NEW YORK'
	  );

/*
	Nested Subqueries:
		A nested subquery is a subquery inside a subquery.
		SQL supports up to 32 levels of subqueries.
*/

-- Retrieve the products whose list prices is greater than the average list price of the strider
-- and treck branded bikes.
SELECT * FROM production.brands;
SELECT * FROM production.products;

-- Basic way
SELECT *
FROM production.products
WHERE list_price > 2450.28
ORDER BY list_price;

-- JOIN way
DECLARE @AveragePrice money;
SET @AveragePrice = (
						SELECT AVG(LIST_PRICE) AS AveragePrice
						FROM production.products p
						INNER JOIN production.brands b
						ON b.brand_id = p.brand_id
						WHERE b.brand_name IN('Strider', 'Trek')
					)

--SELECT *
--FROM production.products
--WHERE list_price > @AveragePrice
--ORDER BY list_price

SELECT p.*
FROM production.products p
INNER JOIN production.brands b
ON b.brand_id = p.brand_id
WHERE b.brand_name IN('STRIDER', 'TREK') AND p.list_price > @AveragePrice

-- Subquery way
SELECT *
FROM production.products
WHERE list_price > (
						SELECT AVG(list_price) AS AveragePrice
						FROM production.products
						WHERE brand_id IN (
											SELECT brand_id
											FROM production.brands
											WHERE brand_name IN('STRIDER', 'TREK')
										  )
				   )
