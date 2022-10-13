/*

	LIKE:
		LIKE is a logical operator that allows us to determine if a string of
		characters matches a specific pattern. The pattern can consist of characters
		and wildcards

		Wildcards:
			%						- means any string of zero or more characters
			_						- means any single character.
			[List of characters]	- List of characters.
			[char-char]				- Range of characters.
			[^]						- Single character not in a list or range.

*/

SELECT * FROM sales.customers ORDER BY last_name DESC;

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name = 'Willis'
OR last_name = 'Williamson'
OR last_name = 'Williams'
OR last_name = 'William';

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'Will%';

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'William%';

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'William_';		-- Returns all with last name begining with 'William' and ending with 1 more character.

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'll%';		-- Returns all with last name begining with 'll'

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE '%ll';		-- Returns all with last name ending with 'll'

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE '%ll%';		-- Returns all with last name begining and ending or containing with 'll'

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE '%l%l%';	-- Returns all with last containing 2 'l' characters anywhere.

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'B%K';		-- Returns all with last name begining with 'b' and ending with 'k'

SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE last_name LIKE 'Wal_er';	-- Returns all with last name begining with 'Wal', containing 1 more character and ending with 'er'

-- List all customers whose lastname has a 'u' in its second position and ends with 'er'
SELECT *
FROM sales.customers
WHERE last_name LIKE '_u%er';

-- List all customers whose lastname begins with either D or T
SELECT *
FROM sales.customers
WHERE last_name LIKE 'D%' OR last_name LIKE 'T%';

SELECT *
FROM sales.customers
WHERE last_name LIKE '[DT]%';

-- List all customer whose lastname begins with either D or E or F or G or H or I or J

SELECT *
FROM sales.customers
WHERE last_name LIKE '[D-J]%';

-- List all customer whose lastname DOES NOT begins with either D or E or F or G or H or I or J
-- RULES: Cannot use the word NOT

SELECT *
FROM sales.customers
WHERE last_name LIKE '[^D-J]%';

-- List all customers whose lastname DOES NOT begin with A
SELECT *
FROM sales.customers
WHERE last_name LIKE '[B-Z]%';

SELECT *
FROM sales.customers
WHERE last_name NOT LIKE 'A%';

--CREATE TABLE sales.discount(
--								discount_id		int		PRIMARY KEY IDENTITY,
--								discount_name VARCHAR	(255) NOT NULL,
--							)

--INSERT INTO sales.discount(discount_name)
--VALUES('Summer 50% Saving Deal'),
--	  ('Christmas 50EURO OFF Deal'),
--	  ('Easter Eggs For Free Deal');

SELECT * FROM sales.discount

-- Retrieve all discounts with 50% in its name.
--RULES: Use Like

SELECT *
FROM sales.discount
WHERE discount_name LIKE '%50[%]%';

-- Escape Character
SELECT *
FROM sales.discount
WHERE discount_name LIKE '%50!%%' Escape '!';
