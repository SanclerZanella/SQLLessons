/*

	DISTINCT

	A SELECT DISTINC statement can be used when we want to return distinct values / Remove
	duplicates.

	Syntax:
		SELECT DISTINCT field_name FROM table_name;

*/

-- Single Column statement:
	SELECT * FROM sales.customers WHERE city = 'Albany';

	SELECT [state] FROM sales.customers;

	SELECT DISTINCT [state] FROM sales.customers;
	
	SELECT Count(DISTINCT [state]) FROM sales.customers;

-- Multi Column statement:
	SELECT * FROM sales.customers;

	SELECT DISTINCT Phone FROM sales.customers;

	SELECT DISTINCT City, state FROM sales.customers;

