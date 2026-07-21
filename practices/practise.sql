-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);
-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments (department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Inserting sample data into the departments table
INSERT INTO
    departments (department_name)
VALUES ('HR'),
    ('Marketing'),
    ('Finance'),
    ('IT'),
    ('Sales'),
    ('Engineering'),
    ('Customer Support'),
    ('Administration'),
    ('Research'),
    ('Quality Assurance');

-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        1,
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        2,
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        3,
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        4,
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        5,
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        6,
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        7,
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        8,
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        9,
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        10,
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        1,
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        2,
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        3,
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        4,
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        5,
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        6,
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        7,
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        8,
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        9,
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        10,
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        1,
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        2,
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        3,
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        4,
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        5,
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        6,
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        7,
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        8,
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        9,
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        10,
        70000.25,
        '2021-11-20'
    );

--see departments
SELECT * FROM departments;
--see employes
SELECT * FROM employees;

-- task 1. Inner join to retrive employee and department information.
SELECT *
FROM employees AS e
    INNER JOIN departments AS d ON e.department_id = d.department_id;
-- alternative way
SELECT * FROM employees INNER JOIN departments USING (department_id);
-- task 2. show department name with average salary
SELECT
    department_name,
    ROUND(AVG(salary)) AS department_avg_salary
FROM employees
    INNER JOIN departments USING (department_id)
GROUP BY
    department_name;

--task 3. count employees in each department
SELECT
    department_name,
    COUNT(employee_id) AS "each_department_employees"
FROM employees
    INNER JOIN departments USING (department_id)
GROUP BY
    department_name;

-- task 4. find the department name with the highest average salary.
SELECT MAX(average_salary_of_each_dept)
FROM (
        -- make temporary table then in subquery get max value
        SELECT
            department_name, AVG(salary) AS "average_salary_of_each_dept"
        FROM employees
            INNER JOIN departments USING (department_id)
        GROUP BY
            department_name
    ) AS dept_salary;

-- get max avg salary with department_name
SELECT
    department_name,
    AVG(salary) AS average_salary
FROM employees
    INNER JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY average_salary DESC
LIMIT 1;

-- get max avg salary , department_name and department_id
SELECT
    department_id,
    department_name,
    AVG(salary) AS average_salary
FROM employees
    INNER JOIN departments USING (department_id)
GROUP BY
    department_id,
    department_name
ORDER BY average_salary DESC
LIMIT 1;

-- task 5. count employees hired each year
SELECT EXTRACT(
        YEAR
        FROM hire_date
    ) AS hired_year, COUNT(*) AS hired_employees
FROM employees
GROUP BY
    hired_year;

-- ---------practise more---------------
-- create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

-- see orders
SELECT * FROM orders;

-- Task 6. Find customers who have placed more than 2 orders and calculate the total amount spent by each of these customers.
-- -----For this example
-- 1. FROM: get data from orders table
-- 2. GROUP BY: group rows by customer_id
-- 3. HAVING: keep only customers with > 2 orders
-- 4. SELECT: calculate total_orders & total_spent
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    sum(total_amount) as total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(*) > 2;
;

-- Task 7. Find the total amount of orders placed each month in the year 2022.

-- -------For this Example
-- 1. FROM: get data from table
-- 2. WHERE: filter only 2022 data
-- 3. GROUP BY: group by month
-- 4. SELECT: calculate month & total amount
-- 5. ORDER BY: sort result by month
SELECT
    EXTRACT(
        MONTH
        FROM order_date
    ) AS order_month_of_2022,
    SUM(total_amount) AS total_spent
FROM orders
WHERE
    EXTRACT(
        YEAR
        FROM order_date
    ) = 2022
GROUP BY
    order_month_of_2022;

--------------------------------------------------------------------------------
_ --------------------------------------------------------------------------------
-- ---------Generate 10 problems From gpt and solve here-----------------
-- ---------------------------------------------------------------------------++

-- Task 1. Find total number of orders per customer
-- 1. FROM: get data from orders table
-- 2. GROUP BY: group rows by customer_id
-- 3. SELECT: count total orders
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY
    customer_id;

-- Task 2. Find total amount spent by each customer
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. SELECT: sum total_amount
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id;

