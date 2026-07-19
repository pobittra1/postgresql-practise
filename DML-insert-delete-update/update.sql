-- get the all students data
SELECT * FROM students;

-- update the student email to default@gmail.com of student_id is 6
UPDATE students set email = 'default@gmail.com' WHERE student_id = 6;

-- update multiple values
-- update email and age
UPDATE students
set
    email = 'default@gmail.com',
    age = 22
WHERE
    student_id = 6;

-- --------------------From gpt for note-----------------------
-- ==================================
-- UPDATE COMMAND NOTES
-- ==================================
/*
-- 🔹 UPDATE → modify existing data

-- update single row
UPDATE students
SET first_name = 'John'
WHERE student_id = 1;


-- ==================================
-- 🔹 UPDATE multiple columns
-- ==================================

UPDATE students
SET first_name = 'Alex',
age = 22
WHERE student_id = 2;


-- ==================================
-- 🔹 UPDATE with condition
-- ==================================

UPDATE students
SET course = 'CSE'
WHERE course = 'EEE';


-- ==================================
-- 🔹 UPDATE all rows ❌ (be careful!)
-- ==================================

UPDATE students
SET country = 'Unknown';


-- ==================================
-- 🔹 UPDATE using IN
-- ==================================

UPDATE students
SET course = 'BBA'
WHERE student_id IN (1, 3, 5);


-- ==================================
-- 🔹 UPDATE using CASE (conditional update)
-- ==================================

UPDATE students
SET grade = 
CASE
WHEN age >= 25 THEN 'A'
WHEN age >= 20 THEN 'B'
ELSE 'C'
END;


-- ==================================
-- 🔹 UPDATE with RETURNING (PostgreSQL 🔥)
-- ==================================

UPDATE students
SET age = age + 1
WHERE course = 'CSE'
RETURNING *;


-- ==================================
-- 🔹 SAFE UPDATE (important ⚠️)
-- ==================================

-- always check first
SELECT * 
FROM students
WHERE student_id = 1;

-- then run UPDATE


-- ==================================
-- 🔹 QUICK SUMMARY
-- ==================================

-- UPDATE → change existing data
-- use WHERE → avoid updating all rows
-- RETURNING → see updated rows

*/