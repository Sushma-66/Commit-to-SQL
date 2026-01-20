--JOINS 

--beginner level in joins 

--customer's table                             
--| customer_id | name  | city     |
--| ----------- | ----- | -------- |
--| 1           | Alice | New York |
--| 2           | Bob   | Chicago  |
--| 3           | Carol | Miami    |

--orders
--| order_id | customer_id | product    | amount |
--| -------- | ----------- | ---------- | ------ |
--| 101      | 1           | Laptop     | 1200   |
--| 102      | 2           | Phone      | 800    |
--| 103      | 1           | Headphones | 150    |

--Products

--| product_id | product_name | price |
--| ---------- | ------------ | ----- |
--| 1          | Laptop       | 1200  |
--| 2          | Phone        | 800   |
--| 3          | Headphones   | 150   |

--INNER JOINS 
-- 1. Show all customer names and their order IDs

SELECT c.name, o.order_id
FROM Customers AS c
INNER JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--2. Show customer names and the products they ordered

SELECT c.name, o.product
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--3. Show order IDs along with the customer’s city

SELECT o.order_id, c.city
FROM Orders AS o
JOIN Customers AS c
  ON o.customer_id = c.customer_id;


--4. List all orders and include both customer name and order amount

SELECT o.order_id, c.name, o.amount
FROM Orders AS o
JOIN Customers AS c
  ON o.customer_id = c.customer_id;

--5. Show each customer’s name and product ordered, only for those who have placed orders

SELECT c.name, o.product
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--LEFT JOIN
--6. Show all customers and their orders (include customers who haven’t ordered anything)

SELECT c.name, o.order_id
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--7. Show all customers and their order amounts; if they haven’t ordered, show NULL

SELECT c.name, o.amount
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--8.Show all products and the customers who bought them (if any)

SELECT p.product_name, c.name
FROM Products AS p
LEFT JOIN Orders AS o
  ON p.product_name = o.product
LEFT JOIN Customers AS c
  ON o.customer_id = c.customer_id;

--9.Show each customer and the number of orders they placed

SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--10.Show all customers and cities, along with order details if they have any

SELECT c.name, c.city, o.product, o.amount
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--RIGHT JOIN 

--11. Show all orders and their customers, even if a customer record is missing

SELECT o.order_id, c.name
FROM Customers AS c
RIGHT JOIN Orders AS o
  ON c.customer_id = o.customer_id;

--12.Show all products and corresponding order information, even if no one ordered that product

SELECT p.product_name, o.order_id, c.name
FROM Orders AS o
RIGHT JOIN Products AS p
  ON p.product_name = o.product
LEFT JOIN Customers AS c
  ON o.customer_id = c.customer_id;

--FULL OUTER JOIN

-- 13. List all customers and all orders — show matches where they exist and NULLs otherwise

SELECT c.name, o.order_id
FROM Customers AS c
FULL OUTER JOIN Orders AS o
  ON c.customer_id = o.customer_id;

️--14 Show all customers and all products — include customers with no orders and products never bought

SELECT c.name, p.product_name
FROM Customers AS c
FULL OUTER JOIN Orders AS o
  ON c.customer_id = o.customer_id
FULL OUTER JOIN Products AS p
  ON o.product = p.product_name;

--INTERMEDIATE LEVEL IN JOINS QUESTIONS 

--1. Find each customer’s total amount spent (use SUM + GROUP BY).

SELECT c.name, SUM(o.amount) AS total_spent
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--2. Show customers who spent more than 1000 total.

SELECT c.name, SUM(o.amount) AS total_spent
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 1000;

--3. Show each city’s total sales amount.

SELECT c.city, SUM(o.amount) AS total_sales
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.city;

--4. Show customers and their most expensive order.
SELECT c.name, MAX(o.amount) AS highest_order
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--5. List all customers and how many distinct products they’ve ordered.
SELECT c.name, COUNT(DISTINCT o.product) AS num_products
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--6. Show customers who have never ordered anything.
SELECT c.name
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--7. Show products that have never been ordered.

