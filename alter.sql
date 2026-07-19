-- Active: 1784391000223@@localhost@5432@tayu
-- select everything from person2 table;
select * from person2;

-- add field - email and add default value.
alter table person2
ADD COLUMN email VARCHAR(50) DEFAULT 'default@gmail.com' NOT NULL;

-- insert the value without default value
INSERT INTO person2 VALUES (6, 'hriya', 34);

-- insert the value - given default value
INSERT INTO person2 VALUES ( 7, 'ritam', 33, 'ritam@gmail.com' );

-- drop the column - email
ALTER TABLE person2 DROP COLUMN email;

-- rename the column age to person_age
ALTER TABLE person2 RENAME COLUMN age TO person_age;

-- change the type of first_name varchar(50) to varchar(100)
ALTER TABLE person2 ALTER COLUMN first_name TYPE VARCHAR(100);

-- set the constraints null to not null
ALTER TABLE person2 ALTER COLUMN person_age SET NOT NULL;

-- again DROP not null to null
ALTER TABLE person2 ALTER COLUMN person_age DROP NOT NULL;

-- diffrent method of alter for unique, primary key
ALTER TABLE person2
ADD constraint unique_person2_person_age UNIQUE (person_age);

-- TRUNCATE for drop the table but structure is stable.
TRUNCATE TABLE person2;
-- ------------------diffrent method of alter for unique, primary key etc-----------------
/*
-- 🔹 Method 1: ADD CONSTRAINT (recommended)

-- UNIQUE
ALTER TABLE users
ADD CONSTRAINT unique_email UNIQUE (email);

-- PRIMARY KEY
ALTER TABLE users
ADD CONSTRAINT pk_users PRIMARY KEY (id);

-- 🔹 Method 2: Direct ADD (short)

-- UNIQUE
ALTER TABLE users
ADD UNIQUE (email);

-- PRIMARY KEY
ALTER TABLE users
ADD PRIMARY KEY (id);

-- 🔹 Method 3: Composite (multiple column)

-- UNIQUE
ALTER TABLE users
ADD CONSTRAINT unique_name_age UNIQUE (name, age);

-- PRIMARY KEY
ALTER TABLE users
ADD PRIMARY KEY (id, email);

-- 🔹 Method 4: DROP constraint

-- UNIQUE drop
ALTER TABLE users
DROP CONSTRAINT unique_email;

-- PRIMARY KEY drop (default নাম: table_pkey)
ALTER TABLE users
DROP CONSTRAINT users_pkey;
*/

/*
-- ---------------From gpt------------------
-- Add column
ALTER TABLE table_name ADD COLUMN column_name datatype;

-- Drop column
ALTER TABLE table_name DROP COLUMN column_name;

-- Rename column
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;

-- Rename table
ALTER TABLE table_name RENAME TO new_table_name;

-- Change data type
ALTER TABLE table_name ALTER COLUMN column_name TYPE datatype;

-- Add constraint
ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_type (column);

-- Drop constraint
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

-- Set default
ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT value;

-- Drop default
ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;

-- Set NOT NULL
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;

-- Drop NOT NULL
ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;
*/