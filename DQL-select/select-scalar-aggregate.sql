-- get the all students data
SELECT * from students;

-- scalar functions-
SELECT UPPER(first_name) FROM students;

SELECT LOWER(first_name) FROM students;

SELECT LENGTH(first_name) FROM students;

SELECT CONCAT(first_name, ' ', last_name) FROM students;

-- aggregate functions - calculate each row and give output single value.
SELECT COUNT(*) FROM students;

SELECT SUM(age) FROM students;

SELECT AVG(age) FROM students;

SELECT MAX(age) FROM students;

SELECT MIN(age) FROM students;

-- select the students with max first_name length
select MAX(LENGTH(first_name)) FROM students;

-- ---------------------from gpt sollutions for note-----------------------
-- ==================================
-- SCALAR & AGGREGATE FUNCTIONS NOTE
-- ==================================

-- 🔹 SCALAR FUNCTIONS (operate on each row)

-- UPPER → convert to uppercase
SELECT UPPER(first_name) FROM students;

-- LOWER → convert to lowercase
SELECT LOWER(first_name) FROM students;

-- LENGTH → get string length
SELECT first_name, LENGTH(first_name) FROM students;

-- CONCAT → combine strings
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM students;

-- COALESCE → replace NULL values
SELECT COALESCE(email, 'Not Provided') FROM students;

-- ROUND → round numbers
SELECT ROUND(12.567, 2);

-- NOW → current date and time
SELECT NOW();

-- ==================================
-- 🔹 AGGREGATE FUNCTIONS (operate on multiple rows)
-- ==================================

-- COUNT → total number of rows
SELECT COUNT(*) FROM students;

-- COUNT(column) → ignores NULL values
SELECT COUNT(email) FROM students;

-- SUM → total sum
SELECT SUM(age) FROM students;

-- AVG → average value
SELECT AVG(age) FROM students;

-- MAX → maximum value
SELECT MAX(age) FROM students;

-- MIN → minimum value
SELECT MIN(age) FROM students;

-- ==================================
-- 🔹 GROUP BY (used with aggregate)
-- ==================================

-- count students per course
SELECT course, COUNT(*) FROM students GROUP BY course;

-- average age per country
SELECT country, AVG(age) FROM students GROUP BY country;

-- ==================================
-- 🔹 HAVING (filter groups)
-- ==================================

SELECT course, COUNT(*)
FROM students
GROUP BY
    course
HAVING
    COUNT(*) > 2;

-- ==================================
-- 🔹 COMBINED EXAMPLE
-- ==================================

SELECT
    country,
    COUNT(*) AS total_students,
    AVG(age) AS avg_age
FROM students
GROUP BY
    country
HAVING
    AVG(age) > 20;

-- ==================================
-- 🔹 QUICK SUMMARY
-- ==================================

-- SCALAR → row-wise (UPPER, LOWER, LENGTH, COALESCE)
-- AGGREGATE → group-wise (COUNT, SUM, AVG, MAX, MIN)