WITH first_order AS (
    SELECT customer_id, MIN(order_date) AS first_date
    FROM orders_cleaned
    GROUP BY customer_id
)

SELECT 
    DATE_TRUNC('month', f.first_date) AS cohort,
    DATE_TRUNC('month', o.order_date) AS activity_month,
    COUNT(DISTINCT o.customer_id) AS users
FROM orders_cleaned o
JOIN first_order f
ON o.customer_id = f.customer_id
GROUP BY 1,2;
