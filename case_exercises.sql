-- 1. Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

USE employees;
SELECT 
	emp_no, 
	CONCAT( first_name, ' ', last_name) AS full_name,
    hire_date,
    to_date, 
    dept_name,
    IF(to_date > NOW(), 1, 0) AS is_current_employee
    
FROM employees
	JOIN dept_emp
		USING (emp_no)
	Join departments
		ON departments.dept_no = dept_emp.dept_no
Order BY emp_no
;

-- 2. Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
-- depending on the first letter of their last name.

USE employees;
SELECT 
	CONCAT( first_name, ' ', last_name) AS full_name,
	CASE WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
		 WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
         WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
    ELSE 'other'
    END AS Last_Initial
FROM employees
;

-- 3. How many employees (current or previous) were born in each decade?
Select
	CONCAT( first_name, ' ', last_name) AS full_name,
	(CASE WHEN birth_date like '195%' THEN '50s' END) as '50s',
	(CASE WHEN birth_date like '196%' THEN '60s' END) as '60s'
   FROM employees;
   
SELECT 
	COUNT((CASE WHEN birth_date like '195%' THEN '50s' END)) as '50s',
	COUNT((CASE WHEN birth_date like '196%' THEN '60s' END)) as '60s'
   FROM employees; -- 50s: 182886, 60s 117138

-- 4. What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
USE employees;

SELECT avg(salary),
   CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('human resources', 'finance') THEN 'Finance & HR'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       ELSE 'Customer Service'
   END AS dept_group
FROM departments
JOIN dept_emp
	USING(dept_no)
JOIN salaries
	USING (emp_no)
GROUP BY dept_group
;





