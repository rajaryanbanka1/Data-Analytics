WITH rfm AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_purchase,
        COUNT(order_id) AS frequency,
        SUM(amount) AS monetary
    FROM orders
    GROUP BY customer_id
)

SELECT 
    *,
    NTILE(3) OVER (ORDER BY last_purchase DESC) AS recency_score,
    NTILE(3) OVER (ORDER BY frequency DESC) AS frequency_score,
    NTILE(3) OVER (ORDER BY monetary DESC) AS monetary_score
FROM rfm;
