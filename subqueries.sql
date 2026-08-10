--1. Find employees who earn more than the average salary.
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);


--2. WITH customer_totals AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
)

SELECT 
    customer_id,
    total_spent
FROM customer_totals
WHERE total_spent > 80;

--3. WITH dept_avg_salary AS (
    SELECT 
        department,
        AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
)

SELECT 
    department,
    avg_salary
FROM dept_avg_salary
WHERE avg_salary > 60000;

--4employees(emp_id, name, dept_id, salary, manager_id)
--departments(dept_id, dept_name)
--Find every department where all employees earn more than the company-wide average salary. Return dept_name. A department with zero employees should not be returned.
SELECT d.dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
      AND e.salary <= (SELECT AVG(salary) FROM employees)
)
AND EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.dept_id = d.dept_id
);
