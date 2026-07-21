/*
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions. 
*/

-- Table-Level Events:
-- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
-- Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

-- create a trigger function when any data is delete. so deleted data will be store into another table.
CREATE TABLE deleted_emplooyees_info (
    employee_id INT,
    employee_name VARCHAR(50),
    deleted_time TIMESTAMP
);

-- create trigger function for save deleted user
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO deleted_emplooyees_info VALUES(OLD.employee_id, OLD.employee_name, current_timestamp);
RAISE NOTICE 'Deleted employee saved succesfuly!';
RETURN OLD;
END;
$$


-- create trigger

CREATE OR REPLACE TRIGGER store_deleted_info BEFORE DELETE ON employees FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

-- see deleted employees
SELECT * FROM deleted_emplooyees_info;
-- see all employees
SELECT * FROM employees;

-- after delete employees table data then store it into depeted_employees_info table
DELETE FROM employees WHERE employee_id = 28;

-- --------------deep understanding needed here and explore it--------------------

-- -----------------From gpt for note-------------------------------

-- =========================================
-- WHAT IS A TRIGGER?
-- =========================================
-- A trigger is a special type of stored program in a database
-- that automatically executes (fires) when a specific event occurs.

-- =========================================
-- WHEN DOES A TRIGGER RUN?
-- =========================================

-- A trigger runs automatically on:
-- ✔ INSERT
-- ✔ UPDATE
-- ✔ DELETE

-- =========================================
-- WHY DO WE USE TRIGGERS?
-- =========================================

-- 1. Automation
-- Automatically perform actions without manual queries.

-- 2. Data Integrity
-- Helps enforce rules and maintain consistency in data.

-- 3. Auditing / Logging
-- Track changes (who changed what and when).

-- 4. Validation
-- Prevent invalid data from being inserted or updated.

-- 5. Business Logic
-- Apply rules automatically inside the database.

-- =========================================
-- TYPES OF TRIGGERS
-- =========================================

-- BEFORE Trigger:
-- Runs before the operation (INSERT/UPDATE/DELETE)

-- AFTER Trigger:
-- Runs after the operation is completed

-- =========================================
-- BASIC SYNTAX (PostgreSQL)
-- =========================================

-- Step 1: Create Trigger Function

CREATE OR REPLACE FUNCTION trigger_function_name()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    -- logic here
    RETURN NEW;
END;
$$;

-- Step 2: Create Trigger

CREATE TRIGGER trigger_name
BEFORE INSERT OR UPDATE OR DELETE
ON table_name
FOR EACH ROW
EXECUTE FUNCTION trigger_function_name();

-- =========================================
-- IMPORTANT KEYWORDS
-- =========================================

-- NEW:
-- Refers to the new row being inserted or updated

-- OLD:
-- Refers to the existing row before update or delete

-- =========================================
-- WHEN TO USE TRIGGERS?
-- =========================================

-- ✔ When automatic action is required
-- ✔ When enforcing rules at database level
-- ✔ When tracking changes (audit logs)
-- ✔ When validating data before insert/update

-- =========================================
-- DISADVANTAGES
-- =========================================

-- ✖ Hard to debug
-- ✖ Hidden logic (runs automatically)
-- ✖ Can affect performance if overused

-- =========================================
-- SHORT SUMMARY
-- =========================================

-- Trigger = Automatic action on data change
-- (INSERT / UPDATE / DELETE)