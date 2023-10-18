-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name
SELECT CONCAT('first_name', 'last_name')
FROM employees
WHERE last_name LIKE 'E%E'



-- Convert the names produced in your last query to all uppercase.

-- Use a function to determine how many results were returned from your previous query.

-- Find all employees hired in the 90s and born on Christmas. 
-- Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),

-- Find the smallest and largest current salary from the salaries table.

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.
-- Below is an example of what the first 10 rows will look like: