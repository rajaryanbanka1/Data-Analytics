-- Step 1: Calculate customer-level metrics
WITH customer_metrics AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(amount) AS total_spent,
        AVG(amount) AS avg_order_value
    FROM transactions
    GROUP BY customer_id
),

-- Step 2: Rank customers by spending
ranked_customers AS (
    SELECT 
        *,
        NTILE(4) OVER (ORDER BY total_spent DESC) AS spending_quartile
    FROM customer_metrics
)

-- Step 3: Segment customers
SELECT 
    customer_id,
    total_orders,
    total_spent,
    ROUND(avg_order_value, 2) AS avg_order_value,

    CASE 
        WHEN spending_quartile = 1 THEN 'High Value'
        WHEN spending_quartile = 2 THEN 'Mid-High Value'
        WHEN spending_quartile = 3 THEN 'Mid-Low Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM ranked_customers
ORDER BY total_spent DESC;
