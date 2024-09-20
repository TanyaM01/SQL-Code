-- Subqueries
select * from employee_demographics;
Select * from employee_salary;
select * from parks_departments;



SELECT *
from employee_demographics
where employee_id IN 
				 (Select employee_id
                 From employee_salary
                 where dept_id = 1);
                 
                 
select first_name, salary, 
(select Avg(salary) 
from employee_salary)
from employee_salary;

SELECT  gender, AVG(age), MAX(age), MIN(age), count(age)
from employee_demographics
group by gender;

SELECT gender, AVG(`MAX(age)`)
FROM
(SELECT  gender, AVG(age), MAX(age), MIN(age), count(age)
from employee_demographics
group by gender) as Agg_table
group by gender;



SELECT  AVG(max_age)
FROM
(SELECT  gender, 
AVG(age) as avg_age, 
MAX(age) as max_age, 
MIN(age) as min_age, 
count(age)
from employee_demographics
group by gender) as Agg_table
;