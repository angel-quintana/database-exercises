-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.
USE employees;
SELECT *
FROM employees
JOIN dept_emp
	using (emp_no)
WHERE hire_date = 
		(SELECT hire_date
		FROM employees
		WHERE emp_no = 101010)
AND to_date > NOW();
-- 2. Find all the titles ever held by all current employees with the first name Aamod.
USE employees;
SELECT emp_no, title
FROM titles
WHERE 
emp_no IN (SELECT emp_no FROM employees WHERE first_name= 'Aamod') 
AND emp_no IN (SELECT emp_no FROM dept_emp WHERE to_date > NOW()) 

order by emp_no desc
;
                    
                    
	;
-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT distinct emp_no FROM dept_emp WHERE to_date < NOW();
SELECT COUNT(*)
FROM employees 
WHERE emp_no 
NOT IN 
	(SELECT distinct emp_no 
    FROM dept_emp 
    WHERE to_date > NOW());-- 59900

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT d.dept_name AS Department_managed_by_woman, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' and e.gender = 'F'
ORDER BY d.dept_name;-- LEON DASSARMA, ISAMU LEGLEITNER, KARSTEN SIGSTAM, HILARY KAMBIL

-- 5. Find all the employees who currently have a higher salary than the companie's overall, historical average salary.

SELECT COUNT(*)
from salaries
where to_date> NOW() AND
salary > (SELECT AVG(salary) FROM salaries);


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built-in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
SELECT std(salary) -- current 1 std 17309
FROM salaries
WHERE to_date> NOW();

SELECT MAX(salary) -- current highest sal
FROM salaries
WHERE to_date> NOW();

SELECT MAX(salary)- STD(salary) -- CUTOFF
FROM salaries
where to_date> NOW();

SELECT COUNT(*) -- 83 salaries within 1 SD of MAX
FROM salaries 
WHERE salary >= 
				(
				SELECT MAX(salary)- STD(salary)
				FROM salaries
				where to_date> NOW()
				)
AND to_date > NOW();

USE employees;
SELECT 
(
SELECT COUNT(*) -- 83 salaries within 1 SD of MAX
FROM salaries 
WHERE salary >= 
				(
				SELECT MAX(salary)- STD(salary)
				FROM salaries
				where to_date> NOW()
				)
AND to_date > NOW()
)
/
(SELECT COUNT(*) FROM salaries WHERE to_date > NOW())
*100;

