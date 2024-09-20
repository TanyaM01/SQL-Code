-- Stored Procedures
-- way to save sql code so that u can reuse again and again


CREATE PROCEDURE  large_salaries()
SELECT * 
from employee_salary
where salary >= 50000;

CALL large_salaries();
-- check LHS, displays (Stored Procedures->large_salaries)
-- click lightining symbol besides large_salaries, a new window open which shows| call parks_and_recreation.large_salaries();


DELIMITER $$
CREATE PROCEDURE  large_salaries4()
BEGIN
	SELECT * 
	from employee_salary
	where salary >= 50000;
	SELECT * 
	from employee_salary
	where salary >= 10000;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE large_salaries4()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;

	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;
CALL large_salaries4();



-- parameters- are variables that are passed as an input into stored procedure

DELIMITER $$
CREATE PROCEDURE large_salaries6(emp_id_param INT)
BEGIN
	SELECT salary 
	FROM employee_salary
    where employee_id = emp_id_param
    ;
END $$
DELIMITER ;

Call large_salaries6(1)