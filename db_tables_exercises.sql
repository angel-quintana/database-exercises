SHOW databases;
USE albums_db;
SELECT database();
SHOW TABLES;
USE employees;
Select database();
SHOW tables;
Describe employees;
Describe dept_manager;
Describe departments;
Describe dept_emp;
Describe salaries;
Describe titles;
Show create table dept_manager;

#Which table(s) do you think contain a numeric type column? Salaries
#Which table(s) do you think contain a string type column? Titles, employees
#Which table(s) do you think contain a date type column? dept_manager
#What is the relationship between the employees and the departments tables? no relation

-- CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1