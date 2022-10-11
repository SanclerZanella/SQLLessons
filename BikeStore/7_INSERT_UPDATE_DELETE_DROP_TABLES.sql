/*

	Creating Tables

	Syntax:
		CREATE TABLE schema.table_name(
			column_list		data_type		constraints
		)

*/

-- Create a Promotion table in the Sales schema.
-- There should be 5 columns, as follows:
	-- COLUMN-NAME		 DATA-TYPE		 CONSTRAINTS
	-- promotion_id		 INT			 PK, NOT NULL
	-- promotion_name	 VARCHAR(255)	 NOT NULL		 
	-- discount			 DECIMAL(3, 2)	 DEFAULT 0
	-- start_date        DATE()	         NOT NULL
	-- expire_date		 DATE()	         NOT NULL

-- CODE BLOCK START ==========================================================================

--CREATE TABLE sales.promotion (
--	promotion_id int PRIMARY KEY IDENTITY(1, 1),
--	promotion_name VARCHAR(255) NOT NULL,
--	discount DECIMAL(3, 2) default 0,
--	[start_date] DATE NOT NULL,
--	[expire_date] DATE NOT NULL,
--);

SELECT * FROM sales.promotion;

-- CODE BLOCK END ==========================================================================

/*

	INSERT STATEMENTS

	SYNTAX:
		INSERT INTO scheme.table_name(column_list) VALUES(value_list)

*/

-- CODE BLOCK START ==========================================================================

--INSERT INTO sales.promotion(promotion_name, start_date, expire_date)
--VALUES('Halloween Special', '2022-10-11', '2022 NOV 13');

--INSERT INTO sales.promotion(promotion_name, start_date, expire_date)
--VALUES('November Special', '20221011', '3 NOV 2022');

--INSERT INTO sales.promotion(promotion_name, start_date, expire_date, discount)
--VALUES('December Special', '2022-10-11', '2022 NOV 13', 2);

-- Insert a record and show evidence that it has been inserted successfully:
--INSERT INTO sales.promotion(promotion_name, start_date, expire_date)
--OUTPUT inserted.promotion_id, inserted.promotion_name  -- OUTPUT inserted.column_name - returns the new valueof this column
--VALUES('Christmas Special', '2022-11-01', '08 JAN 2023');

--SELECT * FROM sales.promotion;

-- CODE BLOCK END ==========================================================================


/*

	DELETE: Delete data from the table
	Syntax: 
		DELETE FROM scheme.table_name WHERE Condition

*/

-- CODE BLOCK START ==========================================================================

--DELETE FROM sales.promotion;

-- DELETE TOP (50) PERCENT FROM sales.promotion

-- CODE BLOCK END ==========================================================================



-- Turn-off IDENTITY settings if you wish to all a specific promotion_id to be inserted.
-- Syntax: SET IDENTITY_INSERT table_name ON|OFF;

-- Insert a May Madness promotion with promotion_id 1001:

-- CODE BLOCK START ==========================================================================

--SELECT * FROM sales.promotion WHERE promotion_id = 1001;	-- Check if the record already

--SET IDENTITY_INSERT sales.promotion ON;		-- Turn IDENTITY_INSERT ON.

--INSERT INTO sales.promotion(promotion_id, promotion_name, start_date, expire_date, discount)
--values(1001, 'May Madness', '2023-04-30', '05 May 23', .5);

--SET IDENTITY_INSERT sales.promotion OFF;	-- Turn IDENTITY_INSERT OFF.

SELECT * FROM sales.promotion WHERE promotion_id = 1001;	-- Check if the record has been created

-- CODE BLOCK END ==========================================================================


/*

	UPDATE: - Amend existing data in your databases.
	Syntax:
		UPDATE scheme.table_name SET column_name = value WHERE condition

*/

-- We have lots of christmas sweets left over and they will go out of date so lets extend the
-- christmas promotion expiry date to 31st January 2023.

-- CODE BLOCK START ==========================================================================

--UPDATE sales.promotion
--SET expire_date = '2023-01-31'	-- WAS 2023-01-08
--WHERE promotion_name = 'Christmas Special'
--AND expire_date = '2023-01-08'
--AND discount = 0.1;

SELECT * FROM sales.promotion;

-- CODE BLOCK END ==========================================================================

/*

	DROP TABLE
	Syntax: DROP TABLE IF EXISTS scheme.table_name;

*/

-- CODE BLOCK START ==========================================================================

--DROP TABLE IF EXISTS sales.promotion;

-- CODE BLOCK END ==========================================================================
