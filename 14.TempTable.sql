-- Temporary Tables 
/*if i create a temp table now and i exit out of mysql, and i come back in, it's not gonna be there*/

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie  varchar(100)
);

Select * 
from temp_table;

INSERT INTO temp_table
VALUES('Alex', 'Freberg', 'Lord of the rings;');

SELECT * 
from temp_table;

Select * from employee_salary;

CREATE Temporary table salary_over_50k
Select * 
from employee_salary
where salary >=50000; 

Select * from salary_over_50k