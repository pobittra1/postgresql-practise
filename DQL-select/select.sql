-- Active: 1784391000223@@localhost@5432@postgres

-- create students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

-- set not null for first_name and last_name
alter table students
alter COLUMN first_name
set not NULL,
alter COLUMN last_name
set not null;

-- insert the value
INSERT INTO
    students (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'John',
        'Smith',
        20,
        'A+',
        'CSE',
        'john@gmail.com',
        '2004-02-10',
        'B+',
        'USA'
    ),
    (
        'Emma',
        'Johnson',
        22,
        'A',
        'EEE',
        NULL,
        '2002-06-15',
        'O+',
        'Canada'
    ),
    (
        'Rahim',
        'Uddin',
        21,
        'A+',
        'BBA',
        'rahim@gmail.com',
        '2003-03-20',
        'A+',
        'Bangladesh'
    ),
    (
        'Olivia',
        'Brown',
        19,
        'A',
        'CSE',
        'olivia@gmail.com',
        '2005-01-12',
        'AB+',
        'Australia'
    ),
    (
        'Karim',
        'Hossain',
        23,
        'B+',
        'English',
        'karim@gmail.com',
        '2001-07-25',
        'O-',
        'Bangladesh'
    ),
    (
        'Liam',
        'Williams',
        20,
        'A-',
        'CSE',
        'liam@gmail.com',
        '2004-11-05',
        'B-',
        'UK'
    ),
    (
        'Sophia',
        'Miller',
        22,
        'B',
        'EEE',
        NULL,
        '2002-09-18',
        'A-',
        'Canada'
    ),
    (
        'Nusrat',
        'Jahan',
        21,
        'A+',
        'Pharmacy',
        'nusrat@gmail.com',
        '2003-04-30',
        'B+',
        'Bangladesh'
    ),
    (
        'Benjamin',
        'Martinez',
        24,
        'B+',
        'Law',
        'ben@gmail.com',
        '2000-08-22',
        'O+',
        'France'
    ),
    (
        'Mia',
        'Hernandez',
        20,
        'A',
        'CSE',
        'mia@gmail.com',
        '2004-12-02',
        'AB-',
        'Italy'
    ),
    (
        'Sumaiya',
        'Islam',
        23,
        'B',
        'Economics',
        'sumaiya@gmail.com',
        '2001-05-14',
        'A+',
        'Bangladesh'
    ),
    (
        'Lucas',
        'Lopez',
        19,
        'A+',
        'BBA',
        'lucas@gmail.com',
        '2005-06-28',
        'O+',
        'Spain'
    ),
    (
        'Nayeem',
        'Ahmed',
        22,
        'A-',
        'CSE',
        'nayeem@gmail.com',
        '2002-10-09',
        'B+',
        'Bangladesh'
    ),
    (
        'Amelia',
        'Anderson',
        21,
        'B+',
        'EEE',
        'amelia@gmail.com',
        '2003-02-17',
        'AB+',
        'Australia'
    ),
    (
        'Ethan',
        'Thomas',
        20,
        'A',
        'English',
        'ethan@gmail.com',
        '2004-03-11',
        'O-',
        'Canada'
    );

-- get all students data
SELECT * FROM students;

-- get only email-- single field data
SELECT email from students;

-- get multiple fields data
select first_name, email, age from students;

-- see the students email as student_email---- not chane email field name. just show as student_email
select email AS student_email FROM students;

select email AS "Student Email" FROM students;
-- without undrscore. like clean formating.

-- see the data using ORDER BY ASC/DESC----- A to Z and Z to A
select * FROM students ORDER BY first_name ASC;
-- or last_name z to a
SELECT * FROM students ORDER BY last_name DESC;
-- see the youngest student first
SELECT * FROM students ORDER BY age ASC;

-- get the country - not repeat . one country one time -
SELECT DISTINCT country FROM students;
-- same for blood group
SELECT DISTINCT blood_group FROM students;

-- data filtering - WHERE
-- get the all students of Usa country
SELECT * FROM students WHERE country = 'Canada';

-- get the all students of Canada country and they have A grade - 2 condition check- need true for 2 condition
-- get by different column multiple value to use AND
SELECT * FROM students WHERE country = 'Canada' AND grade = 'A';

-- get the students of Bangladesh and Canada country
-- get by same column multiple value to use OR
SELECT *
FROM students
WHERE
    country = 'Bangladesh'
    OR country = 'Canada';

-- get the all students they have course EEE and English and first name asc way
SELECT *
FROM students
WHERE
    course = 'EEE'
    or course = 'English'
ORDER BY first_name ASC;

-- get the all students they have course EEE and English and first name asc way and also have age 20-- complex filtering
SELECT *
FROM students
WHERE (
        course = 'EEE'
        or course = 'English'
    )
    AND age = 20
ORDER BY first_name ASC;

-- comparison operators
-- select students older than 20 and they have EEE course
SELECT * FROM students WHERE age > 20 and course = 'EEE';

-- get the all students without Italy country
SELECT * FROM students WHERE country NOT IN ('Italy');