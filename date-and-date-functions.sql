-- For showing the timezone
show timezone;
-- For show date, time, timezone everything
SELECT now();

-- create table of timez for timstam with timezone and without timezone.
CREATE TABLE timez (
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);
-- insert same value but in second value get the value with timezone.
INSERT INTO
    timez
VALUES (
        '2026-01-12 11:34:00',
        '2026-01-12 11:34:00'
    );

SELECT * FROM timez;

-- get the current date data
SELECT CURRENT_DATE;

SELECT current_time;

SELECT current_timestamp

-- alternative way to get current date data
SELECT now()::DATE;

SELECT now()::TIME;

SELECT now()::TIMESTAMP;

-- Formating date in multiple different ways- in to_char() func have two param. current timestam and date formate in string. search in google "postgres to_char formate and use the values"
SELECT to_char(now(), 'dd-mm-yyyy');

SELECT to_char(now(), 'Month');

SELECT to_char(now(), 'month');

SELECT to_char(now(), 'MONTH');

SELECT to_char(now(), 'Day');

SELECT to_char(now(), 'DAY');

SELECT to_char(now(), 'DY');
-- day of the year
SELECT to_char(now(), 'DDD');
-- day of the week
SELECT to_char(now(), 'D');
-- have some more ways to get date formate. google it.

-- before 1 year from this day
SELECT CURRENT_DATE - INTERVAL '1 year';
-- before 1 year 2 month from this day
SELECT CURRENT_DATE - INTERVAL '1 year 2 months';
-- Example
-- SELECT date_column ± INTERVAL 'quantity unit';

--  get the current age using age func
SELECT age (CURRENT_DATE, '2004-05-09');

SELECT * FROM students;

-- get age from students table and alias to student_ages at endpoint.
SELECT *, age (CURRENT_DATE, dob) AS "student_ages" FROM students;

-- extract day, year and month from a date
SELECT EXTRACT( MONTH FROM '2026-04-06'::date );

SELECT EXTRACT( DAY FROM '2026-04-06'::date );

SELECT EXTRACT( YEAR FROM '2026-04-06'::date );

--Type cast
SELECT 1::BOOLEAN;

SELECT 'n'::BOOLEAN;

SELECT 'dfd'::BOOLEAN;

SELECT '0'::BOOLEAN;

-- ---------------------From gpt for note-------------------------------
-- =========================================
-- 🕒 PostgreSQL Date, Time & Type Casting Notes
-- =========================================
/*
-- =========================================
-- 1. Show Timezone & Current Timestamp
-- =========================================

-- Show current timezone
SHOW timezone;

-- Show current date + time + timezone
SELECT now();

-- =========================================
-- 2. TIMESTAMP With vs Without Time Zone
-- =========================================

CREATE TABLE timez (
ts TIMESTAMP WITHOUT TIME ZONE,
tsz TIMESTAMP WITH TIME ZONE
);

INSERT INTO timez VALUES (
'2026-01-12 11:34:00',
'2026-01-12 11:34:00'
);

SELECT * FROM timez;

-- ts  → stores raw value
-- tsz → converts using timezone

-- =========================================
-- 3. Current Date & Time
-- =========================================

SELECT CURRENT_DATE;        -- only date
SELECT CURRENT_TIME;        -- only time
SELECT CURRENT_TIMESTAMP;   -- full timestamp

-- Alternative using now()
SELECT now()::DATE;
SELECT now()::TIME;
SELECT now()::TIMESTAMP;

-- =========================================
-- 4. Date Formatting (to_char)
-- =========================================

SELECT to_char(now(), 'DD-MM-YYYY');
SELECT to_char(now(), 'Month');
SELECT to_char(now(), 'month');
SELECT to_char(now(), 'MONTH');
SELECT to_char(now(), 'Day');
SELECT to_char(now(), 'DY');

-- Extra formats
SELECT to_char(now(), 'YYYY/MM/DD');
SELECT to_char(now(), 'HH12:MI:SS AM');

-- =========================================
-- 5. Extract Date Parts
-- =========================================

SELECT EXTRACT(MONTH FROM '2026-04-06'::date);
SELECT EXTRACT(DAY FROM '2026-04-06'::date);
SELECT EXTRACT(YEAR FROM '2026-04-06'::date);

-- =========================================
-- 6. Date Calculation (INTERVAL)
-- =========================================

-- 1 year before today
SELECT CURRENT_DATE - INTERVAL '1 year';

-- 1 year 2 months before today
SELECT CURRENT_DATE - INTERVAL '1 year 2 months';

-- =========================================
-- 7. Age Calculation
-- =========================================

-- From static date
SELECT age(CURRENT_DATE, '2004-05-09');

-- From table column
SELECT *, age(CURRENT_DATE, dob) AS student_ages
FROM students;

-- =========================================
-- 8. Type Casting (::)
-- =========================================

SELECT 1::BOOLEAN;
SELECT 'true'::BOOLEAN;
SELECT 'false'::BOOLEAN;
SELECT '0'::BOOLEAN;

-- Invalid (will cause error)
-- SELECT 'dfd'::BOOLEAN;

-- =========================================
-- END
-- =========================================
*/