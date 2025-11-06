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





