-- VIEW works like variable. set of an query
CREATE VIEW dept_avg_salary AS
SELECT
    department_name,
    AVG(salary) AS each_dept_avg_salary
FROM employees
GROUP BY
    department_name;

-- we can get the same value by using the view (dept_ag_salary) and can stop reusable code. also have sequrity concern.
SELECT * FROM dept_avg_salary;

-- VIEW can
-- Simplifying complex queries
-- Improved security
-- Enhanced data abstraction

-- ------------From gpt for note------------------
-- ==============================
-- SQL VIEW NOTE (Employees Table)
-- ==============================

-- What is a VIEW?
-- A VIEW is a virtual table created from a SELECT query.
-- It does not store data physically, it shows data from base tables.

-- =========================================
-- Example 1: Simple View (Department Filter)
-- =========================================
-- Show only IT department employees

CREATE VIEW it_employees AS
SELECT id, name, salary, department
FROM employees
WHERE
    department = 'IT';

-- Use the view
SELECT * FROM it_employees;

-- =========================================
-- Example 2: View with Aggregation
-- =========================================
-- Show average salary per department

CREATE VIEW dept_avg_salary AS
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY
    department;

-- Use the view
SELECT * FROM dept_avg_salary;