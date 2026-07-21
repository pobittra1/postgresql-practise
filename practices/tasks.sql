-- Active: 1784391000223@@localhost@5432@customer_orders_db

-- create database for customers and orders for task-- customer_orders_db
CREATE DATABASE customer_orders_db;

-- ================================
-- DATABASE: Customers & Orders
-- ================================

-- ========== TABLES ==========

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- ========== INSERT DATA ==========

INSERT INTO
    customers
VALUES (
        1,
        'Rahim',
        'Dhaka',
        '2023-01-10'
    ),
    (
        2,
        'Karim',
        'Chittagong',
        '2023-02-15'
    ),
    (
        3,
        'Ayesha',
        'Dhaka',
        '2023-03-20'
    ),
    (
        4,
        'Nusrat',
        'Khulna',
        '2023-04-05'
    ),
    (
        5,
        'Tanvir',
        'Rajshahi',
        '2023-05-12'
    ),
    (
        6,
        'Sakib',
        'Dhaka',
        '2023-06-18'
    ),
    (
        7,
        'Mim',
        'Sylhet',
        '2023-07-25'
    ),
    (
        8,
        'Jahid',
        'Barisal',
        '2023-08-30'
    ),
    (
        9,
        'Faria',
        'Dhaka',
        '2023-09-14'
    ),
    (
        10,
        'Rafi',
        'Chittagong',
        '2023-10-10'
    );

INSERT INTO
    orders
VALUES (
        101,
        1,
        '2024-01-01',
        500,
        'completed'
    ),
    (
        102,
        1,
        '2024-01-05',
        700,
        'completed'
    ),
    (
        103,
        1,
        '2024-02-01',
        300,
        'pending'
    ),
    (
        104,
        2,
        '2024-01-03',
        400,
        'completed'
    ),
    (
        105,
        2,
        '2024-01-10',
        600,
        'cancelled'
    ),
    (
        106,
        2,
        '2024-02-05',
        800,
        'completed'
    ),
    (
        107,
        3,
        '2024-01-07',
        200,
        'completed'
    ),
    (
        108,
        3,
        '2024-02-10',
        900,
        'completed'
    ),
    (
        109,
        3,
        '2024-02-15',
        1000,
        'completed'
    ),
    (
        110,
        4,
        '2024-01-20',
        150,
        'pending'
    ),
    (
        111,
        4,
        '2024-02-25',
        350,
        'completed'
    ),
    (
        112,
        5,
        '2024-03-01',
        1200,
        'completed'
    ),
    (
        113,
        5,
        '2024-03-10',
        500,
        'completed'
    ),
    (
        114,
        6,
        '2024-01-12',
        400,
        'completed'
    ),
    (
        115,
        6,
        '2024-02-18',
        700,
        'completed'
    ),
    (
        116,
        6,
        '2024-03-20',
        900,
        'completed'
    ),
    (
        117,
        7,
        '2024-01-25',
        300,
        'pending'
    ),
    (
        118,
        7,
        '2024-02-28',
        450,
        'completed'
    ),
    (
        119,
        8,
        '2024-03-05',
        650,
        'completed'
    ),
    (
        120,
        8,
        '2024-03-18',
        850,
        'completed'
    ),
    (
        121,
        9,
        '2024-02-14',
        200,
        'completed'
    ),
    (
        122,
        9,
        '2024-03-22',
        400,
        'cancelled'
    ),
    (
        123,
        10,
        '2024-03-30',
        1000,
        'completed'
    );

-- see customers
SELECT * FROM customers;
-- see orders
SELECT * FROM orders;

-- ================================
-- TASKS + SOLUTIONS
-- ================================

-- Task 1: Total orders per customer
-- 1. FROM: get data from orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: COUNT
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY
    customer_id;

-- Task 2: Total spending per customer
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: SUM
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id;

-- Task 3: Customers with more than 2 orders
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. HAVING: COUNT > 2
-- 4. SELECT: customer_id + count
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(*) > 2;

-- Task 4: Highest order per customer
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: MAX
SELECT customer_id, MAX(total_amount) AS highest_order
FROM orders
GROUP BY
    customer_id;

-- Task 5: Total revenue
-- 1. FROM: orders
-- 2. SELECT: SUM
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- Task 6: Average order amount
-- 1. FROM: orders
-- 2. SELECT: AVG
SELECT AVG(total_amount) AS avg_order FROM orders;

-- Task 7: Orders count by status
-- 1. FROM: orders
-- 2. GROUP BY: status
-- 3. SELECT: COUNT
SELECT status, COUNT(*) AS total_orders FROM orders GROUP BY status;

-- Task 8: Customers spending >1500 / customers who more than spent 1500
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. HAVING: SUM > 1500
-- 4. SELECT: SUM
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    SUM(total_amount) > 1500;

-- Task 9: Latest order per customer
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: MAX(date)
SELECT customer_id, MAX(order_date) AS latest_order
FROM orders
GROUP BY
    customer_id;

-- Task 10: Orders in February
-- 1. FROM: orders
-- 2. WHERE: filter month
-- 3. SELECT: all
SELECT * FROM orders WHERE MONTH (order_date) = 2;

-- Task 11: Top 3 customers by spending
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: SUM
-- 4. ORDER BY: DESC
-- 5. LIMIT: 3
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
ORDER BY total_spent DESC
LIMIT 3;

-- Task 12: Total orders per day
-- 1. FROM: orders
-- 2. GROUP BY: order_date
-- 3. SELECT: COUNT
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY
    order_date;

-- Task 13: Orders + spending per day
-- 1. FROM: get data
-- 2. GROUP BY: order_date
-- 3. SELECT: COUNT + SUM
-- 4. ORDER BY: date
SELECT
    order_date,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    order_date
ORDER BY order_date;

-- Task 14: Customers who ordered in March
-- 1. FROM: orders
-- 2. WHERE: month = 3
-- 3. SELECT: DISTINCT
SELECT DISTINCT customer_id FROM orders WHERE MONTH (order_date) = 3;

-- Task 15: Total orders per month
-- 1. FROM: orders
-- 2. GROUP BY: MONTH
-- 3. SELECT: COUNT
SELECT MONTH (order_date) AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY
    MONTH (order_date);

-- Task 16: Join customers with orders(show name + amount)
-- 1. FROM: customers + orders
-- 2. JOIN: match customer_id
-- 3. SELECT: name + total_amount
SELECT c.name, o.total_amount
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- Task 17: Total spending with names
-- 1. FROM: customers + orders
-- 2. JOIN: customer_id
-- 3. GROUP BY: name
-- 4. SELECT: SUM
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.name;

-- Task 18: Orders per city
-- 1. FROM: customers + orders
-- 2. JOIN: customer_id
-- 3. GROUP BY: city
-- 4. SELECT: COUNT
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.city;

-- Task 19: Avg spending per customer
-- 1. FROM: orders
-- 2. GROUP BY: customer_id
-- 3. SELECT: AVG
SELECT customer_id, AVG(total_amount) AS avg_spent
FROM orders
GROUP BY
    customer_id;

-- Task 20: Customers with no orders
-- 1. FROM: customers
-- 2. LEFT JOIN: orders
-- 3. WHERE: order_id IS NULL
-- 4. SELECT: name
SELECT c.name
FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;