--LEVEL 1 — Basic Understanding

  --Q1. Show all columns from the table students.

SELECT *
FROM students;

--Q2. Show the name and age of all employees from the employees table.

SELECT name, age
FROM employees;

--Q3. Show the names of employees from employees table whose salary is greater than 50,000.

SELECT name
FROM employees
WHERE salary > 50,000;

--LEVEL 2 — Adding Order and Multiple Conditions

--Q4.List all students (show name and score) from students table where score is more than 80, and show them in descending order of score.

SELECT name,score
FROM students
Where score > 80
ORDER BY score DESC;

--Q5.Show names of employees who work in the Sales department and have a salary greater than 60,000.

SELECT name
FROM employees
WHERE department = 'sales'
and salary >60,000;


