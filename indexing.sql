-- Active: 1784391000223@@localhost@5432@tayu_db
CREATE DATABASE tayu_db;
-- create table
CREATE TABLE tayu_employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary INT
);

-- insert 50,000 data in tayu_employees table randomly
INSERT INTO
    tayu_employees (
        employee_name,
        department_id,
        salary
    )
SELECT 'Employee_' || i, (RANDOM() * 10)::INT, (RANDOM() * 50000)::INT
FROM generate_series(1, 50000) AS i;

-- see tayu_employees table
SELECT * FROM tayu_employees;

-- -----------try Indexing here-------

-- without indexing time---
EXPLAIN ANALYSE
SELECT *
FROM tayu_employees
WHERE
    employee_name = 'Eployee_88';

-- after indexing
CREATE INDEX idx_tayu_employees_employee_name ON tayu_employees (employee_name);

-- searching time is too short.

-- -------------From gpt for note------------------------------
-- INDEXING MAIN KEY POINTS

-- 1. Index makes SELECT fast (read high)
--    but INSERT/UPDATE/DELETE slow (write low)

-- 2. Without index -> full table scan
--    With index -> index scan

-- 3. Use index on:
--    WHERE, JOIN, ORDER BY

-- 4. Avoid index on:
--    small table
--    low unique values (e.g. gender, boolean)
--    frequently updated column

-- 5. Too many index increases storage and slows write operations

-- 6. Always check performance:
EXPLAIN ANALYZE SELECT * FROM tayu_employees WHERE salary > 30000;

--------------------------------------------------

-- B-TREE (default, most used)
-- supports: =, <, >, BETWEEN, ORDER BY

CREATE INDEX idx_btree_salary ON tayu_employees USING BTREE (salary);

--------------------------------------------------

-- HASH
-- supports: only equality (=)

CREATE INDEX idx_hash_salary ON tayu_employees USING HASH (salary);

--------------------------------------------------

-- GIN (Generalized Inverted Index)
-- used for: full-text search, array, jsonb

CREATE INDEX idx_gin_name ON tayu_employees USING GIN (
    to_tsvector('english', employee_name)
);

--------------------------------------------------

-- GIST (Generalized Search Tree)
-- used for: range, geometric, advanced queries

CREATE INDEX idx_gist_salary ON tayu_employees USING GIST (
    int4range (salary, salary + 1000)
);