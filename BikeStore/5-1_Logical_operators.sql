/*

	Logical Operators:
		
		AND:
			The AND Operator can be used to combine the results of multiple expressions and
			both must be evaluated to true.
			|---------------------------------------------------|
			|			 | TRUE		 | FALSE	| UNKNOWN		|
			|------------|-----------|----------|---------------|
			|TRUE		 | TRUE      | FALSE	| UNKOWN		|
			|FALSE       | FALSE     | FALSE	| FALSE         |
			|UNKNOWN     | UNKOWN    | FALSE	| UNKOWN        |
			|---------------------------------------------------|

			Syntax:
				SELECT field_list FROM table_name WHERE expression AND expression;

		OR:
			The OR Operator can be used to check the results of multiple expressions and
			at least one condition must be evaluated to true.
			|---------------------------------------------------|
			|			 | TRUE		 | FALSE	| UNKNOWN		|
			|------------|-----------|----------|---------------|
			|TRUE		 | TRUE      | TRUE	    | TRUE			|
			|FALSE       | TRUE      | FALSE	| UNKOWN        |
			|UNKNOWN     | TRUE      | UNKOWN	| UNKOWN        |
			|---------------------------------------------------|

			Syntax:
				SELECT field_list FROM table_name WHERE expression OR expression;

		NOT:
			The NOT operator reverses the result.

			Syntax:
				SELECT field_list FROM table_name WHERE state != 'TX';

		IN:
			The IN operator is used to check if a value exist in a list.
			Returns true or false.

			Syntax:
				column_name | experession IN(v1, v2, v3);

*/

SELECT * FROM production.products

-- Retrieve a list of products in category 1 with a list_price greater than 400:
	-- 1. Get the data from the products table.
	-- 2. All data.
	-- 3. Filter by category.
	-- 4. Filter by price.

	SELECT * FROM production.products WHERE category_id = 1 AND list_price > 400;

-- Retrieve a list of products in category 1 with a list_price greater than 400 whose
-- brand_id is 1:

	SELECT * FROM production.products WHERE category_id = 1 AND list_price > 400 AND brand_id = 1;
