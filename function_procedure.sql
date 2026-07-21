-- get all employees
SELECT * FROM employees;

-- insert data using procedure function
CREATE PROCEDURE add_employee (p_employee_name VARCHAR(50), p_department_name VARCHAR(50), p_salary NUMERIC(10,2), p_hire_date DATE)
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO employees(employee_name, department_name, salary, hire_date) VALUES(p_employee_name, p_department_name, p_salary, p_hire_date);
END;
$$;
-- calling procedure func to insert data and pass value by param
CALL add_employee ( 'Harry John', 'HR', 64000.00, '2025-07-06' );

-- use variable in procedure func
-- delete the given param id data
-- use RAISE NOTICE
CREATE PROCEDURE cut_employee_by_id (p_employee_id INT) LANGUAGE plpgsql AS
$$

DECLARE employee_id_var INT;
BEGIN
-- select param given employee id and store / into value in employee_id_var
SELECT employee_id INTO employee_id_var FROM employees WHERE employee_id =  p_employee_id;
-- then delete this employee by employee_id_var
DELETE FROM employees WHERE employee_id = employee_id_var;
RAISE NOTICE 'Employee delete succesfuly!';
END;
$$;

-- delete the employee by passing employee_id value in procedure func
CALL cut_employee_by_id (29);

-- -------------From gpt for note-----------------------------
-- =========================================
-- STORED PROCEDURE vs FUNCTION
-- =========================================

-- FUNCTION:
-- A function is a reusable block of SQL code that returns a value
-- or a set of rows.
-- It is mainly used for calculations, fetching data, and reusable logic.

-- PROCEDURE:
-- A procedure is a stored block of SQL code that performs an action.
-- It does not need to return a value.
-- It is mainly used for INSERT, UPDATE, DELETE operations.

-- =========================================
-- FUNCTION vs PROCEDURE
-- =========================================

-- Function:
-- ✔ Returns value or rows
-- ✔ Can be used with SELECT
-- ✔ Used for calculations and data retrieval
-- ✔ Supports RETURN statement

-- Procedure:
-- ✔ Does not need to return value
-- ✔ Called using CALL
-- ✔ Used for performing actions
-- ✔ Supports transaction control (COMMIT, ROLLBACK)

-- =========================================
-- WHEN TO USE FUNCTION?
-- =========================================

-- ✔ When you need to calculate something
-- ✔ When you need to return data
-- ✔ When the same query logic is used repeatedly
-- ✔ When you need reusable SELECT logic

-- =========================================
-- WHEN TO USE PROCEDURE?
-- =========================================

-- ✔ When performing INSERT operations
-- ✔ When performing UPDATE operations
-- ✔ When performing DELETE operations
-- ✔ When handling multiple database operations together

-- =========================================
-- BASIC SYNTAX
-- =========================================

-- FUNCTION SYNTAX:

CREATE FUNCTION function_name(parameters)
RETURNS return_type
LANGUAGE SQL
AS
$$
    SQL QUERY
$$;

-- PROCEDURE SYNTAX:

CREATE PROCEDURE procedure_name(parameters)
LANGUAGE SQL
AS
$$
    SQL QUERY
$$;

-- =========================================
-- CALLING METHOD
-- =========================================

-- Function:
-- SELECT function_name();

-- Procedure:
-- CALL procedure_name();

-- =========================================
-- SHORT SUMMARY
-- =========================================

-- Function = Return data / Calculate something
-- Procedure = Perform an action / Change data

-- Function -> SELECT
-- Procedure -> CALL