/*

	 1	Retrieve all records from the customers table

		Answer: SELECT * FROM sales.customers;

*/

SELECT * FROM sales.customers;


/*

	 2	Without duplicates list the cities in the customers table

		Answer: SELECT DISTINCT city FROM sales.customers;

*/

SELECT DISTINCT city FROM sales.customers;


/*

	 3 	Retrieve the order id, customer id and store id for all orders whose order status is
		2 and the required date is before 30th April 2018 sorted in ascending order of customer
		id.

		Answer: SELECT		order_id, customer_id, store_id, required_date
				FROM		SALES.orders
				WHERE		order_status = 2 AND required_date < '2018-04-30'
				ORDER BY	customer_id;

*/

SELECT order_id, customer_id, store_id, required_date
FROM sales.orders
WHERE order_status = 2 AND required_date < '2018-04-30'
ORDER BY customer_id;


/*

	 4	List the product name, brand id, category id and list price of products with a model year
		of 2018 sorted in ascending order of brand id within category id.

		Answer: SELECT		product_name, brand_id, category_id, list_price
				FROM		production.products
				WHERE		model_year = '2018'
				ORDER BY	3, 2;

*/

SELECT		product_name, brand_id, category_id, list_price
FROM		production.products
WHERE		model_year = '2018'
ORDER BY	3, 2;


/*

	 5	Show the total number of orders placed by staff member 'Marcelene Boyer'.

		Answer: SELECT		COUNT(o.order_id) AS 'No Of Orders Placed By Marcelene Boyer'
				FROM		sales.orders as o
				INNER JOIN	sales.staffs s
				ON			s.staff_id = o.staff_id
				WHERE		s.first_name = 'Marcelene' AND s.last_name = 'Boyer';

*/

SELECT		COUNT(o.order_id) AS 'No Of Orders Placed By Marcelene Boyer'
FROM		sales.orders as o
INNER JOIN	sales.staffs s
ON			s.staff_id = o.staff_id
WHERE		s.first_name = 'Marcelene' AND s.last_name = 'Boyer';


/*

	 6	Show the total value of stock on hand for the store with id 2.

		Answer: SELECT	SUM(quantity) AS 'Stock on Hand of Store 2'
				FROM	production.stocks
				WHERE	store_id = 2;

*/

SELECT		SUM(p.list_price) AS 'Stock Value on Hand of Store 2'
FROM		production.stocks s
INNER JOIN	production.products p
ON			p.product_id = s.product_id
WHERE		s.store_id = 2;


/*

	 7	Show the average price for an electric bike.

		Answer: SELECT		AVG(p.list_price) AS 'Average price of Electric Bikes'
				FROM		production.products p
				INNER JOIN	production.categories c
				ON			c.category_id = p.category_id
				WHERE		c.category_name = 'Electric Bikes';

*/

SELECT		AVG(p.list_price) AS 'Average price of Electric Bikes'
FROM		production.products p
INNER JOIN	production.categories c
ON			c.category_id = p.category_id
WHERE		c.category_name = 'Electric Bikes';
