--JOINS 

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





