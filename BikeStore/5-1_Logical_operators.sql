-- Retrieve all products whose brand_id is 1, 2 or 4:
SELECT * FROM production.products WHERE brand_id = 1 OR brand_id = 2 OR brand_id = 4;

-- Retrieve the products whose list_price is less than 200
-- and the products whose list_price is greater than 600:
SELECT * FROM production.products WHERE list_price < 200 OR list_price > 600;

-- Retrieve the products whose list_price is greater than 200
-- and the products whose list_price is less than 600:
SELECT * FROM production.products WHERE list_price > 200 AND list_price < 600;

-- Retrieve the products with brand_id 1, brand_id 2 whose price is greater than 800:
SELECT * FROM production.products
WHERE (brand_id = 1 OR brand_id = 2) AND list_price > 800;

-- Retrieve all products whose model_year is not 2017:
SELECT * FROM production.products WHERE model_year != 2017;
SELECT * FROM production.products WHERE model_year <> 2017;
SELECT * FROM production.products WHERE model_year NOT LIKE 2017;

-- Retrieve all products whose brand_id is 1, 2 or 4 using IN:
SELECT * FROM production.products WHERE brand_id IN(1, 2, 4);

-- Retrieve all products and skip those whose brand_id is 1, 2 or 4 using IN:
SELECT * FROM production.products WHERE brand_id NOT IN(1, 2, 4);

-- Retrieve all products and skip those whose brand_id is 1, 2 or 4 using EXCEPT:
SELECT * FROM production.products
EXCEPT (
			SELECT * FROM production.products  -- Subquery
			WHERE brand_id IN(1, 2, 4)
		);

-- Retrieve all products whose list_price is greater than or equal to 149.99
-- or less than 200.00:
SELECT * FROM production.products WHERE list_price >= 149.99 AND list_price < 200.00;
SELECT * FROM production.products WHERE list_price BETWEEN 149.99 AND 200.00;