SELECT p.product_name
FROM Products AS p
LEFT JOIN Orders AS o
  ON p.product_name = o.product
WHERE o.order_id IS NULL;

--8.Show customers and their total order count, including those with zero orders.

SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--9.Find the average order amount per customer.

SELECT c.name, AVG(o.amount) AS avg_order_value
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.name;

--10.Find customers who ordered both a Laptop and a Phone.

SELECT c.name
FROM Customers AS c
JOIN Orders AS o
  ON c.customer_id = o.customer_id
WHERE o.product IN ('Laptop', 'Phone')
GROUP BY c.name
HAVING COUNT(DISTINCT o.product) = 2;
--11. Show total revenue generated by each product (using Products table for price validation).

SELECT p.product_name, SUM(o.amount) AS total_revenue
FROM Products AS p
LEFT JOIN Orders AS o
  ON p.product_name = o.product
GROUP BY p.product_name;

--12.Show each employee’s city and total sales in their city.
SELECT e.emp_name, e.city, SUM(o.amount) AS city_sales
FROM Employees AS e
JOIN Customers AS c
  ON e.city = c.city
JOIN Orders AS o
  ON c.customer_id = o.customer_id
GROUP BY e.emp_name, e.city;

--13.Show customers who live in the same city as any employee
SELECT DISTINCT c.name, c.city
FROM Customers AS c
INNER JOIN Employees AS e
  ON c.city = e.city;

--JOINS INTERMEDIATE LEVEL 

-- Q1: Find all customers who purchased items from more than one distinct
-- product category. Return customer name and number of categories.

SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(DISTINCT p.category) AS category_count
FROM Customers c
JOIN Orders o 
    ON c.customer_id = o.customer_id
JOIN OrderItems oi 
    ON o.order_id = oi.order_id
JOIN Products p 
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT p.category) > 1;

-- Q2: List employees whose salary is greater than the average salary 
-- of their department. Return employee name, dept name, salary, and dept avg salary.

SELECT 
    e.emp_id,
    e.name AS employee_name,
    d.dept_name,
    e.salary,
    dept_stats.avg_salary AS dept_avg_salary
FROM Employees e
JOIN Departments d 
    ON e.dept_id = d.dept_id
JOIN (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
) AS dept_stats 
    ON e.dept_id = dept_stats.dept_id
WHERE e.salary > dept_stats.avg_salary;


-- Q3: Return all flights that have never been booked.

SELECT 
    f.flight_id,
    f.flight_number,
    f.origin,
    f.destination
FROM Flights f
LEFT JOIN Bookings b 
    ON f.flight_id = b.flight_id
WHERE b.booking_id IS NULL;

-----

--1. Sales & City Matching

--From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

--Sample table: salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12
Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005


solution: 
-- This query selects specific columns ('salesman.name' with alias "Salesman", 'customer.cust_name', and 'customer.city') 
-- from the 'salesman' and 'customer' tables.
-- It retrieves data where the 'city' column in the 'salesman' table matches the 'city' column in the 'customer' table.
SELECT salesman.name AS "Salesman", customer.cust_name, customer.city
-- Specifies the tables from which to retrieve the data (in this case, 'salesman' and 'customer').
FROM salesman, customer
-- Specifies the condition for joining the tables and filtering the data.
WHERE salesman.city = customer.city;

--2. Join All Tables Uniquely

--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

--Sample table: orders

ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
70007       948.5       2012-09-10  3005         5002
70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
....
--View the table

--Sample table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
--Sample table : salesman

 salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

solution:
-- Selecting all columns from the result of natural joins between three tables: 'orders', 'customer', and 'salesman'
SELECT * 
-- Performing a natural join between 'orders' and 'customer' tables
FROM orders 
NATURAL JOIN customer  
-- Performing another natural join with the result of the previous join and the 'salesman' table
NATURAL JOIN salesman;

