-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SHOW databases;
USE employees;
SELECT database();
SHOW tables;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
/*
Irena Reutenauer in first row
Vidya Simmen in last row
*/

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name ;
/*
Irena Acton first, Vidya Zweizig last
*/

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name ;
/*
Irena Acton first, Maya Zyda last
*/

-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number. 
-- Enter a comment with the number of employees returned, the first employee number and their first and last name, 
-- and the last employee number with their first and last name.
SELECT distinct emp_no, last_name, first_name
FROM employees
WHERE last_name LIKE 'E%E'
Order by emp_no;
/*
899 employees returned; Ramzi Erde emp_no 10021 first; Tadahiro Erde emp_no 499648 last
*/

-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first. 
-- Enter a comment with the number of employees returned, the name of the newest employee, 
-- and the name of the oldest employee.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE last_name LIKE 'E%E'
Order by hire_date DESC;
/*
899 employees returned; Teiji Eldridge newest; Sergi Erde oldest
*/


-- Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, 
-- and the name of the youngest employee who was hired first.
SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%%%%-12-25'
    Order by birth_date asc , hire_date desc;
/*
362 employees returned, Khun Bernini, Douadi Pettis
*/
