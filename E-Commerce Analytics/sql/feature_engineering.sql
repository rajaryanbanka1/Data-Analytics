-- Customer revenue
CREATE TABLE customer_features AS
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS avg_order_value,
    MAX(order_date) AS last_order_date
FROM orders_cleaned
GROUP BY customer_id;
