
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

--CATEGORY 2 — MULTI-CONDITION JOINS

--Q4. Join orders and customers only if city is NYC.
  
SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
 AND c.city = 'NYC';

--Q5. Match only orders above $150 made by NYC customers.

SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id 
 AND o.amount > 150 
 AND c.city = 'NYC';

--Q6. Join with date + customer_id multiple conditions.


SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
 AND o.order_date > '2023-01-01';

--CATEGORY 3 — FILTER BEFORE vs AFTER JOIN

--Q7. Find customers who ordered in 2023.

SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.order_date >= '2023-01-01';

--Q8. Get customers from NYC with all their orders.

SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
WHERE c.city = 'NYC';

--Q9. Get orders above $150 (filter after join).

SELECT c.customer_name, o.amount
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.amount > 150;

--CATEGORY 4 — INNER JOIN + AGGREGATION

--Q10. Total amount spent by each customer.

SELECT c.customer_name, SUM(o.amount) AS total_spend
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--Q11. Number of orders per customer.

SELECT c.customer_name, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--Q12. Average order amount by city.

SELECT c.city, AVG(o.amount) AS avg_amount
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.city;

--CATEGORY 5 — JOIN + WINDOW FUNCTIONS

--Q13. Get each customer’s latest order.

WITH ranked AS (
  SELECT o.*, 
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
  FROM orders o
)
SELECT r.*
FROM ranked r
WHERE rn = 1;

--Q14. Rank all orders for each customer.

SELECT o.*, 
       RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank_amount
FROM orders o;

--CATEGORY 6 — MULTI-TABLE JOINS (3–4 TABLES)

--Q16. Get customer, order, product name.

SELECT c.customer_name, o.order_id, p.product_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

--Q17. Total quantity each customer bought.

SELECT c.customer_name, SUM(oi.qty) AS total_qty
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name;












