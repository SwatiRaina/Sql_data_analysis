show databases;
use retail_data;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50)
);
CREATE TABLE orderss (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, email, country) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'USA'),
(2, 'Bob Smith', 'bob@example.com', 'Canada'),
(3, 'Carlos Diaz', 'carlos@example.com', 'Mexico');

INSERT INTO orderss (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-11-01', 250.00),
(102, 1, '2024-12-15', 125.50),
(103, 2, '2024-12-05', 300.00),
(104, 3, '2024-12-20', 410.75);

#SELECT,WHERE,ORDER BY, GROUP BY
SELECT c.country, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orderss o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY total_orders DESC;

#JOINS (INNER, LEFT, RIGHT)
SELECT o.order_id, c.name, o.total_amount
FROM orderss o
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id, o.total_amount
FROM customers c
LEFT JOIN orderss o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id, o.total_amount
FROM orderss o
RIGHT JOIN customers c ON c.customer_id = o.customer_id;

#SUBQUERIES
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orderss
    GROUP BY customer_id
    HAVING AVG(total_amount) > (
        SELECT AVG(total_amount) FROM orderss
    )
);

#AGGREGATE FUNCTIONS(SUM)
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orderss o ON c.customer_id = o.customer_id
GROUP BY c.name;

#AGGREGATE FUNCTIONS(AVG)
SELECT c.country, AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orderss o ON c.customer_id = o.customer_id
GROUP BY c.country;

#CREATE VIEWS FOR ANALYSIS
CREATE VIEW customer_spending AS
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orderss o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT * FROM customer_spending;

#OPTIMIZE QUERIES WITH INDEXES
CREATE INDEX idx_customer_id ON orderss(customer_id);
CREATE INDEX idx_country ON customers(country);
SHOW INDEX FROM orderss;




