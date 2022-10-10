/*

	Sorting Results:
	
	We can sort the result-set of a query by one or more fields using the ORDER BY caluse.

	The order of the result-set cannot be guaranteed when we use a SELECT statement,
	but we can set the order to overcome this when use ORDER BY.

	Syntax:
		SELECT field_list FROM table_name WHERE condition ORDER BY field_names | expression (ASC/DESC);

	Field_name | expression:
		First you specify the column name or an expression to sort the result-set by.
		If you specify multiple columns, the result-set is sorted by the first column first.
		Then the sorted data is sorted again by the second column specified and so on...

	ASC/DESC
		Ascending is assumed by default if not specified.

*/

SELECT * FROM sales.customers;

SELECT customer_id, first_name, last_name FROM sales.customers;

SELECT first_name, last_name FROM sales.customers;

SELECT last_name, first_name FROM sales.customers;

-- Sort all customers by first name in Ascending order
	SELECT * FROM sales.customers ORDER BY first_name;

-- Sort all customers by first name in Descending order
	SELECT * FROM sales.customers ORDER BY first_name DESC;

-- Sort all customers by city first, and then by first name
	SELECT * FROM sales.customers ORDER BY city, first_name; 

-- Sort all customers by city where city is Amityville
	SELECT * FROM sales.customers WHERE city = 'Amityville' ORDER BY first_name;

-- Sort all customers by city first, and then by first name, city in descending order
	SELECT * FROM sales.customers ORDER BY city DESC, first_name ASC;

-- Retrieve the first_name and last_name of all customers from texas and sort by city ascending
	SELECT first_name, last_name FROM sales.customers WHERE [state] = 'TX' ORDER BY city DESC;

-- Sort a result by expression:
	-- Sort the customer list by length of the first name:
		SELECT first_name, last_name FROM sales.customers ORDER BY LEN(first_name), last_name;

-- Sort by ORDINAL POSITION
	SELECT first_name, last_name FROM sales.customers ORDER BY 1 DESC, 2;
