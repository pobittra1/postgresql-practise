-- get the all students data
SELECT * FROM students;

-- get the data of 5 rows
SELECT * FROM students LIMIT 5;

-- get the students data of Canada, Bangladesh and UK country and see first 3 rows data
SELECT *
FROM students
WHERE
    country IN ('Canada', 'Bangladesh', 'UK')
LIMIT 3;

-- get the data without first 5 rows data
SELECT *
FROM students
WHERE
    country IN ('Canada', 'Bangladesh', 'UK')
OFFSET
    5;

-- pagination theory using limit and offset

-- get value from 1-5
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
-- get value from 6-10
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
-- get value from 11-15
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;
-- get value from 16-20
SELECT * FROM students LIMIT 5 OFFSET 5 * 3;

-- ---------------From gpt for note------------------------------
-- ==================================
-- LIMIT & OFFSET NOTES
-- ==================================

-- 🔹 LIMIT → restrict number of rows
SELECT * FROM students LIMIT 5;

-- get first 3 students
SELECT first_name, age FROM students LIMIT 3;

-- ==================================
-- 🔹 OFFSET → skip rows
-- ==================================

-- skip first 5 rows, then show next rows
SELECT * FROM students OFFSET 5;

-- ==================================
-- 🔹 LIMIT + OFFSET (pagination)
-- ==================================

-- skip 5 rows, then take 5 rows
SELECT * FROM students LIMIT 5 OFFSET 5;

-- page 2 (assuming 5 per page)
SELECT * FROM students LIMIT 5 OFFSET 5;

-- page 3
SELECT * FROM students LIMIT 5 OFFSET 10;

-- ==================================
-- 🔹 WITH ORDER BY (important ⚠️)
-- ==================================

-- get top 5 oldest students
SELECT first_name, age FROM students ORDER BY age DESC LIMIT 5;

-- get 2nd highest age
SELECT first_name, age
FROM students
ORDER BY age DESC
LIMIT 1
OFFSET
    1;

-- ==================================
-- 🔹 QUICK SUMMARY
-- ==================================

-- LIMIT → how many rows to return
-- OFFSET → how many rows to skip
-- use ORDER BY for correct result