-- get the all students data
SELECT * from students;

-- scalar functions
SELECT UPPER(first_name) FROM students;

SELECT LOWER(first_name) FROM students;

SELECT LENGTH(first_name) FROM students;

SELECT CONCAT(first_name, ' ', last_name) FROM students;

-- aggregate functions
SELECT COUNT(*) FROM students;

SELECT SUM(age) FROM students;

SELECT AVG(age) FROM students;

SELECT MAX(age) FROM students;

SELECT MIN(age) FROM students;

-- select the students with max first_name length
select MAX(LENGTH(first_name)) FROM students;