-- From gpt For Note

-- !Warning- do not exucute the codes below
-- ==================================
-- DELETE COMMAND NOTES
-- ==================================

/* ALL COMMENTS JUST READ THE COMMANDS,
NOT EXUCUTE.


-- 🔹 DELETE → remove rows from table
-- delete all rows ❌ (be careful!)
DELETE FROM students;

-- ==================================
-- 🔹 DELETE with condition
-- ==================================
-- delete specific student
DELETE FROM students
WHERE
student_id = 5;

-- delete by condition
DELETE FROM students
WHERE
age < 18;

-- delete multiple condition
DELETE FROM students
WHERE
course = 'CSE'
AND age > 25;

-- ==================================
-- 🔹 DELETE using IN
-- ==================================
DELETE FROM students
WHERE
course IN ('CSE', 'EEE');

-- ==================================
-- 🔹 DELETE using LIKE
-- ==================================
DELETE FROM students
WHERE
first_name LIKE 'A%';

-- ==================================
-- 🔹 DELETE with RETURNING (PostgreSQL 🔥)
-- ==================================
DELETE FROM students
WHERE
age > 30
RETURNING
*;

-- ==================================
-- 🔹 SAFE DELETE (important ⚠️)
-- ==================================
-- always check before delete
SELECT *
FROM students
WHERE
age < 18;

-- then run DELETE
-- ==================================
-- 🔹 QUICK SUMMARY
-- ==================================
-- DELETE → remove rows
-- use WHERE → avoid deleting all data
-- RETURNING → see deleted rows

*/