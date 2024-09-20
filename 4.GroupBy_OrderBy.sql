-- GROUP BY
SELECT * FROM employee_demographics;
SELECT gender FROM employee_demographics GROUP BY gender;
SELECT first_name FROM employee_demographics GROUP BY gender;
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;
SELECT gender, AVG(age), MAX(Age), Min(age), COUNT(age) FROM employee_demographics GROUP BY gender;

SELECT * FROM employee_salary;
SELECT occupation, salary FROM employee_salary GROUP BY occupation, salary;


-- ORDER BY
SELECT * from employee_demographics ORDER BY first_name; #by default in ascending
SELECT * from employee_demographics ORDER BY first_name DESC; 
SELECT * from employee_demographics ORDER BY gender, age DESC; 