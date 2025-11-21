--1. Find employees who earn more than the average salary.
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

--2. List products that have a price higher than the price of product ID 10.
SELECT product_name, price
FROM products
WHERE price > (
    SELECT price FROM products WHERE product_id = 10
);

--3. Show students who scored higher than the minimum score in the class.
SELECT student_name, score
FROM students
WHERE score > (
    SELECT MIN(score) FROM students
);
--4. Find departments that have more employees than the IT department.

SELECT department_name
FROM departments
WHERE (
    SELECT COUNT(*) 
    FROM employees 
    WHERE employees.department_id = departments.department_id
) >
(
    SELECT COUNT(*) 
    FROM employees 
    WHERE department_id = 3   -- IT dept ID example
);
--5. Display customers who placed an order in 2024.
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE YEAR(order_date) = 2024
);
