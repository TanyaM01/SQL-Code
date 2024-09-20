-- CTEs Common Table Expression
-- more readable than subqueries

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_sal) AS
(
Select gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
Group by gender
)
Select *
from CTE_Example
;


WITH CTE_Example AS 
(
Select gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
Group by gender
)
Select AVG(avg_sal)
from CTE_Example
;

-- same thing using subquery
Select AVG(avg_sal)
FROM (Select gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
Group by gender
) example_subquery
;


--
WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM employee_salary
Where salary > 50000
)
Select *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;