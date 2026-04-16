WITH cohort_data AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) OVER (PARTITION BY customer_id) AS cohort_month,
        DATE_TRUNC('month', order_date) AS order_month
    FROM transactions
),

retention AS (
    SELECT 
        cohort_month,
        order_month,
        COUNT(DISTINCT customer_id) AS users
    FROM cohort_data
    GROUP BY cohort_month, order_month
)

SELECT 
    cohort_month,
    order_month,
    users,
    ROUND(
        users * 100.0 / FIRST_VALUE(users) OVER (PARTITION BY cohort_month ORDER BY order_month),
        2
    ) AS retention_rate
FROM retention
ORDER BY cohort_month, order_month;
