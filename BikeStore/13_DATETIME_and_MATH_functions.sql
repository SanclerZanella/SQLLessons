-- DATE Functions
SELECT * FROM sales.orders WHERE order_status = 10;

-- Data type: DateTime
SELECT GETDATE() AS Today;  -- Returns the current date and time. YYYY-MM-DD HH:mm:ss.ms

SELECT CONVERT(DATE, GETDATE()) AS 'Convert Today Date'; -- Convert date/time to date. YYYY-MM-DD

SELECT TRY_CONVERT(DATE, GETDATE()) AS 'Try Convert Today Date'; -- Another method to Convert date/time to date. YYYY-MM-DD

SELECT CAST(GETDATE() AS DATE) AS 'Casted Today Date'; -- Another method to Convert date/time to date. YYYY-MM-DD

SELECT DATEADD(DAY, 1, GETDATE()); -- Get tomorrows date
SELECT DATEADD(YEAR, 1, GETDATE()); -- Get the date 1 year from now
SELECT DATEADD(DAY, -1, GETDATE()); -- Get yesterday date
SELECT DATEADD(YEAR, -1, GETDATE()); -- Get the date of the previous year
SELECT DATEADD(YEAR, -1, '01 JAN 2000'); -- Get the date previous year

SELECT DATEDIFF(YEAR, '01 May 1990', GETDATE()) AS 'AGE'; -- Return de difference between 2 dates.
SELECT DATEDIFF(DAY, '01 May 1990', GETDATE()) AS 'DAYS ON EARTH'; -- Return de difference between 2 dates.

-- ABS() Function
SELECT -100, 250, -1, -4, 50;

SELECT ABS(-100), ABS(250), ABS(-1), ABS(-4), ABS(50);

SELECT TOP 10 list_price from production.products;

SELECT CAST(ROUND(235.415, 1) AS MONEY) AS RoundValue;

SELECT CEILING(25.25) AS CeilValue;

SELECT FLOOR(25.25) AS FloorValue;
