SELECT * FROM students;

-- group the students by their country and set field name as "students-each-country-in"
SELECT
    country,
    COUNT(*) as "students-each-country-in"
from students
GROUP BY
    country;

-- Filter groups using HAVING to show only countries with average age avobe 22.
SELECT country, AVG(age)
from students
GROUP BY
    country
HAVING
    AVG(age) > 20;

-- count students born in Each year-- at first group the years and get each year then count for each year to get the student for every year.
SELECT
    EXTRACT(
        year
        FROM dob
    ) AS "students_born_year",
    COUNT(*) AS "born_student_in_each_year"
FROM students
GROUP BY
    students_born_year;

/*
-- ---------------------------From gpt for note-------------------------------
-- ===== GROUP BY & HAVING (Clean Examples) =====

-- 1. Count students by age
SELECT
age,
COUNT(*) AS total_students
FROM students
GROUP BY age;

-- 2. Average age by country
SELECT
country,
AVG(age) AS avg_age
FROM students
GROUP BY country;

-- 3. Countries with avg age > 21
SELECT
country,
AVG(age) AS avg_age
FROM students
GROUP BY country
HAVING AVG(age) > 21;

-- 4. Count students per department
SELECT
department,
COUNT(*) AS total
FROM students
GROUP BY department;

-- 5. Departments with more than 3 students
SELECT
department,
COUNT(*) AS total
FROM students
GROUP BY department
HAVING COUNT(*) > 3;

-- 6. Students per birth month
SELECT
EXTRACT(MONTH FROM dob) AS birth_month,
COUNT(*) AS total
FROM students
GROUP BY birth_month
ORDER BY birth_month;

-- 7. Max age per country
SELECT
country,
MAX(age) AS max_age
FROM students
GROUP BY country;

-- 8. Min age per country (only where min age > 18)
SELECT
country,
MIN(age) AS min_age
FROM students
GROUP BY country
HAVING MIN(age) > 18;

-- ===== END =====
*/