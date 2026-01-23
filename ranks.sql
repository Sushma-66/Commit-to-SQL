
-- (Rank) question 1 beginner level
transaction_id | customer_name | amount
---------------+---------------+--------
1              | Alice         | 500
2              | Bob           | 1200
3              | Alice         | 700
4              | Charlie       | 1200
5              | Bob           | 300

SELECT
    customer_name,
    SUM(amount) AS total_amount,
    RANK() OVER (
        ORDER BY SUM(amount) DESC
    ) AS spend_rank
FROM transactions
GROUP BY customer_name;
