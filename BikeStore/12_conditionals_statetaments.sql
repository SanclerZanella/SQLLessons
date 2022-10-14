/*

	CASE statement:
		Similar to switch statement in a programming language, the CASE statement
		allows us to add some if/else logic to our queries.

		Syntax:
			CASE input
				WHEN experssion1 THEN result 1
				WHEN experssion2 THEN result 2
				WHEN experssion3 THEN result 3
				ELSE catch_all_result				-- This is optional
				END

*/

SELECT  * FROM sales.orders;

SELECT DISTINCT order_status FROM sales.orders;

SELECT * FROM sales.order_items;

SELECT		order_status, COUNT(*) AS 'ORDER COUNT'
FROM		sales.orders
GROUP BY	order_status
ORDER BY	order_status;

-- Use a case statement to output meaningful names for each order status
SELECT		CASE order_status
				WHEN 1 THEN 'PENDING'
				WHEN 2 THEN 'PROCESSING'
				WHEN 3 THEN 'SHIPPED'
				WHEN 4 THEN 'DELIVERED'
				ELSE 'REJECTED'
				END AS 'Order Status',
			COUNT(*) AS 'ORDER COUNT'
FROM		sales.orders
GROUP BY	order_status
ORDER BY	order_status;

-- Use an IIF statement to output meaningful names for each status:
-- Syntax: IIF(boolean_expression, true_value, false_value)

-- e.g. SELECT		IIF(10 > 20, 'TRUE', 'FALSE') AS Result;

SELECT		IIF(order_status = 1, 'PENDING',
				IIF(order_status = 2, 'PROCESSING',
					IIF(order_status = 3, 'SHIPPED',
						IIF(order_status = 4, 'DELIVERED', 'REJECTED')
				        )
					)
				) AS 'ORDER STATUS',
			COUNT(*) AS 'ORDER COUNT'
FROM		sales.orders
GROUP BY	order_status
ORDER BY	order_status;


--INSERT INTO sales.orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
--VALUES (260, 10, GETDATE(), GETDATE(), GETDATE(), 1, 2);

-- CASE WITH AGREGATE FUNCTIONS
SELECT SUM(
			CASE
				WHEN order_status = 1
					THEN 1
				ELSE 0
				END
		   ) AS 'PENDNG',
		SUM(
			CASE
				WHEN order_status = 2
					THEN 1
				ELSE 0
				END
		   ) AS 'PROCESSING',
		SUM(
			CASE
				WHEN order_status = 3
					THEN 1
				ELSE 0
				END
		) AS 'SHIPPED',
		SUM(
			CASE
				WHEN order_status = 4
					THEN 1
				ELSE 0
				END
		   ) AS 'DELIVERED',
		SUM(
			CASE
				WHEN order_status IN(1, 2, 3, 4)
					THEN 0
				ELSE 1
				END
		   ) AS 'REJECTED',
		COUNT(*) AS 'TOTAL'
FROM sales.orders;

SELECT (quantity * list_price) FROM sales.order_items
SELECT TOP 10 * FROM sales.orders
SELECT TOP 10 * FROM sales.order_items
-- Using Agregate function inside a case statement
-- SET a priority based on order value

SELECT		o.order_id, SUM(quantity * list_price) AS 'ORDER VALUE',
			CASE
				WHEN SUM(quantity * list_price) <= 500
					THEN 'Very Low Priority'
				WHEN SUM(quantity * list_price) > 500
						AND SUM(quantity * list_price) <= 1000
						THEN 'Low Priority'
				WHEN SUM(quantity * list_price) > 1000
						AND SUM(quantity * list_price) <= 5000
						THEN 'Medium Priority'
				WHEN SUM(quantity * list_price) > 5000
						AND SUM(quantity * list_price) <= 10000
						THEN 'High Priority'
				WHEN SUM(quantity * list_price) > 10000
						THEN 'Very High Priority'
				END AS 'PRIORITY LEVEL'
FROM		sales.orders o
INNER JOIN	sales.order_items i
ON			i.order_id = o.order_id
GROUP BY	o.order_id
