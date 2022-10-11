/*

	Aliases:
		We can give a table or column another name / alias using the AS keyword.
		Syntax:
			SELECT field_name AS alias

*/

SELECT TOP 10 first_name, last_name from sales.customers;

SELECT first_name + ' ' + last_name AS [Name] FROM sales.customers;

SELECT first_name + ' ' + last_name
AS 'Full Name'	-- Must enclose the Alias in quotes if it contains space
FROM sales.customers;

SELECT * FROM sales.orders;
SELECT * FROM sales.order_items;
SELECT * FROM sales.customers;

SELECT sales.customers.first_name, sales.customers.last_name, sales.orders.order_status
FROM sales.customers
INNER JOIN sales.orders
ON sales.orders.customer_id = sales.customers.customer_id
WHERE sales.orders.order_id = 1

SELECT c.first_name, c.last_name, o.order_status
FROM sales.customers c
INNER JOIN sales.orders o
ON o.customer_id = c.customer_id
WHERE o.order_id = 1
