-- Limit & Aliasing

SELECT * from employee_demographics LIMIT 3;

# find 3 oldest employee
SELECT * from employee_demographics 
ORDER BY age DESC
LIMIT 3;

SELECT * 
from employee_demographics 
ORDER BY age DESC
LIMIT 2, 1;
# start at position 2 and then 1 row after it

SELECT * 
from employee_demographics 
ORDER BY age DESC
LIMIT 2, 1;


-- Aliasing
# to change the name of the column

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;