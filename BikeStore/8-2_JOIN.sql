-- Create a new Schema
--CREATE SCHEMA hr;

-- Create hr tables
--CREATE TABLE hr.candidates
--(
--	id INT PRIMARY KEY IDENTITY(1, 1),
--);

--CREATE TABLE hr.employees
--(
--	id INT PRIMARY KEY IDENTITY(1, 1),
--	fullname VARCHAR(100) NOT NULL,
--);

-- ADD new columns to the table
--ALTER TABLE hr.candidates
--ADD fullname VARCHAR(100) NOT NULL;

--ALTER TABLE hr.employees
--ADD testColumn VARCHAR(100) NOT NULL;

-- DROP COLUMN (remove) from the table
--ALTER TABLE hr.employees
--DROP COLUMN testColumn;

--ALTER TABLE schema.table_name
--DROP COLUMN column_name data_type constraints;

-- INSERT data in the table
--INSERT INTO hr.candidates
--(
--	fullname
--)
--VALUES('John Doe'),
--('Peter Burns'),
--('Peter Druncker'),
--('Jane Burns');


--INSERT INTO hr.employees(fullname)
--VALUES('John Doe'),
--('Peter Burns'),
--('Michael Scott'),
--('Jack Appleseed');

SELECT * FROM hr.candidates
SELECT * FROM hr.employees

/*
	INNER JOIN (AKA: JOIN)
		JOIN is used to combine 2 or more tables, based on common field/column

		The INNER JOIN selects all rows of data that are related to both
		tables using the specified common columns.
*/

-- INNER JOIN - Show what exists in both tables
-- Get the id's and names of the people that exist in both
-- candidate and employee table:
SELECT c.id,
	   c.fullname,
	   e.id,
	   e.fullname
FROM hr.candidates c	-- Table 1
INNER JOIN hr.employees e	-- Table 2
ON c.fullname = e.fullname
-- INNER JOIN <table2> ON table2_relatedColumn = table1_relatedColumn;

/*

RESULT:
		id	fullname	id	fullname
	1	John Doe	1	John Doe
	2	Peter Burns	2	Peter Burns

*/

SELECT TOP 5 * FROM sales.orders
SELECT TOP 5 * FROM sales.customers

-- Show the first name, last name, store_id and order_date for customer_id 100
SELECT c.first_name,
	   c.last_name,
	   o.store_id,
	   o.order_date
FROM sales.customers c
INNER JOIN sales.orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id = 100;

-- List the staff_id, first_name, last_name of each store member and the name of the store they
-- work in
SELECT * FROM sales.staffs
SELECT * FROM sales.stores

SELECT st.staff_id, st.first_name, st.last_name, sr.store_name
FROM sales.staffs st
INNER JOIN sales.stores sr
ON sr.store_id = st.store_id

-- List all the details for the staffs who use the store phone number.
SELECT st.*
FROM sales.staffs st
INNER JOIN sales.stores sr
ON sr.store_id = st.store_id
WHERE sr.phone = st.phone

-- List all candidates and also show if they are employed by bikestores - Same as INNER JOIN
SELECT c.id AS CandidateID,
	   c.fullname AS CandidateFullName,
	   e.id AS EmployeeId,
	   e.fullname AS EmployeeIdFullName
FROM hr.candidates c
LEFT JOIN hr.employees e
ON e.fullname = c.fullname
WHERE e.id IS NOT NULL
 
-- LEFT JOIN - Show all records from the first table and any records in common with the second
-- tables based on the related column.

-- List all candidates and also show if they are employed by bikestores
SELECT c.id AS CandidateID,
	   c.fullname AS CandidateFullName,
	   e.id AS EmployeeId,
	   e.fullname AS EmployeeIdFullName
FROM hr.candidates c
LEFT JOIN hr.employees e
ON e.fullname = c.fullname
WHERE e.id IS NULL

-- List all candidates and also show if they are employed by bikestores - Same as INNER JOIN
SELECT c.id AS CandidateID,
	   c.fullname AS CandidateFullName,
	   e.id AS EmployeeId,
	   e.fullname AS EmployeeIdFullName
FROM hr.candidates c
LEFT JOIN hr.employees e
ON e.fullname = c.fullname

-- List all candidates and also show if they are employed by bikestores
SELECT c.id AS CandidateID,
	   c.fullname AS CandidateFullName,
	   e.id AS EmployeeId,
	   e.fullname AS EmployeeIdFullName
FROM hr.candidates c
LEFT JOIN hr.employees e
ON e.fullname = c.fullname
WHERE e.id IS NOT NULL
