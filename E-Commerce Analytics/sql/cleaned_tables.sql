-- Clean customers
CREATE TABLE customers_cleaned AS
SELECT 
    customer_id,
    COALESCE(signup_date, DATE '2023-01-01') AS signup_date,
    country
FROM customers;

-- Clean orders
CREATE TABLE orders_cleaned AS
SELECT 
    order_id,
    customer_id,
    order_date,
    COALESCE(amount, 0) AS amount
FROM orders;
