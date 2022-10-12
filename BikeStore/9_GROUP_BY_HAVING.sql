SELECT * FROM sales.orders

-- How many orders were shipped on 16th March 2018? Your result should have a column header
-- called 'Total Shipped'
SELECT COUNT(*) AS 'Total Shipped'
FROM sales.orders
WHERE shipped_date = '2018-03-16';

-- Retrieve total number of products in stock:
SELECT SUM(quantity) AS 'Stock on Hand'
FROM production.stocks
WHERE store_id = 1;

-- GROUP BY:
-- Show how many products each store currently has on hand
SELECT store_id, SUM(quantity) AS quantity
FROM production.stocks
WHERE store_id IN(1, 2, 3)
GROUP BY store_id
ORDER BY store_id DESC;

-- Show how many orders the customers wiyh id's 1, 10 and 15 have placed
-- per year.
SELECT customer_id,
YEAR(order_date) AS [Year], -- YEAR() function - extracts the year of a date field
COUNT(order_id) AS Orders -- COUNT() - give number of occurence of each order
FROM sales.orders
WHERE customer_id IN(1, 10, 15) -- get result just from customer_id 1, 10 and 15
GROUP BY customer_id, YEAR(order_date) -- Group the data by customer and by year
ORDER BY customer_id; -- Order results by customer_id so we see all the results in ascending order

-- HAVING: filters data when using GROUP BY
-- Show all customers who have placed at least 2 orders per year
SELECT customer_id,
YEAR(order_date) AS [Year],
COUNT(order_id) AS Orders
FROM sales.orders
GROUP BY customer_id, YEAR(order_date)
HAVING COUNT(order_id) > 1 -- HAVING serves the purpose of the  WHERE clause to filter the data. This is used with GROUP BY
ORDER BY customer_id;

-- Show the maximum and minimum list price for products grouped by category
SELECT category_id,
MAX(list_price) AS Highest,
MIN(list_price) AS Lowest
FROM production.products
GROUP BY category_id
ORDER BY Highest DESC;
