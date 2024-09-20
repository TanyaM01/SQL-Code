SELECT * FROM parks_and_recreation.employee_demographics;
SELECT * FROM employee_salary;

SELECT first_name, last_name, birth_date, age, (age+10) * 10 + 10 FROM employee_demographics;
# PEMDAS 

SELECT DISTINCT gender FROM parks_and_recreation.employee_demographics;