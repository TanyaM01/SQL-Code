# UNION
-- UNION DISTINCT -> removes duplicate values 
-- UNION ALL -> Keeps duplicate vals too

SELECT first_name, last_name
FROM employee_demographics
UNION distinct
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old' as Label
From employee_demographics
where age> 50
UNION
SELECT first_name, last_name, 'Highly Paid Employee' as Label
FROM employee_salary
where salary > 70000;

SELECT first_name, last_name, 'Old Man' as Label
From employee_demographics
where age> 40 and gender = 'male'
UNION
SELECT first_name, last_name, 'Old Lady' as Label
From employee_demographics
where age> 40 and gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' as Label
FROM employee_salary
where salary > 70000
ORDER BY first_name;

