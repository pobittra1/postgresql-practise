-- Active: 1784391000223@@localhost@5432@postgres
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

DROP Table employees;

INSERT INTO
    employees (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        'Marketing',
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        'Finance',
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        'IT',
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        'Sales',
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        'Engineering',
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        'Customer Support',
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        'Administration',
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        'Research',
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        'Quality Assurance',
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        'HR',
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        'Marketing',
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        'Finance',
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        'IT',
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        'Sales',
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        'Engineering',
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        'Customer Support',
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        'Administration',
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        'Research',
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        'Quality Assurance',
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        'HR',
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        'Marketing',
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        'Finance',
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        'IT',
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        'Sales',
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        'Engineering',
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        'Customer Support',
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        'Administration',
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        'Research',
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        'Quality Assurance',
        70000.25,
        '2021-11-20'
    );

SELECT * from employees;

-- sub query task 1. Retrieve all employees whose salary is greater than the highest salary of the HR department

-- get the max salary in HR dept--Outer quwey/main query
SELECT MAX(salary) FROM employees WHERE department_name = 'HR';
-- get the all employees whose salary is greater than the highest salary of the HR department
SELECT *
FROM employees
WHERE
    salary > (
        SELECT MAX(salary)
        FROM employees
        WHERE
            department_name = 'HR'
            -- sub query
    );

-- Can return a single value
-- Can return multiple rows
-- Can return a single column

SELECT
    employee_name,
    salary,
    department_name
FROM employees
WHERE
    department_name in (
        SELECT department_name
        FROM employees
        WHERE
            department_name LIKE '%R%'
    );

-- ----------------From gpt for note-------------------------

-- ============================================
-- 📘 SQL SUBQUERY FULL NOTE (EMPLOYEES)
-- ============================================

-- 🔹 What is Subquery?
-- A subquery is a query inside another query.
-- It runs first, then the main query runs.

-- ============================================
-- 🔹 TYPES OF SUBQUERY
-- ============================================

-- 1. Single Row Subquery  → returns 1 value
-- 2. Multiple Row Subquery → returns multiple values
-- 3. Correlated Subquery → runs per row

-- ============================================
-- 🔹 WHERE WE USE SUBQUERY
-- ============================================

-- ✔ WHERE
-- ✔ FROM
-- ✔ SELECT

-- ============================================
-- 🔥 EXAMPLES (EMPLOYEES)
-- ============================================

-- ------------------------------------------------
-- Example 1: Employees earning more than average salary
-- 1. Subquery: AVG(salary)
-- 2. Main: filter higher salary
-- ------------------------------------------------
SELECT *
FROM employees
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees
    );

-- ------------------------------------------------
-- Example 2: Employees with highest salary
-- 1. Subquery: MAX(salary)
-- 2. Main: match value
-- ------------------------------------------------
SELECT *
FROM employees
WHERE
    salary = (
        SELECT MAX(salary)
        FROM employees
    );

-- ------------------------------------------------
-- Example 3: Employees in same department as 'Rahim'
-- 1. Subquery: get department
-- 2. Main: match department
-- ------------------------------------------------
SELECT *
FROM employees
WHERE
    department = (
        SELECT department
        FROM employees
        WHERE
            name = 'Rahim'
    );

-- ------------------------------------------------
-- Example 4: Employees who are managers
-- 1. Subquery: get manager_ids
-- 2. Main: IN condition
-- ------------------------------------------------
SELECT *
FROM employees
WHERE
    emp_id IN (
        SELECT manager_id
        FROM employees
        WHERE
            manager_id IS NOT NULL
    );

-- ------------------------------------------------
-- Example 5: Highest salary per department (Correlated)
-- 1. Subquery runs per department
-- 2. Match max salary
-- ------------------------------------------------
SELECT *
FROM employees e1
WHERE
    salary = (
        SELECT MAX(salary)
        FROM employees e2
        WHERE
            e1.department = e2.department
    );

-- ============================================
-- ⚡ BONUS EXAMPLES (INTERMEDIATE LEVEL)
-- ============================================

-- Example 6: Employees earning more than department average
SELECT *
FROM employees e1
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees e2
        WHERE
            e1.department = e2.department
    );

-- Example 7: Employees earning more than their manager
SELECT *
FROM employees e1
WHERE
    salary > (
        SELECT salary
        FROM employees e2
        WHERE
            e1.manager_id = e2.emp_id
    );

-- Example 8: Employees with no manager (top level)
SELECT * FROM employees WHERE manager_id IS NULL;

-- Example 9: Departments with more than 2 employees
SELECT department, COUNT(*) AS total_emp
FROM employees
GROUP BY
    department
HAVING
    COUNT(*) > 2;

-- Example 10: Employees whose salary is below overall average
SELECT *
FROM employees
WHERE
    salary < (
        SELECT AVG(salary)
        FROM employees
    );

-- ============================================
-- ⚡ PRO TIPS
-- ============================================

-- ✔ Always use () for subquery
-- ✔ Use IN for multiple values
-- ✔ Use = for single value
-- ✔ Correlated subquery = runs per row (slower but powerful)

-- ============================================
-- END OF FILE
-- ============================================