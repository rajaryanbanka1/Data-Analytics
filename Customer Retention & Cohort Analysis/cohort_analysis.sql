WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_purchase_date
    FROM transactions
    GROUP BY customer_id
),

cohort_data AS (
    SELECT 
        t.customer_id,
        DATE_TRUNC('month', f.first_purchase_date) AS cohort_month,
        DATE_TRUNC('month', t.order_date) AS order_month
    FROM transactions t
    JOIN first_purchase f 
        ON t.customer_id = f.customer_id
)

SELECT 
    customer_id,
    cohort_month,
    order_month,
    (EXTRACT(YEAR FROM order_month) - EXTRACT(YEAR FROM cohort_month)) * 12 +
    (EXTRACT(MONTH FROM order_month) - EXTRACT(MONTH FROM cohort_month)) AS month_number
FROM cohort_data
ORDER BY customer_id, order_month;
