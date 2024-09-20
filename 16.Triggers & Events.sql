-- Triggers and Events

-- Trigger is a block of code that executes automatically when an event takes place on a specific table


SELECT * 
from employee_demographics;
SELECT *
from employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert   
	AFTER INSERT ON employee_salary  -- after a row is inserted into emp salary table, for each row following is going to happen
    FOR EACH ROW
BEGIN -- we are going to insert into emp demographics , columns(employee_id, first_name, last_name)
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); -- NEW means the data that is inserted in emp salary
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Tanya', 'Maurya', 'Entertainment 720 CEO',100000, NULL) ;


-- EVENTS
-- event takes place when it is scheduled
-- create an event that checks every day and then if they are over a specific age, we are going to delete them from the table nd they will be retired

SELECT * from employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    where age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%' ;