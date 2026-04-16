WITH last_order AS (
    SELECT customer_id, MAX(order_date) AS last_date
    FROM orders
    GROUP BY customer_id
)

SELECT 
    customer_id,
    last_date,
    CASE 
        WHEN last_date < '2023-04-01' THEN 'Churned'
        ELSE 'Active'
    END AS status
FROM last_order;
