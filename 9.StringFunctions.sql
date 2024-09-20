# STRING FUNCTIONS

SELECT length('skyfall')  ;
SELECT first_name, length(first_name)
FROM employee_demographics
order by 2;

SELECT UPPER('sky');
SELECT LOWER('sKy');
SELECT first_name, upper(first_name)
FROM employee_demographics;

SELECT TRIM('  sky    ');
SELECT LTRIM('      sky      ');
SELECT RTRIM('      sky      ');

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(birth_date, 6,2) as Birth_month
from employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z')
from employee_demographics;

SELECT LOCATE('x','Alexander');

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ', last_name)
FROM employee_demographics;
