-- Customer revenue
CREATE TABLE customer_revenue AS
SELECT 
    customer_id,
    SUM(amount) AS total_revenue,
    COUNT(*) AS orders_count
FROM orders_cleaned
GROUP BY customer_id;
