-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- What is the employee number of the top three results?
SHOW databases;
USE employees;
SELECT database();
SHOW tables;
SELECT *
FROM employees;
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
/*
499750, 499588, 497788
*/

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q1, but use OR instead of IN. 
-- What is the employee number of the top three results?
-- Does it match the previous question?
SELECT *
FROM employees
	WHERE first_name = 'Irena' 
    or first_name = 'Vidya'
    or first_name = 'Maya';
/*
10200, 10397, 10610
Does not match previous question.
*/

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
-- What is the employee number of the top three results?

SELECT *
FROM employees
	WHERE gender = 'M'
    AND (first_name = 'Irena' 
    or first_name = 'Vidya'
    or first_name = 'Maya');
/*
10200, 10397, 10821
*/

-- Find all unique last names that start with 'E'.
SELECT Distinct last_name
FROM employees
WHERE last_name LIKE 'E%' ;

-- Find all unique last names that start or end with 'E'
SELECT Distinct last_name
FROM employees
WHERE last_name LIKE 'E%' 
	or last_name LIKE '%E'
   ;

-- Find all unique last names that end with E, but does not start with E?
SELECT Distinct last_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name NOT LIKE 'E%'
   ;

-- Find all unique last names that start and end with 'E'
SELECT Distinct last_name
FROM employees
WHERE last_name LIKE 'E%E';

-- Find all current or previous employees hired in the 90s. 
-- Enter a comment with the top three employee numbers.
SELECT *
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31';
/*
10008, 10011, 10012
*/

-- Find all current or previous employees born on Christmas. 
-- Enter a comment with the top three employee numbers.
SELECT *
FROM employees
WHERE birth_date like '%%%%-12-25';
/*
10078, 10115, 10261
*/

-- Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with the top three employee numbers.
SELECT *
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%%%%-12-25';
/*
10261, 10438, 10681
*/

-- Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%Q%';

-- Find all unique last names that have a 'q' in their last name but not 'qu'
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%Q%' 
and last_name NOT LIKE '%QU%';