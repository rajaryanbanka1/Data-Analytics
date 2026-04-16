-- Identify customers who did not return within 60 days

WITH last_purchase AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date
    FROM transactions
    GROUP BY customer_id
),

customer_activity AS (
    SELECT 
        customer_id,
        last_order_date,

        -- Compare last purchase with current date (or max dataset date)
        CURRENT_DATE - last_order_date AS days_inactive
    FROM last_purchase
)

SELECT 
    customer_id,
    last_order_date,
    days_inactive,

    -- Classify churn status
    CASE 
        WHEN days_inactive > 60 THEN 'Churned'
        ELSE 'Active'
    END AS churn_status

FROM customer_activity;
