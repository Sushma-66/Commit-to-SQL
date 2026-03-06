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
