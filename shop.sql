-- Create products table
CREATE TABLE IF NOT EXISTS store.products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(50),
	price INT
);

-- Create orders table
CREATE TABLE IF NOT EXISTS store.orders(
	order_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(50),
	product_id INT,
	quantity INT,
	order_date DATE,
	FOREIGN KEY (product_id) REFERENCES store.products(product_id)
);

-- Insert products
INSERT INTO store.products(product_id,product_name, category, price)
VALUES (1,'Book','Educational',500),
(2,'Ball','Sports',1500),
(3,'Bat','Sports',2000);

-- Insert orders
INSERT INTO store.orders(order_id,customer_name, product_id, quantity, order_date) 
VALUES (1,'Bijen',1,5,'2023-01-09'),
(2,'Prakriti',2,3,'2023-01-09'),
(3,'Babin',1,4,'2023-01-09'),
(4,'Dave',1,8,'2023-01-09');

-- Read
SELECT * FROM store.products;

SELECT * FROM store.orders;

-- Update
UPDATE store.products
SET price = price + 500
WHERE product_id = 1

-- Delete
DELETE FROM store.products WHERE product_name= 'Bat';

--Calculate the total quantity ordered for each product category in the orders table.

SELECT p.category, SUM(o.quantity) AS total_quantity_ordered
FROM store.orders o
JOIN store.products p ON o.product_id = p.product_id
GROUP BY p.category;

--Find categories where the total number of products ordered is greater than 5. 

SELECT p.category, SUM(o.quantity) AS total_quantity_ordered
FROM store.orders o
JOIN store.products p ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity)>5;

