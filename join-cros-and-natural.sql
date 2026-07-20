-- create employes table
CREATE TABLE employes (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

-- create departments table
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- insert departments data
INSERT INTO
    departments (dept_id, dept_name)
VALUES (101, 'Engineering'),
    (102, 'Marketing');

-- insert eployes data
INSERT INTO
    employes (emp_id, emp_name, dept_id)
VALUES (1, 'John', 101),
    (2, 'Alice', 102);

-- see departments
SELECT * FROM departments;
-- see employes
SELECT * FROM employes;

-- CROSS JOIN
SELECT * FROM employes CROSS JOIN departments;
-- NATURAL JOIN
SELECT * FROM employes NATURAL JOIN departments;

/*
-- ---------------From gpt for note-----------------------------
-- 1. CROSS JOIN

-- Returns all possible combinations (Cartesian product)

SELECT * FROM employes CROSS JOIN departments;

-- Result:
-- If employes = 2 rows, departments = 2 rows
-- Output = 2 × 2 = 4 rows

-- Example Output Idea:
-- John | 101 | 101 | Engineering
-- John | 101 | 102 | Marketing
-- Alice | 102 | 101 | Engineering
-- Alice | 102 | 102 | Marketing

-- 2. NATURAL JOIN

-- Automatically joins tables based on same column name

SELECT * FROM employes NATURAL JOIN departments;

-- Condition auto:
-- employes.dept_id = departments.dept_id

-- Result:
-- Only matching rows where dept_id is same

-- Example Output Idea:
-- emp_id | emp_name | dept_id | dept_name
-- 1 | John | 101 | Engineering
-- 2 | Alice | 102 | Marketing

-- IMPORTANT NOTES

-- CROSS JOIN:
-- No condition needed
-- Can create large result (use carefully)

-- NATURAL JOIN:
-- No ON clause used
-- Works only when column names match
-- Risky in real projects (better to use explicit JOIN)

-- QUICK SUMMARY
*/