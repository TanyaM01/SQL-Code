-- Window FUnctions

SELECT gender , AVG(salary) OVER(PARTITION By gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender , AVG(salary) OVER(PARTITION By gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender , salary,
SUM(salary) OVER(PARTITION By gender order by dem.employee_id) as Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;


Select* from employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
    
    
SELECT dem.employee_id, dem.first_name, dem.last_name, gender , salary,
ROW_NUMBER() OVER(partition by gender order by salary desc) as row_num,
RANK() OVER(partition by gender order by salary desc) as rank_num,
dense_rank() OVER(partition by gender order by salary desc) as dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;