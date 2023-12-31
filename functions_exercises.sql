#2 Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name
select database();
use employees;
SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM employees
WHERE last_name LIKE 'E%E';

#3 Convert the names produced in your last query to all uppercase.
SELECT UPPER(concat(first_name,' ',last_name)) full_name
FROM employees
WHERE last_name LIKE 'E%E';

#4 Use a function to determine how many results were returned from your previous query.
SELECT COUNT(UPPER(concat(first_name,' ',last_name))) as rows_returned
FROM employees
WHERE last_name LIKE 'E%E';

#5 Find all employees hired in the 90s and born on Christmas. 
-- Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),
SELECT first_name, last_name, birth_date, hire_date, datediff(NOW(),hire_date) as num_days_at_company
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%%%%-12-25';


#6 Find the smallest and largest current salary from the salaries table.
select max(salary), min(salary)
from salaries
where salaries.to_date > NOW();

#7 Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born.
-- Below is an example of what the first 10 rows will look like:
SELECT 
	CONCAT(
    LOWER(SUBSTR(first_name,1,1)), LOWER(SUBSTR(last_name,1,4)), '_',SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) AS username,
    first_name,
    last_name,
    birth_date
FROM employees
limit 10;
 