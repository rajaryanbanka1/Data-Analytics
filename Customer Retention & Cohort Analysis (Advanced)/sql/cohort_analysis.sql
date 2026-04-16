WITH first_purchase AS (
    SELECT customer_id, MIN(order_date) AS first_date
    FROM orders
    GROUP BY customer_id
),

cohort_data AS (
    SELECT 
        o.customer_id,
        DATE_TRUNC('month', f.first_date) AS cohort_month,
        DATE_TRUNC('month', o.order_date) AS order_month
    FROM orders o
    JOIN first_purchase f
    ON o.customer_id = f.customer_id
)

SELECT 
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_id) AS users
FROM cohort_data
GROUP BY cohort_month, order_month
ORDER BY 1,2;
