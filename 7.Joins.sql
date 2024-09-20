-- JOINS

#INNER JOIN
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    

# OUTER JOIN -> LEFT JOIN & RIGHT JOIN

# LEFT JOIN
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
#OUTER JOIN
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
    
    
# SELF JOIN
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id  = emp2.employee_id;
    
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id;
    
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id;
    
    
## JOINING MULTIPLE TABLES

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id ;
INNER JOIN parks_departments  pd
	ON sal.dept_id = pd.department_id
;
    
Select * from parks_departments;
