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

--INTERMEDIATE LEVEL IN JOINS 

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