-- Task 3. Find customers who spent more than 400
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. HAVING: filter sum > 400
-- 4. SELECT: show result
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    SUM(total_amount) > 400;

-- Task 4. Find total sales per month in 2022
-- 1. FROM: get data
-- 2. WHERE: filter year = 2022
-- 3. GROUP BY: month
-- 4. SELECT: sum total_amount
-- 5. ORDER BY: month
SELECT EXTRACT(
        MONTH
        FROM order_date
    ) AS month, SUM(total_amount) AS total_sales
FROM orders
WHERE
    EXTRACT(
        YEAR
        FROM order_date
    ) = 2022
GROUP BY
    month
ORDER BY month;

-- Task 5. Find maximum order amount per customer
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. SELECT: MAX(total_amount)
SELECT customer_id, MAX(total_amount) AS max_order
FROM orders
GROUP BY
    customer_id;

-- Task 6. Find average order amount per customer
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. SELECT: AVG(total_amount)
SELECT customer_id, AVG(total_amount) AS avg_order
FROM orders
GROUP BY
    customer_id;

-- Task 7. Find latest order for each customer
-- 1. FROM: get data
-- 2. ORDER BY: customer_id + date desc
-- 3. DISTINCT ON: pick latest row per customer
-- 4. SELECT: show result
SELECT DISTINCT
    ON (customer_id) customer_id,
    order_date,
    total_amount
FROM orders
ORDER BY customer_id, order_date DESC;

-- Task 8. Rank customers by total spending
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. SELECT: SUM(total_amount)
-- 4. WINDOW FUNCTION: apply RANK()
SELECT
    customer_id,
    SUM(total_amount) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(total_amount) DESC
    ) AS rank
FROM orders
GROUP BY
    customer_id;

-- Task 9. Find customers with more than 2 orders and total spent
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. HAVING: count > 2
-- 4. SELECT: count & sum
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(*) > 2;

-- Task 10. Find customers whose total spending is above average
-- 1. INNER QUERY: calculate total_spent per customer
-- 2. SUBQUERY: calculate average of total_spent
-- 3. OUTER QUERY: filter customers > avg
SELECT *
FROM (
        SELECT customer_id, SUM(total_amount) AS total_spent
        FROM orders
        GROUP BY
            customer_id
    ) AS t
WHERE
    total_spent > (
        SELECT AVG(total_spent)
        FROM (
                SELECT SUM(total_amount) AS total_spent
                FROM orders
                GROUP BY
                    customer_id
            ) AS avg_table
    );

-- -------------------------------------------------------------------------
-- -----------------------------------Advance task / query--------------------------------
-- -------------------------------------------------------------------------------------------

-- Task 11. Find top 2 highest spending customers
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. SELECT: SUM(total_amount)
-- 4. ORDER BY: total_spent desc
-- 5. LIMIT: top 2
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY
    customer_id
ORDER BY total_spent DESC
LIMIT 2;

-- Task 12. Find customers who placed orders in January only
-- 1. FROM: get data
-- 2. GROUP BY: customer_id
-- 3. HAVING: only month = 1
SELECT customer_id
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(
        DISTINCT EXTRACT(
            MONTH
            FROM order_date
        )
    ) = 1
    AND MIN(
        EXTRACT(
            MONTH
            FROM order_date
        )
    ) = 1;

-- Task 13. Find total orders and spending per day
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

-- Task 14. Find customers whose total spending is below average
-- 1. INNER: total per customer
-- 2. SUBQUERY: average spending
-- 3. OUTER: filter < avg
SELECT *
FROM (
        SELECT customer_id, SUM(total_amount) AS total_spent
        FROM orders
        GROUP BY
            customer_id
    ) t
WHERE
    total_spent < (
        SELECT AVG(total_spent)
        FROM (
                SELECT SUM(total_amount) AS total_spent
                FROM orders
                GROUP BY
                    customer_id
            ) avg_table
    );

-- Task 15. Find most recent order overall
-- 1. FROM: get data
-- 2. ORDER BY: date desc
-- 3. LIMIT: 1
SELECT * FROM orders ORDER BY order_date DESC LIMIT 1;