/*

	WHERE Clause:
		When we use the SELECT statement to query data in a table, all records are returned.
		Most of the time we will not want all the data to be returned. To get records from
		the table that satisfy certain criteria/conditions, we can use the WHERE clause.

		Syntax:
			SELECT field_list
			FROM table_name
			WHERE search_conditions;

		In the WHERE Clause we specify one or more search condition to filter the record-set
		thatr is returned by the FROM clause.
		The WHERE clause only allows data records that causes the search condition(s) to evaluate
		to true are returned in the record-set.
		The search condition is a logical expression or a combination of logical expressions.
		In SQL we call these a PREDICATE.
		In SQL a PREDICATE may return one of three values, TRUE, FALSE or UNKNOWN.
		The WHERE clause will not return any records if it evaluates to FALSE or UNKNOWN.

*/

-- 1. Finding data using a simple PREDICATE:

-- Retrieve all products that have a category_id of 1.

SELECT * FROM production.products;

SELECT * FROM production.categories;

SELECT * FROM production.products WHERE category_id = 1;

-- Retrieve the first name and last name of all customers from California

SELECT * FROM sales.customers;

/*

	The sequence of this statement runs in, is as follows:
		FROM	- The 'FROM' clause is checked first.
					What table(s) do we need to use to get the result from.

		WHERE	- How does the data need to be filtered.

		SELECT	- What do we need to return.

*/
SELECT first_name, last_name, [state] FROM sales.customers WHERE [state] = 'CA';

SELECT Count(*) FROM sales.customers WHERE [state] = 'CA';
