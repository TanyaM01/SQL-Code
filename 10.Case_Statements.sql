-- Case Statements
# allows logic in select statement

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'young'
    WHEN age BETWEEN 31 and 50 THEN 'old'
    WHEN age >= 50 THEN 'On death DOor'
END AS Age_Bracket
FROM employee_demographics;

# Pay Increase
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% Bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)    
END AS New_Salary,
CASE 
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
from employee_salary;