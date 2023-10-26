## 1. Create a new SQL script named limit_exercises.sql.


## 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
## 	  For example, to find all the unique titles within the company, we could run the following query:
SELECT DISTINCT title FROM titles;
##    List the first 10 distinct last names sorted in descending order
SELECT database();
USE employees;
SELECT DISTINCT last_name
FROM employees 
ORDER BY last_name DESC
LIMIT 10;

## 3. Find all previous or current employees hired in the 90s and born on Christmas. 
##    Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
##    Write a comment in your code that lists the five names of the employees returned.

SELECT CONCAT(first_name,' ', last_name) as full_name, birth_date, hire_date
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%%%%-12-25'
    Order by hire_date desc
    LIMIT 5; #Ulf Pehl, Moto Siegrist, Sachar Ghalwash, Elvis Goodrum, Khun Bernini
    
# 4.	Try to think of your results as batches, sets, or pages. 
# 		The first five results are your first page. 
#		The five after that would be your second page, etc. 
#		Update the query to find the tenth page of results.

SELECT CONCAT(first_name,' ', last_name) as full_name, birth_date, hire_date
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%%%%-12-25'
    Order by hire_date desc
    LIMIT 5 OFFSET 45;

 
