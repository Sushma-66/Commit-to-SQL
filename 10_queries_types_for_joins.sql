--customers
--| customer_id | customer_name | city |
--| ----------- | ------------- | ---- |
--| 1           | John          | NYC  |
--| 2           | Sarah         | LA   |
--| 3           | Mike          | NYC  |

--orders
| order_id | customer_id | amount | order_date |
--| -------- | ----------- | ------ | ---------- |
--| 101      | 1           | 200    | 2023-01-01 |
--| 102      | 1           | 150    | 2023-02-10 |
--| 103      | 2           | 300    | 2023-03-05 |
--| 104      | 4           | 120    | 2023-04-01 |

  --order_items
-- item_id | order_id | product_id | qty |
--| ------- | -------- | ---------- | --- |
--| 1       | 101      | 501        | 2   |
--| 2       | 101      | 502        | 1   |
--| 3       | 102      | 501        | 1   |
--| 4       | 103      | 503        | 4   |

--Catergory 1 - Simple inner joins

--Q1. Get all customers who placed orders.

  SELECT c.customer_name, o.order_id
FROM customers c
INNER JOIN orders o
  ON c.customer_id = o.customer_id;

--Q2. Get order_id and customer city.


SELECT o.order_id, c.city
FROM orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id;

--Q3. List customers and their order amounts.

SELECT c.customer_name, o.amount
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id;


