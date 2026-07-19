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