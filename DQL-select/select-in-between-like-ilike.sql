-- Active: 1784391000223@@localhost@5432@postgres
-- get the all students
SELECT * FROM students;

-- get the students they live in Canada, Bangladesh, and UK
SELECT *
FROM students
WHERE
    country = 'Canada'
    or country = 'Bangladesh'
    or country = 'UK';
-- using IN operator
SELECT *
FROM students
WHERE
    country IN ('Canada', 'Bangladesh', 'UK');

-- get the students age between 22-24 and asc the age
SELECT * FROM students WHERE age BETWEEN 22 and 24 ORDER BY age ASC;
-- get the dob between 2001 - 2002
SELECT *
FROM students
WHERE
    dob BETWEEN '2001-01-01' AND '2002-12-12';

--get the students their first_name end with a- case sensitive
SELECT * FROM students WHERE first_name LIKE '%a';
-- get the students their first_name start with A and end with a.
SELECT * FROM students WHERE first_name LIKE 'A%a';
-- get the students their first_name start with E and end with a but in middle have 2 fixed letter using _ _ double underscore
SELECT * FROM students WHERE first_name LIKE 'E__a';
-- here double underscore mean double fixed letter

-- get the first_name value of students their first_name start with E/e -case insesitive.
SELECT * FROM students WHERE first_name ILIKE 'e%';

-- ---------------------from gpt sollutions for note-----------------------
-- ===============================
-- IN, BETWEEN, LIKE, ILIKE NOTES
-- ===============================

-- 🔹 IN → multiple value check
SELECT * FROM students WHERE course IN ('CSE', 'EEE', 'English');

-- 🔹 NOT IN
SELECT * FROM students WHERE course NOT IN ('CSE', 'EEE');

-- 🔹 BETWEEN → range (inclusive)
SELECT * FROM students WHERE age BETWEEN 18 AND 25;

-- 🔹 NOT BETWEEN
SELECT * FROM students WHERE age NOT BETWEEN 18 AND 25;

-- 🔹 LIKE → pattern match (case-sensitive)
SELECT * FROM students WHERE first_name LIKE 'A%';
-- case insensitive
SELECT * FROM students WHERE first_name ILIKE 'a%';
-- starts with A

SELECT * FROM students WHERE first_name LIKE '%a';
-- ends with a

SELECT * FROM students WHERE first_name LIKE '%im%';
-- contains 'im'

SELECT * FROM students WHERE first_name LIKE 'A_';
-- A + 1 character

-- 🔹 NOT LIKE
SELECT * FROM students WHERE first_name NOT LIKE 'A%';

-- 🔹 ILIKE → case-insensitive (PostgreSQL)
SELECT * FROM students WHERE first_name ILIKE 'a%';
-- A বা a

-- 🔹 COMBO EXAMPLE
SELECT first_name, age
FROM students
WHERE
    course IN ('CSE', 'EEE')
    AND age BETWEEN 18 AND 25
    AND first_name ILIKE 'a%';

-- 🔹 QUICK REMINDER
-- IN → multiple values
-- BETWEEN → range
-- LIKE → pattern (case-sensitive)
-- ILIKE → pattern (case-insensitive)