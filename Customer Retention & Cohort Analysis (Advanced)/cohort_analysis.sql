-- Step 1: Identify each customer's first purchase date
WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_purchase_date  -- earliest purchase defines cohort
    FROM transactions
    GROUP BY customer_id
),

-- Step 2: Map each transaction to its cohort and order month
cohort_data AS (
    SELECT 
        t.customer_id,

        -- Assign cohort month (month of first purchase)
        DATE_TRUNC('month', f.first_purchase_date) AS cohort_month,

        -- Month of each transaction
        DATE_TRUNC('month', t.order_date) AS order_month
    FROM transactions t
    JOIN first_purchase f 
        ON t.customer_id = f.customer_id
)

-- Step 3: Calculate "month number" (distance from cohort start)
SELECT 
    customer_id,
    cohort_month,
    order_month,

    -- Calculate number of months since first purchase
    (
        (EXTRACT(YEAR FROM order_month) - EXTRACT(YEAR FROM cohort_month)) * 12 +
        (EXTRACT(MONTH FROM order_month) - EXTRACT(MONTH FROM cohort_month))
    ) AS month_number

FROM cohort_data
ORDER BY customer_id, order_month;
