--1 
WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
)

SELECT 
    customer_id,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 1;
--2
WITH customer_totals AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
)

SELECT 
    c.customer_name,
    ct.total_spent
FROM customer_totals ct
JOIN Customers c
    ON ct.customer_id = c.customer_id
ORDER BY ct.total_spent DESC;
--3
WITH product_totals AS (
    SELECT 
        product_id,
        SUM(sale_amount) AS total_sales
    FROM Sales
    GROUP BY product_id
)

SELECT 
    product_id,
    total_sales
FROM product_totals
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM product_totals
);
--4
WITH it_employees AS (
    SELECT name, salary
    FROM employees
    WHERE department = 'IT'
)

--5
    SELECT name, salary
FROM it_employees;
WITH RECURSIVE emp_hierarchy AS (
    SELECT emp_id, name, manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.name, e.manager_id
    FROM employees e
    JOIN emp_hierarchy h
    ON e.manager_id = h.emp_id
)
SELECT * FROM emp_hierarchy;
--6 
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)

SELECT e.name, e.department, e.salary
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;
