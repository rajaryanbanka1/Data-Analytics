-- Step 1: Assign cohort month using window function
WITH cohort_data AS (
    SELECT 
        customer_id,

        -- First purchase month (cohort assignment)
        DATE_TRUNC('month', MIN(order_date)) 
            OVER (PARTITION BY customer_id) AS cohort_month,

        -- Transaction month
        DATE_TRUNC('month', order_date) AS order_month
    FROM transactions
),

-- Step 2: Count distinct users per cohort per month
cohort_counts AS (
    SELECT 
        cohort_month,
        order_month,
        COUNT(DISTINCT customer_id) AS users  -- active users in that month
    FROM cohort_data
    GROUP BY cohort_month, order_month
),

-- Step 3: Compute cohort size (baseline users)
retention_table AS (
    SELECT 
        cohort_month,
        order_month,
        users,

        -- First value = number of users in cohort month (baseline)
        FIRST_VALUE(users) 
            OVER (PARTITION BY cohort_month ORDER BY order_month) AS cohort_size
    FROM cohort_counts
)

-- Step 4: Calculate retention rate
SELECT 
    cohort_month,
    order_month,
    users,
    cohort_size,

    -- Retention = users / original cohort size
    ROUND(users * 100.0 / cohort_size, 2) AS retention_rate

FROM retention_table
ORDER BY cohort_month, order_month;
