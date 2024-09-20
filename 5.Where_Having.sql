SELECT occupation, AVG(salary)
FROM employee_salary
where occupation LIKE '%manager%'
GROUP BY occupation;
HAVING AVG(salary) > 75000

# having is only going to work for aggregated functions after the group by actually works