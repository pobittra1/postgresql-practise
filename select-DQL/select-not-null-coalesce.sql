-- select the students they have email null
SELECT * FROM students WHERE email IS NULL;

-- select the students they have email. not null value.
SELECT * FROM students WHERE email IS NOT NULL;

-- give the students they have without EEE course
-- NOT - condition reverse
SELECT * FROM students WHERE NOT course = 'EEE';

-- replace the NULL email to No Email and alias as student_email
SELECT COALESCE(email, 'No Email') AS "student_email" FROM students;

-- replace the NULL email to "Not given Yet" and alias as student_email and see first_name and age value.
SELECT
    COALESCE(email, 'Not given Yet') as "student_email",
    first_name,
    age
FROM students;

-- ---------------------from gpt sollutions for note-----------------------
-- ==================================
-- NOT, NULL, COALESCE NOTES
-- ==================================

-- 🔹 NULL → represents missing/unknown value

-- check NULL values
SELECT * FROM students WHERE email IS NULL;

-- check NOT NULL values
SELECT * FROM students WHERE email IS NOT NULL;

-- ❌ WRONG (will not work)
-- WHERE email = NULL;

-- ==================================
-- 🔹 NOT → reverses a condition
-- ==================================

-- NOT with condition
SELECT * FROM students WHERE NOT course = 'CSE';

-- same as
SELECT * FROM students WHERE course <> 'CSE';

-- NOT with NULL
SELECT * FROM students WHERE NOT (email IS NULL);

-- same as
SELECT * FROM students WHERE email IS NOT NULL;

-- ==================================
-- 🔹 COALESCE → replace NULL values
-- ==================================

-- replace NULL email
SELECT COALESCE(email, 'Not Provided') AS email_status
FROM students;

-- multiple fallback values
SELECT COALESCE(email, course, 'N/A') AS contact_info
FROM students;

-- ==================================
-- 🔹 PRACTICAL EXAMPLES
-- ==================================

-- show name + email (replace NULL)
SELECT first_name, COALESCE(email, 'No Email') AS email
FROM students;

-- filter students without email
SELECT first_name, age FROM students WHERE email IS NULL;

-- filter students with email
SELECT first_name, age FROM students WHERE email IS NOT NULL;

-- ==================================
-- 🔹 QUICK SUMMARY
-- ==================================

-- NULL → missing value
-- NOT → reverse condition
-- COALESCE → replace NULL