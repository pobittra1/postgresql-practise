-- get employees
SELECT * FROM employees;

-- create a func for show all it dept employees
CREATE FUNCTION show_all_IT_dept_employees()
RETURNs TABLE(  employee_id INT,
    employee_name TEXT,
    salary NUMERIC,
    department_name TEXT)
LANGUAGE SQL
AS
$$
SELECT employee_id, employee_name, salary, department_name FROM employees
WHERE department_name = 'IT';
$$;
-- calling the func
SELECT * FROM show_all_IT_dept_employees ();

-- drop function
DROP FUNCTION show_all_IT_dept_employees;

-- create a function in sql to delete 30 number id employee using params
CREATE FUNCTION delete_employee(p_employee_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
DELETE FROM employees WHERE employee_id = p_employee_id;
$$;
-- calling func passing param value
SELECT delete_employee (30);

-- use of SETOF and name search functionality
CREATE OR REPLACE FUNCTION search_employee(emp_name VARCHAR)
RETURNS SETOF employees
LANGUAGE SQL
AS
$$
SELECT *
FROM employees
WHERE employee_name ILIKE '%' || emp_name || '%';
$$;

-- search employees
SELECT * FROM search_employee ('ra');

-- ---------- about sql function from gpt-----------------

-- =========================================
-- WHAT IS A FUNCTION?
-- =========================================
-- A function is a reusable block of SQL logic stored in the database.
-- It can accept input parameters and return a value or a set of rows.

-- =========================================
-- WHY DO WE USE FUNCTIONS?
-- =========================================

-- 1. Reusability
-- Write once, use multiple times without repeating the same query.

-- 2. Code Organization
-- Keeps complex SQL logic structured and easier to manage.

-- 3. Maintainability
-- Changes can be made in one place instead of updating multiple queries.

-- 4. Performance
-- Database can optimize execution of stored functions.

-- 5. Parameterization
-- Allows dynamic input to produce different outputs.

-- 6. Security
-- Users can access data through functions without direct table access.

-- =========================================
-- ADVANTAGES OF FUNCTIONS
-- =========================================

-- ✔ Reduces code duplication
-- ✔ Improves readability
-- ✔ Centralizes business logic
-- ✔ Makes applications cleaner (especially backend/API)
-- ✔ Easier debugging and updates

-- =========================================
-- WHEN TO USE FUNCTIONS?
-- =========================================

-- ✔ When the same query is used frequently
-- ✔ When logic needs to be reused in multiple places
-- ✔ When working with dynamic filtering/searching
-- ✔ When you want to encapsulate business logic in the database
-- ✔ When restricting direct access to tables

-- =========================================
-- RETURNS TABLE vs RETURNS SETOF
-- =========================================

-- RETURNS TABLE:
-- Used when you want to define custom columns manually.

-- RETURNS SETOF:
-- Used when returning full rows of an existing table structure.

-- =========================================
-- FUNCTION vs PROCEDURE
-- =========================================

-- Function:
-- ✔ Must return a value
-- ✔ Can be used inside SELECT

-- Procedure:
-- ✔ May or may not return a value
-- ✔ Executed using CALL

-- =========================================
-- SHORT SUMMARY
-- =========================================

-- Function = reusable + parameterized + maintainable SQL logic