-- Single line commnet.
/*
		Multi-line comments.
*/

/*
		SQL - Structured Query Language

		Syntax:
			keywords:
				SQL keywords are not case-sensitive, 'select' is the same as 'SELECT'.

			Semicolon:
				Some database systems require each SQL statement to end with a semi-colon.

			SQL commands:
				SELECT:				- Extracts data from a database.
				UPDATE:				- Update data in a database.
				DELETE:				- Deletes data from a database. (To be used delicately)
				INSERT INTO:		- Insert data into a database.
				CREATE DATABASE:	- Creates a new database.
				ALTER DATABASE:		- Modifies a database.
				CREATE TABLE:		- Creates tables into a database scheme.
				ALTER TABLE:		- Modify tables in a database scheme.
				DROP TABLE:			- Deletes a table in a database scheme.
				CREATE INDEX:		- Creates an index on a tables.
				DROP INDEX:			- Deletes an index from a table.




				SELECT STATEMENT:
					Database tables are objects that are used to store all the data we need in our database. Data is logivally
					organized in a Row-And-Column format similar to a spreadsheet structure.
					Each row represents a unique record of data in a table.
					Each column represents a field in the records.
*/
				
				-- Retrieve all of the data in the customers table exemple:
				SELECT * FROM sales.customers;

				-- Retrieve the first name and last name of all records in the customer table.
				SELECT first_name, last_name FROM sales.customers;

				-- Retrieve the first name, last name and email of all records in the customer table.
				SELECT first_name, last_name, email FROM sales.customers;

				-- Retrieve the email before the other rows.
				SELECT email, first_name, last_name FROM sales.customers;
