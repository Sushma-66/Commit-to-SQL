-- 1 WITH customer_spending AS (
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
