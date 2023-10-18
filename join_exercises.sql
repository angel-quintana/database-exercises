-- Use the join_example_db. Select all the records from both the users and roles tables.
show databases;
USE join_example_db;
show tables;
describe roles;
describe users;
SELECT * FROM roles ;
SELECT * FROM users;
SELECT * FROM salaries;



-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.
-- Before you run each query, guess the expected number of results.
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that have the role. 
-- Hint: You will also need to use group by in the query.
SELECT roles.name, count(*)
FROM users
right join roles ON users.role_id = roles.id
group by roles.name;

-- 1. Use the employees database.
USE employees;
SHOW tables;
SELECT *
FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM titles;
describe departments;
-- 2. Using the example in the Associative Table Joins section as a guide,
--    write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS Department, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;


-- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name AS Department_managed_by_woman, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' and e.gender = 'F'
ORDER BY d.dept_name;


-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT COUNT(*) AS cnt, t.title
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN titles AS t
  ON t.emp_no = de.emp_no
JOIN departments as dm
  ON dm.dept_no= de.dept_no
WHERE de.to_date = '9999-01-01' and de.dept_no = 'd009'
group by title
ORDER BY title;

-- 5. Find the current salary of all current managers.
SELECT d.dept_name AS Department, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager , s.salary
FROM employees AS e
	JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
		JOIN departments AS d
		ON d.dept_no = dm.dept_no
			JOIN salaries as s
			ON s.to_date= dm.to_date and s.emp_no = dm.emp_no
			
WHERE dm.to_date = '9999-01-01' 
ORDER BY d.dept_name 
;

-- 6. Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name AS Department, count(*) AS num_employees
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY d.dept_no;


-- 7. Which department has the highest average salary? Hint: Use current not historic information.
USE employees;
SELECT d.dept_name AS Department
	  ,(sum(s.salary)/ count(*)) as avg_sal
FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
		JOIN departments AS d
		ON d.dept_no = de.dept_no
			JOIN salaries as s
			ON s.to_date= de.to_date and s.emp_no = de.emp_no
			
WHERE de.to_date = '9999-01-01' and s.to_date = '9999-01-01' 
group by (d.dept_name)
order by (sum(s.salary)/ count(*)) DESC
LIMIT 1
;
-- 8. Who is the highest paid employee in the Marketing department?
SELECT e.first_name, e.last_name 
from employees as e
	JOIN dept_emp as de
	ON e.emp_no = de. emp_no
	LEFT JOIN salaries as s
	ON s.emp_no = e.emp_no
    
WHERE de.dept_no = 'd001' and de.to_date > NOW()
Order by s.salary DESC
LIMIT 1
;

-- 9. Which current department manager has the highest salary?
SELECT d.dept_name AS Department, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager , s.salary
FROM employees AS e
	JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
		JOIN departments AS d
		ON d.dept_no = dm.dept_no
			JOIN salaries as s
			ON s.to_date= dm.to_date and s.emp_no = dm.emp_no
			
WHERE dm.to_date = '9999-01-01' 
ORDER BY s.salary DESC
LIMIT 1
;
-- 10. Determine the average salary for each department. Use all salary information and round your results.
USE employees;
SELECT d.dept_name AS Department
	  ,ROUND(sum(s.salary)/ count(*), 0) as avg_sal
      
FROM salaries as s
	JOIN dept_emp as de
    ON de.emp_no = s.emp_no
    JOIN departments as d
    ON d.dept_no = de.dept_no
			
group by (Department)
order by avg_sal DESC

;
-- 

